# Eden Emulator Package
#
# Wraps the Eden AppImage (a Nintendo Switch emulator derived from
# Yuzu/Sudachi) using buildFHSEnv. The AppImage is extracted with
# dwarfs and bundled with the required graphics, audio, and input
# libraries.
{
  pkgs,
  lib,
  ...
}: let
  pname = "eden";
  version = "0.2.0-rc2";
  src = pkgs.fetchurl {
    url = "https://git.eden-emu.dev/eden-emu/eden/releases/download/v${version}/Eden-Linux-v${version}-amd64-gcc-standard.AppImage";
    hash = "sha256-1Pp6VInWYfr8f8ANuT1ZBxe61xCWcTq/mNH8T6JZJJc=";
  };

  appimageContents =
    pkgs.runCommand "${pname}-extracted" {
      nativeBuildInputs = [pkgs.dwarfs];
    } ''
      mkdir -p $out
      dwarfsextract -i ${src} -o $out --image-offset 1483248
    '';

  eden-emu = pkgs.appimageTools.wrapAppImage {
    inherit pname version;
    src = appimageContents;
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
  environment.systemPackages = with pkgs; [
    eden-emu
  ];
}
