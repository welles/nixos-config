{
  lib,
  pkgs,
  ...
}: let
  hostName = "org.nixos.chrome_pwa_external_links";
  # Chrome derives the extension ID from the public key in manifest.json.
  extensionId = "knjlbpfgkghmacffhmlhoflmbmmljgjp";
  opener = pkgs.writeTextFile {
    name = "chrome-pwa-open-url";
    executable = true;
    text = ''
      #!${lib.getExe pkgs.python3}
      ${builtins.replaceStrings ["@gio@"] ["${pkgs.glib}/bin/gio"] (builtins.readFile ./open-url.py)}
    '';
  };
in {
  imports = [../packages/google-chrome.nix];

  environment.etc."opt/chrome/native-messaging-hosts/${hostName}.json".text = builtins.toJSON {
    name = hostName;
    description = "Open Chrome web app links with the desktop's default browser";
    path = "${opener}";
    type = "stdio";
    allowed_origins = ["chrome-extension://${extensionId}/"];
  };

  # Load unpacked once from chrome://extensions. Chrome remembers the
  # resolved path, so copy the files to a stable directory on activation.
  home-manager.sharedModules = [
    ({
      config,
      lib,
      ...
    }: {
      home.activation.chromePwaExternalLinks = lib.hm.dag.entryAfter ["writeBoundary"] ''
        dir=${lib.escapeShellArg "${config.xdg.dataHome}/chrome-extensions/chrome-pwa-external-links"}
        run mkdir -p "$dir"
        run install -m 0644 ${./manifest.json} "$dir/manifest.json"
        run install -m 0644 ${./content.js} "$dir/content.js"
        run install -m 0644 ${./background.js} "$dir/background.js"
      '';
    })
  ];
}
