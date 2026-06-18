{
  pkgs,
  lib,
  ...
}: let
  pname = "occt";

  src = pkgs.fetchurl {
    url = "https://dl.ocbase.com/linux/per/stable/OCCT";
    hash = "sha256-yvKg/ariuICx5obWzWynbKSl47AL0A/gXsmoPYaaiek=";
    name = "OCCT";
  };

  occt-env = pkgs.runCommand "occt-env" {} ''
    mkdir -p $out/opt/occt
    install -m 755 ${src} $out/opt/occt/OCCT
    touch $out/opt/occt/disable_update
    touch $out/opt/occt/app_folder_in_home
  '';

  desktopItem = pkgs.makeDesktopItem {
    name = pname;
    desktopName = "OCCT";
    comment = "All-in-one stability, stress test, benchmark and monitoring tool for PC";
    exec = pname;
    categories = ["System" "Monitor"];
  };

  occt = pkgs.buildFHSEnv {
    name = pname;
    targetPkgs = _: [
      occt-env
      pkgs.zlib
      pkgs.libGL
      pkgs.mesa
      pkgs.fontconfig
      pkgs.freetype
      pkgs.dbus
      pkgs.glib
      pkgs.stdenv.cc.cc.lib
      pkgs.libx11
      pkgs.libxext
      pkgs.libxrender
      pkgs.libxi
      pkgs.libxcursor
      pkgs.libxrandr
      pkgs.libxinerama
      pkgs.libxfixes
      pkgs.libxcomposite
    ];
    runScript = "/opt/occt/OCCT";

    extraInstallCommands = ''
      install -Dm644 ${desktopItem}/share/applications/${pname}.desktop \
        $out/share/applications/${pname}.desktop
    '';

    meta = with lib; {
      description = "All-in-one stability, stress test, benchmark and monitoring tool for PC";
      homepage = "https://www.ocbase.com/";
      license = licenses.unfree;
      platforms = ["x86_64-linux"];
      mainProgram = pname;
    };
  };
in {
  environment.systemPackages = [occt];
}
