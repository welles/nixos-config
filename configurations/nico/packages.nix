# System Packages
#
# All user-facing applications and CLI tools installed system-wide.
# Grouped by category for easier maintenance.
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
    sourcegit

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
    kdePackages.partitionmanager
    (pkgs.callPackage ./kwin-mousetiler.nix {})
    (pkgs.callPackage ./kwin-rememberwindowpositions.nix {})
  ];
}
