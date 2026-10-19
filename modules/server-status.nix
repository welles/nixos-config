# Local server status display
#
# Reserves tty1 for btop so a directly attached display shows the server's
# resource usage after boot. A normal login remains available on tty2.
# The user's own btop lists the same disks.
{
  lib,
  pkgs,
  user,
  extraDiskMounts,
  ...
}: let
  # btop only lists mounted filesystems, so the drives themselves never
  # appear. Instead, show the ESP on each boot drive and one dataset per ZFS
  # pool: "/" for the boot pool plus extraDiskMounts for the others. Each
  # dataset reports the free space of its whole pool.
  disksFilter = lib.concatStringsSep " " (["/boot" "/boot-fallback" "/"] ++ extraDiskMounts);

  btopStatusConfig = pkgs.writeText "btop-status.conf" ''
    # Keep btop's defaults, except for graphs: the console font has no
    # braille glyphs, so use Unicode block graphs instead.
    graph_symbol = "block"
    disks_filter = "${disksFilter}"
  '';
in {
  environment.systemPackages = [pkgs.btop];

  home-manager.users.${user}.programs.btop.settings.disks_filter = disksFilter;

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
      ExecStart = "${pkgs.btop}/bin/btop --force-utf --config ${btopStatusConfig}";
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
