# The primary user's xrdp desktop session in the browser through KasmVNC,
# next to RDP (packages/kasmvnc.nix, xrdp-boot-session.nix)
#
# KasmVNC's X server runs an empty display, and kasmxproxy copies the xrdp
# session's screen into it and sends the keyboard and mouse back; the browser
# connects to KasmVNC's web client, which encodes the screen as JPEG/WebP.
# xrdp keeps running as before, so RDP and this work side by side; if this
# breaks, RDP is unaffected.
#
# The web client has no login of its own and listens on localhost only, port
# 6901: publish it with a Cloudflare Tunnel of this host (cloudflared.nix,
# cloudflare/devbox-vnc.tf), whose cloudflared rejects requests that did not
# pass Cloudflare Access. Nothing in the LAN reaches it.
#
# The xrdp session is the first one sesman starts (the boot session), so its
# display is :10 (X11DisplayOffset); KasmVNC uses :20.
#
# The browser sends KasmVNC the characters typed, which its X server turns
# into keys by its own layout, and kasmxproxy passes on the keys; KasmVNC's
# layout has to be the session's (German, xrdp-keyboard-default-de.nix), or
# the session reads US keys. kasmxproxy resizes the session to the browser
# window; an RDP login sets it back to the RDP client's size.
{
  lib,
  pkgs,
  user,
  ...
}: let
  port = 6901;
  appDisplay = ":10";
  vncDisplay = ":20";
in {
  imports = [
    ./packages/kasmvnc.nix
    ./xrdp-boot-session.nix
  ];

  systemd.services = {
    kasmvnc = {
      description = "KasmVNC X server and web client";
      wantedBy = ["multi-user.target"];
      after = ["network-online.target"];
      wants = ["network-online.target"];
      serviceConfig = {
        User = user;
        # Xkasmvnc and kasmxproxy come from packages/kasmvnc.nix
        ExecStart = builtins.concatStringsSep " " [
          "/run/current-system/sw/bin/Xkasmvnc"
          vncDisplay
          "-geometry 1920x1080"
          "-depth 24"
          "-nolisten tcp"
          "-interface 127.0.0.1"
          "-websocketPort ${toString port}"
          "-sslOnly 0"
          "-DisableBasicAuth"
          "-SecurityTypes None"
          "-rfbport -1"
          # Otherwise it asks a public service for this host's address, for
          # UDP connections the browser never makes through the tunnel
          "-publicIP 127.0.0.1"
        ];
        # Its layout once the display is up; it starts with US
        ExecStartPost = pkgs.writeShellScript "kasmvnc-keyboard" ''
          for _ in $(seq 30); do
            ${lib.getExe pkgs.setxkbmap} -display ${vncDisplay} -model pc105 -layout de && exit 0
            sleep 1
          done
          exit 1
        '';
        Restart = "always";
        RestartSec = "5s";
      };
    };

    kasmxproxy = {
      description = "Mirror the xrdp session into KasmVNC";
      wantedBy = ["multi-user.target"];
      after = ["kasmvnc.service" "xrdp-boot-session.service"];
      requires = ["kasmvnc.service"];
      environment.XAUTHORITY = "/home/${user}/.Xauthority";
      serviceConfig = {
        User = user;
        ExecStart = "/run/current-system/sw/bin/kasmxproxy -a ${appDisplay} -v ${vncDisplay} -f 30 -r";
        # Until the xrdp session's display is up
        Restart = "always";
        RestartSec = "5s";
      };
    };
  };
}
