{
  lib,
  pkgs,
  user,
  ...
}: let
  keeper = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "keeper-password-manager";
    version = "18.5.1";

    src = pkgs.fetchurl {
      url = "https://download.keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${finalAttrs.version}_amd64.deb";
      hash = "sha256-9uggmFkyjQYtM0ceupZS0xiRGea6tJO9RCaCiodnj7I=";
    };

    nativeBuildInputs = with pkgs; [
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

    installPhase = ''
      runHook preInstall

      mkdir -p "$out"
      cp -r usr/lib usr/share "$out/"

      mkdir -p "$out/bin"
      makeWrapper "$out/lib/keeperpasswordmanager/keeperpasswordmanager" \
        "$out/bin/keeperpasswordmanager" \
        --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [pkgs.libglvnd]} \
        --prefix PATH : ${lib.makeBinPath [pkgs.kdePackages.kde-cli-tools pkgs.xdg-utils]}

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
