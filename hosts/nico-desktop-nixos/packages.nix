{pkgs, ...}: {
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = ["nico"];
  };

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
    nodejs
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
