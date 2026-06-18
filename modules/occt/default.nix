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

  icon = pkgs.fetchurl {
    url = "https://www.ocbase.com/images/new/logomark.occt.svg";
    hash = "sha256-GLivAu4/epbgXGRNc8lljhBQ8nIJob/2g5InXqZaUCA=";
    name = "${pname}.svg";
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
    icon = pname;
    categories = ["System" "Monitor"];
  };

  occt = pkgs.buildFHSEnv {
    name = pname;
    targetPkgs = _: [
      occt-env
      pkgs.icu
      pkgs.openssl
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
      install -Dm644 ${icon} \
        $out/share/icons/hicolor/scalable/apps/${pname}.svg
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
