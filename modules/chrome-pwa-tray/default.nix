{pkgs, ...}: let
  python = pkgs.python3.withPackages (ps: [ps.pygobject3 ps.python-xlib]);
  tray = pkgs.stdenvNoCC.mkDerivation {
    pname = "chrome-pwa-tray";
    version = "1";
    dontUnpack = true;
    nativeBuildInputs = [pkgs.gobject-introspection pkgs.wrapGAppsHook3];
    buildInputs = [pkgs.cinnamon pkgs.gtk3 pkgs.libwnck pkgs.xapp];
    installPhase = ''
      runHook preInstall
      install -Dm755 ${./tray.py} "$out/bin/chrome-pwa-tray"
      substituteInPlace "$out/bin/chrome-pwa-tray" \
        --replace-fail '#!/usr/bin/env python3' '#!${python}/bin/python3'
      runHook postInstall
    '';
  };
in {
  imports = [../cinnamon.nix ../packages/google-chrome.nix];

  environment.etc."xdg/autostart/chrome-pwa-tray.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Chrome web app tray
    Exec=${tray}/bin/chrome-pwa-tray
    OnlyShowIn=X-Cinnamon;
    Terminal=false
  '';
}
