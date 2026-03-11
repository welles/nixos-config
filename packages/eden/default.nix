{
  pkgs,
  lib,
  ...
}: let
  pname = "eden";
  version = "0.2.0-rc1";
  src = pkgs.fetchurl {
    url = "https://git.eden-emu.dev/eden-emu/eden/releases/download/v${version}/Eden-Linux-v${version}-amd64-gcc-standard.AppImage";
    hash = "sha256-jPyPrVvG6pFex5MkUvRFhXcGo8FOI5iuODyLe/5FWlI=";
  };
  appimageContents = pkgs.appimageTools.extractType2 {
    inherit pname version src;
  };
  eden-emu = pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    extraPkgs = pkgs:
      with pkgs; [
        libthai
        libglvnd
        libx11
        libxcursor
        libxext
        libxfixes
        libxi
        libxrender
        libGL
        vulkan-loader
        alsa-lib
        libpulseaudio
      ];
    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/dev.eden_emu.eden.desktop $out/share/applications/dev.eden_emu.eden.desktop
      install -m 444 -D ${appimageContents}/dev.eden_emu.eden.svg $out/share/icons/hicolor/scalable/apps/dev.eden_emu.eden.svg
      substituteInPlace $out/share/applications/dev.eden_emu.eden.desktop \
        --replace 'Exec=eden' "Exec=$out/bin/${pname}"
    '';

    meta = with lib; {
      description = "Switch 1 emulator derived from Yuzu and Sudachi";
      homepage = "https://eden-emu.dev/";
      license = licenses.gpl3Plus;
      platforms = ["x86_64-linux"];
    };
  };
in {
  environment.systemPackages = [eden-emu];
}
