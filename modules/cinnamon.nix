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
# as its icon, ungrouped (with titles where an application has several
# windows), Chrome web apps with their unread count from the
# window title as badge and without browser picture-in-picture windows. The
# background changes every hour to a random dark KDE wallpaper. GNOME
# Terminal (Cinnamon's terminal) uses FiraCode Nerd Font 10 with pastel
# colours on #212226, Qt applications follow the GTK theme. No screen locking or blanking.
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

  # Sets one value in the settings file of a Cinnamon applet (see the window
  # list below): file, key, value as JSON. Cinnamon writes the file itself,
  # so it can't be a link into the store. A file that doesn't exist yet gets
  # just this value; Cinnamon completes it from the applet's schema and keeps
  # the value.
  setAppletSetting = pkgs.writeShellScript "cinnamon-set-applet-setting" ''
    file=$1 key=$2 value=$3
    mkdir -p "$(dirname "$file")"
    if [ -s "$file" ]; then current=$(cat "$file"); else current='{}'; fi
    echo "$current" | ${lib.getExe pkgs.jq} --arg key "$key" --argjson value "$value" \
      '.[$key].value = $value' > "$file.tmp"
    mv "$file.tmp" "$file"
  '';

  # Cinnamon's window list, patched so that Chrome web apps (Gmail, Google
  # Chat etc., window class crx_<id>) show the unread count from their window
  # title ("Posteingang (3)") as the badge on their icon. The stock badge
  # counts Cinnamon notifications per process, and all web apps share
  # Chrome's process. Picture-in-picture windows of browsers (always on top
  # and on all workspaces, with the browser's window class instead of the
  # web app's) get no entry at all. Window titles show only while an
  # application has several windows; each web app counts as an application
  # of its own (its desktop file matches crx_<id>), separate from Chrome.
  # Installed under the same uuid in the user's applet
  # directory, which Cinnamon prefers over the system one, so the panel
  # entry and its settings stay. --replace-fail breaks the build when a
  # Cinnamon update changes the patched lines.
  windowListWithTitleBadges = pkgs.runCommand "cinnamon-window-list-title-badges" {} ''
    cp -r ${pkgs.cinnamon}/share/cinnamon/applets/window-list@cinnamon.org $out
    chmod -R u+w $out
    substituteInPlace $out/applet.js \
      --replace-fail \
        'const nCount = Main.notificationDaemon.getNotificationCountForApp(this.app);' \
        'const titleCount = this.metaWindow.get_wm_class_instance()?.startsWith("crx_")
                ? (this.metaWindow.get_title()?.match(/\((\d[\d.]*\+?)\)/)?.[1] ?? "0")
                : null;
            const nCount = titleCount ?? Main.notificationDaemon.getNotificationCountForApp(this.app);' \
      --replace-fail \
        'if (nCount > 0 && this._applet.enableNotifications)' \
        'if (parseInt(nCount) > 0 && this._applet.enableNotifications)' \
      --replace-fail \
        'this._label.set_text(title);' \
        'this._label.set_text(title);
            this.updateNotificationsBadge();' \
      --replace-fail \
        '!metaWindow.is_skip_taskbar() &&' \
        '!metaWindow.is_skip_taskbar() &&
                !(metaWindow.is_above() && metaWindow.is_on_all_workspaces() &&
                  /chrom|edge|firefox/i.test(metaWindow.get_wm_class() ?? "")) &&' \
      --replace-fail \
        'if (this._applet.showLabelPanel) {' \
        'const sameApp = this.appId && this._applet._windows.some(window =>
                window !== this && !window.transient && window.appId === this.appId);
            if (this._applet.showLabelPanel || sameApp) {' \
      --replace-fail \
        '_updateAllIconGeometry() {' \
        '_updateAllIconGeometry() {
            this._updateLabels();'
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
    ({
      config,
      lib,
      ...
    }: {
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
        # button per window instead of grouping them by application. Entries
        # are panel:side:position:applet:instance id.
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

      xdg.dataFile."cinnamon/applets/window-list@cinnamon.org".source = windowListWithTitleBadges;

      # The window list shows only the icons, without the window titles
      # (except for applications with several windows, see
      # windowListWithTitleBadges); set on every activation, it takes effect at the next login. The file name
      # is the applet's instance id from enabled-applets.
      home.activation.cinnamonWindowListIconsOnly = lib.hm.dag.entryAfter ["writeBoundary"] ''
        run ${setAppletSetting} \
          ${config.xdg.configHome}/cinnamon/spices/window-list@cinnamon.org/2.json \
          panel-show-label false
      '';
    })
  ];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/keyrings"];
  };
}
