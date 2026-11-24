# NixOS control units
#
# Lets the control center (modules/control-center) update and restart this
# host without a login: `nixos-diff`, `nh os switch` and `nh os boot` of the
# flake on GitHub run as the oneshot units nixos-control-{diff,switch,boot}
# as root, and the command `nixos-control` (nixos-control.py, root only)
# reports the host's state, starts these units, reboots or powers off and
# returns the journal of an action's last run as JSON.
#
# The control center calls `nixos-control` directly on its own host and
# through the QEMU guest agent in its VMs, so a VM only needs this module and
# the guest agent (services.qemuGuest), no network access from the server.
#
# The units keep their last result (RemainAfterExit) until the next run or
# reboot, and a switch neither restarts nor stops them, so a running switch
# survives its own activation (like nixos-upgrade.service).
{
  config,
  lib,
  pkgs,
  hostname,
  ...
}: let
  flake = "github:welles/nixos-config#${hostname}";

  nixosDiff = import ../nixos-tools/nixos-diff.nix {inherit pkgs flake;};

  # As root and without elevation; no nix-output-monitor in the journal
  nh = action: "${lib.getExe pkgs.nh} os ${action} ${flake} --elevation-strategy none --no-nom -- --refresh";

  nixosControl = pkgs.writers.writePython3Bin "nixos-control" {
    flakeIgnore = ["E501"];
  } (builtins.readFile ./nixos-control.py);

  actionUnit = description: command: {
    inherit description;
    wants = ["network-online.target"];
    after = ["network-online.target"];
    path = [config.nix.package pkgs.gitMinimal];
    environment.HOME = "/root";
    restartIfChanged = false;
    stopIfChanged = false;
    unitConfig.X-StopOnRemoval = false;
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = command;
    };
  };
in {
  environment.systemPackages = [nixosControl];

  systemd.services = {
    nixos-control-diff = actionUnit "Show what a switch to ${flake} would change" (lib.getExe nixosDiff);
    nixos-control-switch = actionUnit "Switch to ${flake}" (nh "switch");
    nixos-control-boot = actionUnit "Make ${flake} the boot default" (nh "boot");
  };
}
