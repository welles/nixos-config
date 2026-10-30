{
  lib,
  pkgs,
  user,
  ...
}: let
  keeper = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "keeper-password-manager";
    version = "18.6.6";

    src = pkgs.fetchurl {
      url = "https://download.keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${finalAttrs.version}_amd64.deb";
      hash = "sha256-U7hDF7m8bbicMafC7Is0/R7G2GicXELg5kyqAqsY/lw=";
    };

    nativeBuildInputs = with pkgs; [
      asar
      autoPatchelfHook
      dpkg
      makeWrapper
    ];

    buildInputs = with pkgs; [
      alsa-lib
      at-spi2-atk
      cairo
      cups
      dbus
      expat
      glib
      gtk3
      libdrm
      libgbm
      libnotify
      libsecret
      libx11
      libxcb
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxkbcommon
      libxrandr
      nspr
      nss
      pango
      pcsclite
      stdenv.cc.cc.lib
      systemd
      zlib
    ];

    unpackPhase = ''
      runHook preUnpack
      dpkg-deb --fsys-tarfile "$src" | tar --extract --no-same-permissions
      runHook postUnpack
    '';

    # Keeper turns its tray icon off on Linux, and without it closing the main
    # window quits the app. With it, the app keeps running in the tray: a
    # click opens the Keeper applet, the right-click menu has "Exit". The app
    # is repacked, as Electron checks each file against the archive's hashes.
    # Keeper doesn't support this on Linux, so the replaced code may change
    # with updates; --replace-fail then fails the build.
    postPatch = ''
      resources=usr/lib/keeperpasswordmanager/resources
      asar extract "$resources/app.asar" app
      substituteInPlace app/app.js --replace-fail \
        'const w="linux"!==process.platform?require("./tray"):null' \
        'const w=require("./tray")'
      # Desktop autofill (KeeperFill for other applications) has no Linux
      # implementation and throws, which skipped the rest of the tray setup
      substituteInPlace app/tray/index.js --replace-fail \
        'auto_fill_1.default.initialize(),' \
        '(()=>{try{auto_fill_1.default.initialize()}catch{}})(),'
      rm -r "$resources/app.asar" "$resources/app.asar.unpacked"
      asar pack app "$resources/app.asar" --unpack "*.node"
      rm -r app
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p "$out"
      cp -r usr/lib usr/share "$out/"

      mkdir -p "$out/bin"
      makeWrapper "$out/lib/keeperpasswordmanager/keeperpasswordmanager" \
        "$out/bin/keeperpasswordmanager" \
        --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [pkgs.libglvnd]} \
        --prefix PATH : ${lib.makeBinPath [pkgs.xdg-utils]}

      runHook postInstall
    '';

    meta = {
      description = "Keeper Password Manager desktop application";
      homepage = "https://www.keepersecurity.com/download.html";
      license = lib.licenses.unfree;
      mainProgram = "keeperpasswordmanager";
      platforms = ["x86_64-linux"];
      sourceProvenance = [lib.sourceTypes.binaryNativeCode];
    };
  });
in {
  environment = {
    systemPackages = [keeper];
    sessionVariables.SSH_AUTH_SOCK = "/home/${user}/.config/Keeper Password Manager/keeper-ssh-agent.sock";
  };

  programs.ssh.extraConfig = ''
    Host *
      IdentityAgent ~/.config/Keeper\ Password\ Manager/keeper-ssh-agent.sock
  '';

  services.pcscd.enable = true;
}
