{
  lib,
  pkgs,
  ...
}: let
  kasmvnc = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "kasmvnc";
    version = "1.5.2";

    src = pkgs.fetchurl {
      url = "https://github.com/kasmtech/KasmVNC/releases/download/v${finalAttrs.version}/kasmvncserver_debian_trixie_${finalAttrs.version}_amd64.deb";
      hash = "sha256-btlXFjJ1CIpc5StSX4LxRQFOMolpnVds4mdFpCSUB/g=";
    };

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      dpkg
      makeWrapper
    ];

    buildInputs = with pkgs; [
      freetype
      libbsd
      libgbm
      libglvnd
      libpng
      libunwind
      libx11
      libxau
      libxcrypt-legacy
      libxcursor
      libxdmcp
      libxext
      libxfixes
      libxfont_2
      libxrandr
      libxshmfence
      libxtst
      openssl
      pixman
      stdenv.cc.cc.lib
      systemd
      zlib
    ];

    unpackPhase = ''
      runHook preUnpack
      dpkg-deb --fsys-tarfile "$src" | tar --extract --no-same-permissions
      runHook postUnpack
    '';

    # Only the X server, the proxy that mirrors an existing X display and the
    # web client; the Perl session scripts (kasmvncserver, kasmvncconfig)
    # start a desktop of their own and are left out.
    installPhase = ''
      runHook preInstall

      mkdir -p "$out/bin" "$out/libexec" "$out/share"
      cp usr/bin/kasmxproxy usr/bin/kasmvncpasswd "$out/bin/"
      # Started through the FHS environment below
      cp usr/bin/Xkasmvnc "$out/libexec/"
      cp -r usr/share/kasmvnc "$out/share/"
      # The web client picks its language from the browser, with no setting
      # for it; without the translations it stays in English
      rm -r "$out/share/kasmvnc/www/app/locale"

      runHook postInstall
    '';

    meta = {
      description = "VNC server with a web client, mirroring an existing X display";
      homepage = "https://github.com/kasmtech/KasmVNC";
      license = lib.licenses.gpl2Plus;
      mainProgram = "kasmxproxy";
      platforms = ["x86_64-linux"];
      sourceProvenance = [lib.sourceTypes.binaryNativeCode];
    };
  });
  # Xkasmvnc runs xkbcomp from /usr/bin and reads the keyboard data and the
  # fonts from Debian's paths, all compiled in; it runs in an FHS environment
  # that has them there. The web client is passed by its store path.
  xkasmvnc = pkgs.buildFHSEnv {
    name = "Xkasmvnc";
    targetPkgs = p:
      with p; [
        font-cursor-misc
        font-misc-misc
        xkbcomp
        xkeyboard-config
      ];
    runScript = pkgs.writeShellScript "Xkasmvnc" ''
      exec ${kasmvnc}/libexec/Xkasmvnc -httpd ${kasmvnc}/share/kasmvnc/www "$@"
    '';
  };
in {
  environment.systemPackages = [
    kasmvnc
    xkasmvnc
  ];
}
