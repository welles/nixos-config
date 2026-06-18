{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
