{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Nix tooling
    alejandra
    deadnix
    mcp-nixos
    sops
    ssh-to-age
    statix

    # Version control
    delta
    lazygit
    sourcegit

    # Apps with impermanence-persisted config dirs
    bitwarden-desktop
    discord
    easyeffects
    firefox-devedition
    fsearch
    google-chrome
    remmina
    vscode

    # System utilities
    pciutils
    usbutils
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
