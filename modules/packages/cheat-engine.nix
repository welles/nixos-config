# Cheat Engine Package
#
# Packages the native Linux build of Cheat Engine (Lazarus/Qt6). The release
# ships as a zip with a prebuilt binary plus bundled libraries (libQt6Pas,
# OpenSSL 1.1, Lua, TCC, ...), so the binaries are patched with
# autoPatchelfHook and wrapped with the Qt6 hooks. Settings are stored in
# $XDG_CONFIG_HOME, so the read-only install directory is fine.
#
# Reading other processes' memory needs ptrace access, which Yama
# (ptrace_scope=1) denies to unprivileged processes, and global hotkeys need
# access to /dev/input. Instead of relaxing ptrace_scope system-wide, the
# `cheatengine` launcher runs Cheat Engine as root via pkexec. The polkit
# action keeps DISPLAY/XAUTHORITY, so the GUI connects through X11/XWayland.
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

      mkdir -p $out/opt/cheatengine
      cp -r . $out/opt/cheatengine

      # Keep the real binary in its directory: Cheat Engine locates its Lua
      # scripts, headers and helper libraries next to its executable.
      makeQtWrapper $out/opt/cheatengine/cheatengine-x86_64 $out/libexec/${pname}

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
    };
  };

  # pkexec only accepts the exact path named in the policy's exec.path.
  rootProgram = "${cheat-engine}/libexec/${pname}";

  polkitPolicy = pkgs.writeTextDir "share/polkit-1/actions/org.cheatengine.cheatengine.policy" ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE policyconfig PUBLIC
      "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
      "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
    <policyconfig>
      <action id="org.cheatengine.cheatengine">
        <description>Run Cheat Engine</description>
        <message>Authentication is required to run Cheat Engine as root</message>
        <icon_name>${pname}</icon_name>
        <defaults>
          <allow_any>auth_admin</allow_any>
          <allow_inactive>auth_admin</allow_inactive>
          <allow_active>auth_admin</allow_active>
        </defaults>
        <annotate key="org.freedesktop.policykit.exec.path">${rootProgram}</annotate>
        <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
      </action>
    </policyconfig>
  '';

  launcher = pkgs.writeShellScriptBin pname ''
    if [ "$(id -u)" -eq 0 ]; then
      exec ${rootProgram} "$@"
    fi
    exec /run/wrappers/bin/pkexec ${rootProgram} "$@"
  '';
in {
  environment.systemPackages = [cheat-engine polkitPolicy launcher];

  security.polkit.enable = true;
  # nixpkgs no longer installs the setuid pkexec wrapper by default; the
  # launcher needs /run/wrappers/bin/pkexec.
  security.polkit.enablePkexecWrapper = true;
}
