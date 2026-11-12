# Chrome extension that keeps Google Chat's and Gmail's unread counts in their
# window titles, as "Google Chat (3) - Chat" or "Gmail - Posteingang (3)".
# Chat reports the count only as app
# badge (navigator.setAppBadge), which Chrome doesn't show on Linux; window
# lists that read counts from titles (see the window list in cinnamon.nix)
# show it this way.
# The title starts with the installed app name because Chrome 157 otherwise
# hides it in standalone app windows (see CURRENT_WORKAROUNDS.md).
#
# Chrome doesn't load unpacked extensions from the command line any more, so
# it is loaded once by hand: chrome://extensions → Developer mode → Load
# unpacked → ~/.local/share/chrome-extensions/google-chat-unread-title. The
# files are copied there on every activation instead of linked into the
# store: Chrome remembers the resolved path, which a rebuild would leave
# behind. After a change, "Reload" on the extension picks it up.
_: {
  imports = [../packages/google-chrome.nix];

  home-manager.sharedModules = [
    ({
      config,
      lib,
      ...
    }: {
      home.activation.googleChatUnreadTitle = lib.hm.dag.entryAfter ["writeBoundary"] ''
        dir=${config.xdg.dataHome}/chrome-extensions/google-chat-unread-title
        run rm -rf "$dir"
        run mkdir -p "$dir"
        run cp ${./manifest.json} "$dir/manifest.json"
        run cp ${./content.js} "$dir/content.js"
      '';
    })
  ];
}
