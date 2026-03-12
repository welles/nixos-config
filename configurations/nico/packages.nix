# System Packages
#
# All user-facing applications and CLI tools installed system-wide.
# Grouped by category for easier maintenance.
{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # AI / LLM tools
    inputs.llm-agents.packages.${stdenv.hostPlatform.system}.gemini-cli

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
    firefox
    google-chrome
    mumble
    remmina
    spotify
    teams-for-linux
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

    # KDE extensions
    kdePackages.kzones
    kdePackages.partitionmanager
  ];
}
