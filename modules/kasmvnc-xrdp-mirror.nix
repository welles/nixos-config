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
# cloudflare/devbox.tf), whose cloudflared rejects requests that did not
# pass Cloudflare Access. Nothing in the LAN reaches it.
#
# The xrdp session is the first one sesman starts (the boot session), so its
# display is :10 (X11DisplayOffset); KasmVNC uses :20.
#
# The browser sends KasmVNC the characters typed, which its X server turns
# into keys by its own layout, and kasmxproxy passes on the key codes as
# they are. KasmVNC's keymap has to be the session's: German (cinnamon.nix
# sets it when the session starts), or the session reads US keys, and
# xorgxrdp's key codes (the xfree86 ones of the `base` rules) instead of the
# default evdev ones, or arrow keys, AltGr etc. arrive as other keys.
#
# kasmxproxy resizes the session to the browser window while no RDP client
# is connected (xrdp-resize-without-client); an RDP login sets it back to
# the RDP client's size.
#
# kasmxproxy mirrors only the screen and the input, not the clipboard: what
# the browser pastes lands in KasmVNC's display, what is copied in the
# session stays in the session's. kasmvnc-clipboard copies the CLIPBOARD
# selection's text between the two whenever it changes on either side.
# PRIMARY stays apart, or every text selected in the session would replace
# the browser's clipboard.
{
  lib,
  pkgs,
  user,
  ...
}: let
  port = 6901;
  appDisplay = ":10";
  vncDisplay = ":20";

  clipboardSync = pkgs.writeShellApplication {
    name = "kasmvnc-clipboard";
    runtimeInputs = with pkgs; [clipnotify coreutils diffutils xclip];
    text = ''
      dir=$(mktemp -d)
      trap 'rm -rf "$dir"' EXIT

      # The CLIPBOARD text of display $1, into file $2; fails when there is
      # none (no owner, or an image)
      read_clipboard() {
        timeout 2 xclip -display "$1" -selection clipboard -o -t UTF8_STRING > "$2" 2>/dev/null
      }

      # Copies the text from display $1 to display $2. The copy changes the
      # selection of $2, whose watcher then finds the same text on both
      # sides and stops there.
      copy() {
        read_clipboard "$1" "$dir/from$1" || return 0
        if read_clipboard "$2" "$dir/to$2" && cmp -s "$dir/from$1" "$dir/to$2"; then
          return 0
        fi
        # xclip stays in the background as the selection's owner until the
        # next copy replaces it
        xclip -display "$2" -selection clipboard -i < "$dir/from$1"
      }

      # clipnotify exits on every selection change of its display, and
      # fails while the display is not up
      watch() {
        while DISPLAY=$1 clipnotify; do
          copy "$1" "$2"
        done
      }

      watch ${vncDisplay} ${appDisplay} &
      watch ${appDisplay} ${vncDisplay} &
      # When one of the displays is gone, systemd starts both anew
      wait -n
      exit 1
    '';
  };
in {
  imports = [
    ./packages/kasmvnc.nix
    ./xrdp-boot-session.nix
    ./xrdp-resize-without-client
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
        # Its keymap once the display is up; it starts with US and evdev
        ExecStartPost = pkgs.writeShellScript "kasmvnc-keyboard" ''
          for _ in $(seq 30); do
            ${lib.getExe pkgs.setxkbmap} -display ${vncDisplay} -rules base -model pc105 -layout de && exit 0
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

    kasmvnc-clipboard = {
      description = "Copy the clipboard between the xrdp session and KasmVNC";
      wantedBy = ["multi-user.target"];
      after = ["kasmvnc.service" "xrdp-boot-session.service"];
      requires = ["kasmvnc.service"];
      environment.XAUTHORITY = "/home/${user}/.Xauthority";
      serviceConfig = {
        User = user;
        ExecStart = lib.getExe clipboardSync;
        # Until the xrdp session's display is up
        Restart = "always";
        RestartSec = "5s";
      };
    };
  };
}
