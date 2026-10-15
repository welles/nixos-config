# Cheat Engine Package
#
# Packages the native Linux build of Cheat Engine (Lazarus/Qt6). The release
# ships as a zip with a prebuilt binary plus bundled libraries (libQt6Pas,
# OpenSSL 1.1, Lua, TCC, ...), so the binaries are patched with
# autoPatchelfHook and wrapped with the Qt6 hooks. Settings are stored in
# $XDG_CONFIG_HOME, so the read-only install directory is fine.
#
# Reading other processes' memory needs ptrace access. Yama blocks that for
# unprivileged processes by default (ptrace_scope=1), so the module relaxes it
# to 0 (the setting Cheat Engine's readme-linux.txt recommends) instead of
# requiring Cheat Engine to run as root.
{
  pkgs,
  lib,
  ...
}: let
  pname = "cheatengine";
  # The download URL encodes the version without dots (7.7.1 -> 771). Bump
  # version + hash together when updating: check
  # https://www.cheatengine.org/downloads.php for the latest Linux release.
  version = "7.7.1";

  src = pkgs.fetchurl {
    url = "https://cheatengine.org/download/CheatEngineLinux${lib.replaceStrings ["."] [""] version}.zip";
    hash = "sha256-D7DZBDroVqzeA7W4caLzYn689nSurNBF+G1W2RoH8Xc=";
  };

  icon = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/cheat-engine/cheat-engine/ec45d5f47f92a239ba0bf51ec5d04a7509c3fd37/Cheat%20Engine/images/celogo.png";
    hash = "sha256-MNq3cEvgjE7Jl5isoajMTt2CutdjuvwKidZdM0aYFuo=";
    name = "${pname}.png";
  };

  desktopItem = pkgs.makeDesktopItem {
    name = pname;
    desktopName = "Cheat Engine";
    comment = "Memory scanner, debugger and hex editor for games and applications";
    exec = pname;
    icon = pname;
    categories = ["Development" "Debugger"];
  };

  cheat-engine = pkgs.stdenv.mkDerivation {
    inherit pname version src;

    # The zip has no top-level directory.
    unpackPhase = ''
      runHook preUnpack
      unzip -q $src -d source
      runHook postUnpack
    '';
    sourceRoot = "source";

    nativeBuildInputs = [
      pkgs.unzip
      pkgs.autoPatchelfHook
      pkgs.qt6.wrapQtAppsHook
    ];

    buildInputs = [
      pkgs.qt6.qtbase
      pkgs.qt6.qtwayland
      pkgs.libx11
      pkgs.zlib
      pkgs.stdenv.cc.cc.lib
    ];

    # Loaded at runtime via dlopen.
    runtimeDependencies = [
      pkgs.libGL
      pkgs.SDL2
      pkgs.sqlite.out
    ];

    dontConfigure = true;
    dontBuild = true;
    dontWrapQtApps = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/opt/cheatengine $out/bin
      cp -r . $out/opt/cheatengine

      # Keep the real binary in its directory: Cheat Engine locates its Lua
      # scripts, headers and helper libraries next to its executable.
      makeQtWrapper $out/opt/cheatengine/cheatengine-x86_64 $out/bin/${pname}

      install -Dm644 ${desktopItem}/share/applications/${pname}.desktop \
        $out/share/applications/${pname}.desktop
      install -Dm644 ${icon} \
        $out/share/icons/hicolor/128x128/apps/${pname}.png

      runHook postInstall
    '';

    meta = with lib; {
      description = "Memory scanner, debugger and hex editor for games and applications";
      homepage = "https://www.cheatengine.org/";
      license = licenses.unfree;
      platforms = ["x86_64-linux"];
      sourceProvenance = [sourceTypes.binaryNativeCode];
      mainProgram = pname;
    };
  };
in {
  environment.systemPackages = [cheat-engine];

  boot.kernel.sysctl."kernel.yama.ptrace_scope" = 0;
}
