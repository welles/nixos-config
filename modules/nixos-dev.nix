# Shared development environment for the "nixos" user profile.
# Used by nixos-wsl-nixos and nixos-virtualbox-nixos.
{pkgs, ...}: {
  imports = [
    ./docker.nix
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
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
      nss
      at-spi2-atk
      libdrm
      mesa
      alsa-lib
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      headlamp
      hoppscotch
      lazygit
      lazydocker
      k9s
      k0sctl
      kdePackages.dolphin
      kind
      kubectl
      kubeseal
      kubelogin-oidc
      jetbrains.rider
      dotnet-sdk_10
      mercurial
      nodejs
      vscode
      firefox-devedition
      google-chrome
      microsoft-edge
      sourcegit
      bruno
      openssl
      kubernetes-helm
    ];

    sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
      DONT_PROMPT_WSL_INSTALL = "true";
    };
  };

  users.users.nixos = {
    isNormalUser = true;
    hashedPassword = "$6$3BGVF3pHFaYKQrs1$Ac6nlm55Mi.80KdRhvlr9wk4V80X/CE2cof8YRba5Mz6Kqgzl8uzq.Bd78qKh8Tsq4FGQuRsmhedOVlH.Zuvx1";
    description = "NixOS";
    extraGroups = ["wheel"];
    linger = true;
  };
}
