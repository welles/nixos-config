# Extra nix-ld libraries needed by JetBrains IDEs, Kubernetes tooling, and
# similar dev-VM tooling, on top of the minimal set in nix-ld.nix.
{pkgs, ...}: {
  imports = [./nix-ld.nix];

  programs.nix-ld = {
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      fuse3
      icu
      nss
      openssl
      curl
      expat
      # Common JetBrains dependencies
      libxml2
      libssh
      libkrb5
      keyutils
      # X11/Graphics libs (even for backend, some helpers need these)
      libx11
      libxext
      libxrender
      libxcomposite
      libxdamage
      libxtst
      libxi
      glib
      at-spi2-atk
      libdrm
      mesa
      alsa-lib
    ];
  };
}
