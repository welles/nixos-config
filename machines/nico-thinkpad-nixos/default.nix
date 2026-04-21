# Lenovo ThinkPad Machine Configuration
#
# Hardware-specific settings for the ThinkPad convertible laptop.
# Uses ZFS with impermanence: main/root is rolled back to a blank
# snapshot on every boot; only data explicitly listed in impermanence.nix
# survives via bind-mounts from main/persist.
{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./impermanence.nix
    ./fritzbox-wireguard.nix
    ./mobile-network.nix
  ];

  # Required by ZFS — must be unique across all machines in the pool.
  # Point the sops age key directly at the persist path, bypassing the
  # /var/lib/sops-nix bind mount. That bind mount is set up by systemd
  # (impermanence), which runs after the stage-2 activation script where
  # sops reads the key — causing sops to fail on every boot. /persist is
  # marked neededForBoot so it is available in stage 1, making the key
  # readable in time. Mirrors the pattern used in schokoladenelch.
  sops.age.keyFile = lib.mkForce "/persist/var/lib/sops-nix/key.txt";

  networking.hostId = "0aea17fa";

  # ZFS boot: load ZFS in initrd, import the pool, and roll back the
  # ephemeral root dataset to blank before the rest of the system mounts.
  boot = {
    initrd = {
      supportedFilesystems = ["zfs"];
      # Ensure nvme module is unconditionally loaded early in initrd (before ZFS
      # pool scanning), avoiding a race where udev hasn't yet loaded it from
      # availableKernelModules when zpool import runs.
      kernelModules = ["nvme"];
      systemd.services.rollback-root = {
        description = "Rollback ZFS root dataset to a blank snapshot";
        wantedBy = ["initrd.target"];
        after = ["zfs-import-main.service"];
        before = ["sysroot.mount"];
        path = [pkgs.zfs];
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = ''
          echo ""
          echo -e "\e[1;97;44m======================================================\e[0m"
          echo -e "\e[1;97;44m===           ZFS IMPERMANENCE ROLLBACK            ===\e[0m"
          echo -e "\e[1;97;44m======================================================\e[0m"
          echo ""
          if zfs rollback -r main/root@blank; then
            echo -e "    \e[1;30;42m  [ OK ]  \e[0m  \e[1;32mmain/root rolled back to @blank\e[0m"
          else
            echo -e "    \e[1;97;41m  [FAIL]  \e[0m  \e[1;31mno blank snapshot found for main/root\e[0m"
          fi
          echo ""
        '';
      };
    };
    supportedFilesystems = ["zfs" "exfat"];
    zfs = {
      devNodes = "/dev/disk/by-id";
      forceImportAll = true;
    };

    # Add ZFS support to the GRUB bootloader (configured in configurations/nico/boot.nix).
    # efiSysMountPoint must match disko's mountpoint for the ESP partition.
    loader = {
      grub.zfsSupport = true;
      efi.efiSysMountPoint = "/boot";
    };
  };

  hardware = {
    bluetooth.enable = true;
    sensor.iio.enable = true;
  };

  environment.systemPackages = with pkgs; [
    libinput
    iio-sensor-proxy
    maliit-keyboard
  ];

  # services.fprintd.enable = true;

  networking.firewall.enable = true;
}
