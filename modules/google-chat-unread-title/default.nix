# Chrome extension that puts Google Chat's unread count in front of its window
# title, as "(3) Google Chat - Chat". Chat reports the count only as app
# badge (navigator.setAppBadge), which Chrome doesn't show on Linux; window
# lists that read counts from titles (see the window list in cinnamon.nix)
# show it this way.
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
