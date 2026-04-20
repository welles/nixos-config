# NixOS User Configuration
#
# System configuration for the NixOS user profile, intended for use in
# Windows WSL. Provides Docker for containerised development and
# lazygit for a terminal-based Git workflow.
{
  pkgs,
  user,
  ...
}: {
  imports = [
    ../../modules/docker.nix
    ../../modules/headlamp.nix
    ../../modules/tmux.nix
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
      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXtst
      xorg.libXi
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
      lazygit
      lazydocker
      k9s
      k0sctl
      kdePackages.dolphin
      kubeseal
      kubelogin
      jetbrains.rider
      dotnet-sdk_10
      mercurial
      nodejs
      vscode
      firefox-devedition
      google-chrome
      microsoft-edge
      sourcegit
    ];

    shellAliases = {
      start-rider = "tmux new -d -s rider -- rider";
    };

    sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    # hashedPassword (not initialPassword) so xrdp can always authenticate — initialPassword only applies on first account creation
    hashedPassword = "$6$3BGVF3pHFaYKQrs1$Ac6nlm55Mi.80KdRhvlr9wk4V80X/CE2cof8YRba5Mz6Kqgzl8uzq.Bd78qKh8Tsq4FGQuRsmhedOVlH.Zuvx1";
    description = "NixOS";
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    linger = true;
  };
}
