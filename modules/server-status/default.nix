# Local server status display
#
# Reserves tty1 for a status overview (status.sh) so a directly attached
# display shows that the server runs and how it is doing: clock, system,
# network, UPS, ZFS, disk temperatures, Docker stacks, failed units and the
# running NixOS generation with the commit it was built from.
# A normal login remains available on tty2. `server-status` shows the same
# overview in any terminal (as root for disk temperatures).
{
  config,
  lib,
  pkgs,
  ...
}: let
  serverStatus = pkgs.writeShellApplication {
    name = "server-status";
    runtimeInputs = [
      config.boot.zfs.package
      pkgs.apcupsd
      pkgs.coreutils
      pkgs.docker-client
      pkgs.figlet
      pkgs.gawk
      pkgs.iproute2
      pkgs.jq
      pkgs.smartmontools
      pkgs.systemd
      pkgs.util-linux
    ];
    text = builtins.readFile ./status.sh;
  };
in {
  environment.systemPackages = [serverStatus];

  console = {
    font = "ter-v14n";
    packages = [pkgs.terminus_font];
  };

  # Prevent the tty from blanking while it is used as a status display.
  boot.kernelParams = ["consoleblank=0"];

  # tty1 is reserved for the status display; Ctrl+Alt+F2 remains a local login.
  systemd.services."getty@tty1".enable = lib.mkForce false;

  systemd.services.status-screen = {
    description = "Server status display on tty1";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    conflicts = ["getty@tty1.service"];
    unitConfig.ConditionPathExists = "/dev/tty1";

    environment.TERM = "linux";

    serviceConfig = {
      ExecStart = lib.getExe serverStatus;
      Restart = "always";
      RestartSec = "2s";
      TTYPath = "/dev/tty1";
      TTYReset = "yes";
      TTYVHangup = "yes";
      TTYVTDisallocate = "yes";
      StandardInput = "tty-fail";
      StandardOutput = "tty";
      StandardError = "tty";
    };
  };
}
