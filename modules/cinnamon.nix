# Cinnamon Desktop over RDP
#
# Cinnamon on X11, for hosts used over RDP (xrdp only starts X11 sessions,
# which Plasma dropped with 6.8). Sets `xrdpSession` for xrdp.nix: the
# software-rendering variant of Cinnamon, as xrdp's X server has no OpenGL
# acceleration. xrdp's X server takes the keyboard layout from the RDP client
# instead of services.xserver.xkb (keyboard.nix), so the session sets it
# again before Cinnamon starts.
#
# Look: dark mode with the Mint-Y theme in orange, and a 48px panel with the
# white NixOS snowflake as menu icon and a window list that shows each window
# with its title, ungrouped. The background changes every hour to a random dark
# KDE wallpaper. GNOME Terminal (Cinnamon's terminal) uses FiraCode Nerd
# Font 10 with pastel colours on #212226, Qt applications follow the GTK
# theme. No screen locking or blanking.
# Set in dconf by
# Home Manager on every activation (changes in Cinnamon's settings don't
# last).
#
# Cinnamon keeps logins (VS Code, Chrome, gh etc.) in the GNOME keyring,
# persisted on impermanence hosts.
{
  config,
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: let
  # Flat directory for the background slideshow (it doesn't look into
  # subdirectories), with the dark variant of every KDE wallpaper that has one,
  # in the largest 16:9 size (Patak has no 5120x2880)
  darkWallpapers = pkgs.runCommand "cinnamon-dark-wallpapers" {} ''
    mkdir $out
    for dir in ${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/*/contents/images_dark; do
      name=$(basename "$(dirname "$(dirname "$dir")")")
      image=$(ls "$dir"/5120x2880.* "$dir"/3840x2160.* 2>/dev/null | head -n 1)
      ln -s "$image" "$out/$name.''${image##*.}"
    done
  '';
in {
  # Terminal font
  imports = [./packages/nerd-fonts-fira-code.nix];

  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
  };

  _module.args.xrdpSession = "${pkgs.writeShellScript "xrdp-cinnamon-session" ''
    ${lib.getExe pkgs.setxkbmap} ${config.services.xserver.xkb.layout}
    exec ${pkgs.cinnamon}/bin/cinnamon-session-cinnamon2d
  ''}";

  # Dark mode with Mint-Y in orange: GTK applications, window borders, the
  # Cinnamon panel and menus, icons, and the preference the portal reports to
  # applications (GTK 4, Electron, browsers)
  home-manager.sharedModules = [
    ({lib, ...}: {
      # Qt applications (kdiff3, TortoiseHg) take colours and dialogs from
      # the GTK theme instead of the light Fusion default
      qt = {
        enable = true;
        platformTheme.name = "gtk3";
      };

      dconf.settings = {
        # GNOME Terminal's default profile (the uuid is fixed by GNOME
        # Terminal) with FiraCode Nerd Font and pastel colours on a dark
        # grey background. FiraCode's ligatures stay off: GNOME Terminal's
        # VTE widget doesn't render ligatures.
        "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
          visible-name = "Default";
          use-system-font = false;
          font = "FiraCode Nerd Font 10";
          use-theme-colors = false;
          background-color = "#212226";
          foreground-color = "#dcdfe4";
          bold-color-same-as-fg = true;
          cursor-colors-set = true;
          cursor-background-color = "#dcdfe4";
          cursor-foreground-color = "#212226";
          highlight-colors-set = true;
          highlight-background-color = "#3d4150";
          highlight-foreground-color = "#eceef2";
          # black, red, green, yellow, blue, magenta, cyan, white; then
          # the same as bright variants
          palette = [
            "#2e3036"
            "#f2a3a8"
            "#b5dfa6"
            "#f4dc9e"
            "#9ec5f2"
            "#d3b0f0"
            "#9fdcd8"
            "#c9ccd3"
            "#5c6070"
            "#f7bdc1"
            "#cbe9c0"
            "#f8e7b9"
            "#b9d6f6"
            "#e1c8f5"
            "#bae7e4"
            "#eceef2"
          ];
        };

        "org/cinnamon/desktop/interface" = {
          gtk-theme = "Mint-Y-Dark-Orange";
          icon-theme = "Mint-Y-Orange";
        };
        "org/cinnamon/desktop/wm/preferences".theme = "Mint-Y-Dark-Orange";
        "org/cinnamon/theme".name = "Mint-Y-Dark-Orange";
        "org/x/apps/portal".color-scheme = "prefer-dark";

        # Cinnamon's default panel, with the window list that shows one
        # button with its title per window instead of grouping them by
        # application. Entries are panel:side:position:applet:instance id.
        "org/cinnamon".enabled-applets = lib.imap0 (id: applet: "panel1:${applet}:${toString id}") [
          "left:0:menu@cinnamon.org"
          "left:1:separator@cinnamon.org"
          "left:2:window-list@cinnamon.org"
          "right:0:systray@cinnamon.org"
          "right:1:xapp-status@cinnamon.org"
          "right:2:notifications@cinnamon.org"
          "right:3:printers@cinnamon.org"
          "right:4:removable-drives@cinnamon.org"
          "right:5:keyboard@cinnamon.org"
          "right:6:favorites@cinnamon.org"
          "right:7:network@cinnamon.org"
          "right:8:sound@cinnamon.org"
          "right:9:power@cinnamon.org"
          "right:10:calendar@cinnamon.org"
          "right:11:cornerbar@cinnamon.org"
        ];

        # White NixOS snowflake (from nixos-icons, installed on graphical
        # desktops) instead of the Cinnamon logo as the icon of the menu applet
        "org/cinnamon".app-menu-icon-name = "nix-snowflake-white";

        # Panel 48px high, with 32px icons on the left and in the center and
        # 16px icons on the right (systray, status icons). Both for coloured
        # and symbolic icons; the sizes are JSON strings per panel.
        "org/cinnamon".panels-height = ["1:48"];
        "org/cinnamon".panel-zone-icon-sizes = builtins.toJSON [
          {
            panelId = 1;
            left = 32;
            center = 32;
            right = 16;
          }
        ];
        "org/cinnamon".panel-zone-symbolic-icon-sizes = builtins.toJSON [
          {
            panelId = 1;
            left = 32;
            center = 32;
            right = 16;
          }
        ];

        # Slideshow of the dark KDE wallpapers, a random one every hour
        "org/cinnamon/desktop/background/slideshow" = {
          slideshow-enabled = true;
          image-source = "directory://${darkWallpapers}";
          random-order = true;
          delay = 60;
        };

        # No screen locking or blanking: the session is only reachable over
        # RDP, which already asks for the password, and isn't left at a
        # screen anyone else could use
        "org/cinnamon/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
        "org/cinnamon/desktop/screensaver" = {
          idle-activation-enabled = false;
          lock-enabled = false;
        };
        "org/cinnamon/settings-daemon/plugins/power".sleep-display-ac = 0;
      };
    })
  ];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/keyrings"];
  };
}
