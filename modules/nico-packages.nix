# Nico's Common Packages
#
# System packages shared across all of Nico's workstation machines.
# Machine-specific packages (peripherals, gaming, etc.) are added
# inline in each host's configuration.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Nix tooling
    alejandra
    deadnix
    mcp-nixos
    sops
    ssh-to-age
    statix

    # Development
    dotnet-sdk_10
    jdk25
    jetbrains.rider
    nodejs
    pnpm
    powershell
    vscode

    # Version control
    lazygit
    smartgit

    # Internet & communication
    discord
    google-chrome
    mumble
    remmina
    teamspeak6-client

    # Media & graphics
    calibre
    drawing
    gimp
    losslesscut-bin
    obs-studio
    picard
    pinta
    video-compare
    video2x
    vlc
    wrtag

    # Office & productivity
    bitwarden-desktop
    libreoffice
    naps2

    # System utilities
    easyeffects
    evtest
    exfatprogs
    fastfetch
    fsearch
    gparted
    lazydocker
    mission-center
    nerd-fonts.fira-code
    pciutils
    unrar
    usbutils
    xfsprogs
    systemctl-tui

    # KDE extensions
    kdePackages.kzones
    kdePackages.partitionmanager
  ];
}
