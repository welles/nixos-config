# Local server status display
#
# Reserves tty1 for btop so a directly attached display shows the server's
# resource usage after boot. A normal login remains available on tty2.
{
  lib,
  pkgs,
  ...
}: let
  btopStatusConfig = pkgs.writeText "btop-status.conf" ''
    # Use settings that render reliably on a Linux virtual terminal.
    color_theme = "TTY"
    theme_background = false
    truecolor = false
    force_tty = true
    graph_symbol = "tty"

    # Keep the layout readable on the 800x480 display.
    shown_boxes = "cpu mem net"
    cpu_single_graph = true
    update_ms = 1500
  '';
in {
  environment.systemPackages = [pkgs.btop];

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
      ExecStart = "${pkgs.btop}/bin/btop --config ${btopStatusConfig}";
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
