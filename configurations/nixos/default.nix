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

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
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

  environment.systemPackages = with pkgs; [
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
    xdg-utils
    desktop-file-utils
  ];

  environment.shellAliases = {
    start-rider = "tmux new -d -s rider -- rider";
  };

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
  };

  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "NixOS";
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    linger = true;
  };
}
