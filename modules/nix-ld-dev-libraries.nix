# Extra nix-ld libraries needed by JetBrains IDEs, Kubernetes tooling, and
# similar dev-VM tooling, on top of the minimal set in nix-ld.nix.
{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
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
