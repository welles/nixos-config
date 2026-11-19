# NVIDIA power-brake clock cap
#
# For laptops that may run on a power source too weak for the NVIDIA GPU
# (e.g. a USB-C charger instead of the original power adapter): the charger
# then asserts "HW Power Brake", which cuts the GPU clocks for a moment over
# and over again and shows up as hard frame drops in games.
#
# A service watches the driver's "HW Power Braking" counter while the GPU is
# awake. As long as the GPU keeps braking, it lowers a cap on the graphics
# clock step by step (`nvidia-smi --lock-gpu-clocks 0,<cap>`), so the GPU
# draws less and runs steadily instead of stuttering. The cap holds until a
# power source is plugged in or out; then it is lifted and the GPU gets full
# clocks again until it brakes on the new source. Laptop GPUs do not allow
# lowering the power limit itself (`nvidia-smi -pl`), only the clocks.
#
# Every nvidia-smi call counts as GPU activity. So the service never queries
# a sleeping GPU, and once the GPU is idle (0 % utilization) it leaves it
# alone for 30 s, so the driver can put it to sleep (runtime D3).
#
# Log: `journalctl -u nvidia-power-brake-clock-cap`.
{
  config,
  pkgs,
  ...
}: let
  nvidiaSmi = "${config.hardware.nvidia.package.bin}/bin/nvidia-smi";

  watcher = pkgs.writeShellApplication {
    name = "nvidia-power-brake-clock-cap";
    runtimeInputs = [pkgs.coreutils pkgs.gawk];
    text = ''
      # Graphics clock caps in MHz, tried from top to bottom while braking.
      caps=(2400 2100 1800 1500 1200)
      interval=2
      # Intervals to leave an idle GPU alone (30 s), so it can go to sleep.
      idle_steps=15
      # Braking time (µs) within one interval that counts as braking.
      threshold=200000

      # The NVIDIA GPU's PCI device, to see whether it is awake.
      gpu=""
      for dev in /sys/bus/pci/devices/*; do
        if [[ "$(cat "$dev/vendor")" == 0x10de && "$(cat "$dev/class")" == 0x03* ]]; then
          gpu="$dev"
          break
        fi
      done
      if [[ -z "$gpu" ]]; then
        echo "No NVIDIA GPU found."
        exit 0
      fi

      # Which power sources (adapters, USB-C ports) are connected.
      power_sources() {
        local supply
        for supply in /sys/class/power_supply/*; do
          [[ "$(cat "$supply/type")" == Battery ]] && continue
          printf '%s=%s ' "''${supply##*/}" "$(cat "$supply/online" 2>/dev/null || echo ?)"
        done
      }

      # Prints the braking counter (µs) and the GPU utilization (%).
      gpu_stats() {
        ${nvidiaSmi} -q -d PERFORMANCE,UTILIZATION |
          awk '/HW Power Braking/ {b = $5} /^ *GPU *:/ {u = $3} END {print b, u}'
      }

      level=-1    # index into caps; -1 = no cap
      applied=0   # whether the cap is currently set in the driver
      last=""     # last counter reading
      sources="$(power_sources)"

      lift() {
        if ((level >= 0)); then
          ${nvidiaSmi} --reset-gpu-clocks >/dev/null || true
          echo "Clock cap lifted."
        fi
        level=-1
        applied=0
        last=""
      }

      # Waits up to idle_steps intervals without touching the GPU, so the
      # driver can put an idle GPU to sleep (every nvidia-smi call counts as
      # activity). Only reads sysfs; ends early when the GPU wakes up again.
      idle_wait() {
        local step slept=0
        for ((step = 0; step < idle_steps; step++)); do
          sleep "$interval"
          if [[ "$(cat "$gpu/power/runtime_status")" != active ]]; then
            slept=1
            applied=0
            last=""
          elif ((slept)); then
            return
          fi
        done
      }

      while true; do
        sleep "$interval"

        now_sources="$(power_sources)"
        if [[ "$now_sources" != "$sources" ]]; then
          echo "Power sources changed: $now_sources"
          sources="$now_sources"
          lift
        fi

        # Leave a sleeping GPU alone: nvidia-smi would wake it up.
        if [[ "$(cat "$gpu/power/runtime_status")" != active ]]; then
          applied=0
          last=""
          continue
        fi

        if ((level >= 0 && applied == 0)); then
          ${nvidiaSmi} --lock-gpu-clocks "0,''${caps[level]}" >/dev/null && applied=1
        fi

        read -r counter utilization < <(gpu_stats) || continue
        [[ "$counter" =~ ^[0-9]+$ ]] || continue

        if [[ -n "$last" ]] && ((counter - last > threshold && level < ''${#caps[@]} - 1)); then
          level=$((level + 1))
          if ${nvidiaSmi} --lock-gpu-clocks "0,''${caps[level]}" >/dev/null; then
            applied=1
            echo "GPU braked for $(((counter - last) / 1000)) ms; graphics clock capped at ''${caps[level]} MHz."
          fi
        fi
        last="$counter"

        if [[ "$utilization" == 0 ]]; then
          idle_wait
        fi
      done
    '';
  };
in {
  imports = [./nvidia-base.nix];

  systemd.services.nvidia-power-brake-clock-cap = {
    description = "Cap the NVIDIA GPU clock while the power source makes it brake";
    wantedBy = ["multi-user.target"];
    after = ["systemd-modules-load.service"];
    serviceConfig = {
      ExecStart = "${watcher}/bin/nvidia-power-brake-clock-cap";
      ExecStopPost = "-${nvidiaSmi} --reset-gpu-clocks";
      Restart = "on-failure";
      RestartSec = 10;
    };
  };
}
