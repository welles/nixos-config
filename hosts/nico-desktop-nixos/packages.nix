{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    _1password-gui
    alejandra
    bitwarden-desktop
    deadnix
    delta
    discord
    easyeffects
    firefox-devedition
    fsearch
    google-chrome
    lazygit
    mcp-nixos
    pciutils
    remmina
    sops
    sourcegit
    ssh-to-age
    statix
    usbutils
    vscode
    nodejs
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
