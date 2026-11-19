# Windows-style taskbar: 48px, blue-grey, 24px apps, 16px status icons,
# rectangular buttons and a two-line clock. The NixOS menu icon and the
# existing ungrouped window list (including web-app badges) stay in use.
{
  lib,
  pkgs,
  ...
}: let
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
    # Settings files aren't watched by Cinnamon; notify a running session.
    # At boot there may be no session yet, and the applet reads the file later.
    ${pkgs.glib}/bin/gdbus call --session \
      --dest org.Cinnamon --object-path /org/Cinnamon \
      --method org.Cinnamon.updateSetting \
      "$(basename "$(dirname "$file")")" "$(basename "$file" .json)" \
      "$key" "$value" >/dev/null 2>&1 || true
  '';

  # Cinnamon's window list, patched so that Chrome web apps (Gmail, Google
  # Chat etc., window class crx_<id>) show the unread count from their window
  # title ("Posteingang (3)") as the badge on their icon. The stock badge
  # counts Cinnamon notifications per process, and all web apps share
  # Chrome's process. Picture-in-picture windows of browsers (always on top
  # and on all workspaces, with the browser's window class instead of the
  # web app's) get no entry at all.
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
                  /chrom|edge|firefox/i.test(metaWindow.get_wm_class() ?? "")) &&'
  '';

  # Keep Mint-Y's menus and assets; override only panel styling.
  panelTheme = pkgs.runCommand "cinnamon-windows-taskbar-theme" {} ''
    cp -r ${pkgs.mint-themes}/share/themes/Mint-Y-Dark-Orange/cinnamon $out
    chmod -R u+w $out
    cat ${./panel.css} >> $out/cinnamon.css
    cp ${./running.svg} $out/windows-running.svg
    cp ${./active.svg} $out/windows-active.svg
  '';
in {
  imports = [../cinnamon.nix];

  home-manager.sharedModules = [
    ({
      config,
      lib,
      ...
    }: {
      dconf.settings = {
        # Cinnamon's default panel, with the window list that shows one
        # button per window instead of grouping them by application. Entries
        # are panel:side:position:applet:instance id.
        # Keep list indices (instance IDs) stable so applet settings survive;
        # positions put notifications below the clock, before the cornerbar.
        "org/cinnamon".enabled-applets = lib.imap0 (id: applet: "panel1:${applet}:${toString id}") [
          "left:0:menu@cinnamon.org"
          "left:1:separator@cinnamon.org"
          "left:2:window-list@cinnamon.org"
          "right:0:systray@cinnamon.org"
          "right:1:xapp-status@cinnamon.org"
          "right:10:notifications@cinnamon.org"
          "right:2:printers@cinnamon.org"
          "right:3:removable-drives@cinnamon.org"
          "right:4:keyboard@cinnamon.org"
          "right:5:favorites@cinnamon.org"
          "right:6:network@cinnamon.org"
          "right:7:sound@cinnamon.org"
          "right:8:power@cinnamon.org"
          "right:9:calendar@cinnamon.org"
          "right:11:cornerbar@cinnamon.org"
        ];

        # White NixOS snowflake (from nixos-icons, installed on graphical
        # desktops) instead of the Cinnamon logo as the icon of the menu applet
        "org/cinnamon".app-menu-icon-name = "nix-snowflake-white";

        # A 48px panel, with 24px application icons and
        # 16px icons on the right (systray, status icons). Both for coloured
        # and symbolic icons; the sizes are JSON strings per panel.
        "org/cinnamon".panels-enabled = ["1:0:left"];
        "org/cinnamon".panels-height = ["1:48"];
        "org/cinnamon".panel-zone-icon-sizes = builtins.toJSON [
          {
            panelId = 1;
            left = 24;
            center = 24;
            right = 16;
          }
        ];
        "org/cinnamon".panel-zone-symbolic-icon-sizes = builtins.toJSON [
          {
            panelId = 1;
            left = 24;
            center = 24;
            right = 16;
          }
        ];

        "org/cinnamon".panel-zone-text-sizes = builtins.toJSON [
          {
            panelId = 1;
            left = 9;
            center = 9;
            right = 9;
          }
        ];
        "org/cinnamon/theme".name = "Windows-Taskbar";
      };

      xdg.dataFile."cinnamon/applets/window-list@cinnamon.org".source = windowListWithTitleBadges;

      # Show only icons in the window list. Set on every activation; the file
      # name is the applet's instance id from enabled-applets.
      home.activation.cinnamonWindowListIconsOnly = lib.hm.dag.entryAfter ["writeBoundary"] ''
        run ${setAppletSetting} \
          ${config.xdg.configHome}/cinnamon/spices/window-list@cinnamon.org/2.json \
          panel-show-label false
      '';

      xdg.dataFile."themes/Windows-Taskbar/cinnamon".source = panelTheme;

      # Applet settings stay writable: Cinnamon fills in the rest of each
      # schema and receives changes over D-Bus when a session is running.
      home.activation.cinnamonPanelAppearance = lib.hm.dag.entryAfter ["writeBoundary"] ''
        menu=${config.xdg.configHome}/cinnamon/spices/menu@cinnamon.org/0.json
        run ${setAppletSetting} "$menu" menu-custom true
        run ${setAppletSetting} "$menu" menu-icon '"nix-snowflake-white"'
        run ${setAppletSetting} "$menu" menu-icon-size 24
        run ${setAppletSetting} "$menu" menu-label '""'
        calendar=${config.xdg.configHome}/cinnamon/spices/calendar@cinnamon.org/13.json
        run ${setAppletSetting} "$calendar" use-custom-format true
        run ${setAppletSetting} "$calendar" custom-format '"%H:%M%n%d.%m"'
        run ${setAppletSetting} "$calendar" custom-tooltip-format '"%A, %d. %B %Y"'
        # Keep the notification icon below the clock even when the tray is empty.
        run ${setAppletSetting} \
          ${config.xdg.configHome}/cinnamon/spices/notifications@cinnamon.org/5.json \
          showEmptyTray true
      '';
    })
  ];
}
