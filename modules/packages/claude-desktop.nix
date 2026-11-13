# Claude Desktop (Linux beta)
#
# Anthropic's desktop app (Chat, Cowork and Claude Code) is not in nixpkgs;
# it is repackaged here from the official Debian package. The app expects a
# Debian file system layout (/usr/bin/qemu-system-x86_64,
# /usr/share/OVMF/OVMF_CODE.fd, …), so it runs in an FHS environment.
#
# Updated by .github/scripts/update-local-packages.sh. Manually: pick the
# newest version from
#   https://downloads.claude.ai/claude-desktop/apt/stable/dists/stable/main/binary-amd64/Packages
# (sort -V, the file is not ordered) and take its SHA256 from the same entry.
#
# Cowork runs its tasks in a QEMU/KVM VM, which needs the kvm group (for
# /dev/vhost-vsock) and the vhost_vsock kernel module. Sign-in is kept in the
# desktop's keyring (KWallet or GNOME Keyring) via libsecret.
{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: let
  pname = "claude-desktop";
  version = "5.11492.2";

  src = pkgs.fetchurl {
    url = "https://downloads.claude.ai/claude-desktop/apt/stable/pool/main/c/claude-desktop/claude-desktop_${version}_amd64.deb";
    hash = "sha256-0QlE+lZjuZdADPZsXHc4/WrPZU+KrqyluZTrFHqms18=";
  };

  unpacked = pkgs.stdenvNoCC.mkDerivation {
    pname = "${pname}-unpacked";
    inherit version src;
    nativeBuildInputs = [pkgs.dpkg];
    unpackPhase = "dpkg-deb --fsys-tarfile $src | tar -x --no-same-owner --no-same-permissions";
    installPhase = ''
      mkdir -p $out
      cp -r usr/lib usr/share $out/
      # Desktop integration the Debian postinst installs at runtime.
      install -Dm644 $out/lib/claude-desktop/resources/linux-mime/com.anthropic.Claude.xml \
        $out/share/mime/packages/com.anthropic.Claude.xml
      rm -rf $out/share/doc $out/share/lintian
    '';
    dontStrip = true;
    dontPatchELF = true;
  };

  # The app looks for the UEFI firmware at Debian's paths.
  ovmfDebianLayout = pkgs.runCommand "ovmf-debian-layout" {} ''
    mkdir -p $out/share/OVMF
    ln -s ${pkgs.OVMF.fd}/FV/OVMF_CODE.fd $out/share/OVMF/OVMF_CODE.fd
    ln -s ${pkgs.OVMF.fd}/FV/OVMF_CODE.fd $out/share/OVMF/OVMF_CODE_4M.fd
    ln -s ${pkgs.OVMF.fd}/FV/OVMF_VARS.fd $out/share/OVMF/OVMF_VARS.fd
    ln -s ${pkgs.OVMF.fd}/FV/OVMF_VARS.fd $out/share/OVMF/OVMF_VARS_4M.fd
  '';

  claude-desktop = pkgs.buildFHSEnv {
    name = pname;
    inherit version;

    targetPkgs = _: [
      unpacked
      ovmfDebianLayout

      # Electron runtime (Debian "Depends")
      pkgs.alsa-lib
      pkgs.at-spi2-atk
      pkgs.at-spi2-core
      pkgs.cairo
      pkgs.cups
      pkgs.dbus
      pkgs.expat
      pkgs.glib
      pkgs.gtk3
      pkgs.libdrm
      pkgs.libgbm
      pkgs.libGL
      pkgs.libnotify
      pkgs.libsecret
      pkgs.libxkbcommon
      pkgs.mesa
      pkgs.nspr
      pkgs.nss
      pkgs.pango
      pkgs.pipewire
      pkgs.systemd
      pkgs.util-linux
      pkgs.vulkan-loader
      pkgs.xdg-utils
      pkgs.libx11
      pkgs.libxcb
      pkgs.libxcomposite
      pkgs.libxdamage
      pkgs.libxext
      pkgs.libxfixes
      pkgs.libxrandr
      pkgs.libxtst
      pkgs.libxkbfile
      pkgs.libxshmfence

      # Debian "Recommends": tray, certificates, tools Claude Code and
      # Cowork call by name
      pkgs.libayatana-appindicator
      pkgs.cacert
      pkgs.bubblewrap
      pkgs.socat
      pkgs.openssh
      pkgs.git

      # Cowork VM
      pkgs.qemu_kvm
      pkgs.virtiofsd
    ];

    runScript = "/usr/lib/claude-desktop/claude-desktop";

    extraInstallCommands = ''
      mkdir -p $out/share
      cp -r ${unpacked}/share/applications ${unpacked}/share/icons ${unpacked}/share/mime $out/share/
    '';

    meta = {
      description = "Anthropic's desktop app for Claude, Cowork and Claude Code";
      homepage = "https://claude.com/download";
      license = lib.licenses.unfree;
      sourceProvenance = [lib.sourceTypes.binaryNativeCode];
      platforms = ["x86_64-linux"];
      mainProgram = pname;
    };
  };
in {
  # Claude Code sessions of the desktop app share ~/.claude and ~/.claude.json
  # with the CLI, which also persists them.
  imports = [./claude-code.nix];

  environment.systemPackages = [claude-desktop];

  # Cowork
  boot.kernelModules = ["vhost_vsock"];
  users.users.${user}.extraGroups = ["kvm"];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".config/Claude"];
  };
}
