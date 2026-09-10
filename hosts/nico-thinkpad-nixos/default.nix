{hostname, ...}: {
  imports = [
    # Hardware & boot
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./impermanence.nix
    ../../modules/sops-zfs-persist.nix
    ./tablet.nix
    ../../modules/zfs-laptop-boot.nix

    # Networking
    ../../modules/avahi.nix
    ./fritzbox-wireguard.nix
    ./mobile-network.nix
    ./networking.nix
    ../../modules/networkmanager.nix
    ../../modules/wifi-welles-intern
    ../../modules/wifi-welles-starlink

    # Desktop environment
    ../../modules/bluetooth.nix
    ../../modules/flatpak.nix
    ../../modules/kde-plasma.nix
    ../../modules/user-dirs.nix
    ../../modules/pipewire.nix
    ../../modules/printing.nix
    ../../modules/profile-icon
    ../../modules/removable-media.nix

    # Home Manager
    ../../modules/home/konsole.nix
    ../../modules/home/shell.nix
    ../../modules/home/yazi.nix

    # User & identity
    ../../modules/home-manager-user.nix
    ../../modules/user-account.nix

    # System
    ../../modules/keyboard.nix
    ../../modules/locale-de.nix
    ../../modules/nix-ld.nix
    ../../modules/nix-settings.nix
    ../../modules/nixos-tools.nix
    ../../modules/tmux.nix

    # Services & hardware
    ../../modules/docker.nix
    ../../modules/rclone
    ../../modules/virt-manager-client.nix

    # Packages
    ../../modules/packages/1password.nix
    ../../modules/packages/_7zz.nix
    ../../modules/packages/alejandra.nix
    ../../modules/packages/antigravity.nix
    ../../modules/packages/calibre.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/codex.nix
    ../../modules/packages/deadnix.nix
    ../../modules/packages/delta.nix
    ../../modules/packages/discord.nix
    ../../modules/packages/dotnet-sdk_10.nix
    ../../modules/packages/drawing.nix
    ../../modules/packages/easyeffects.nix
    ../../modules/packages/evtest.nix
    ../../modules/packages/exfatprogs.nix
    ../../modules/packages/fastfetch.nix
    ../../modules/packages/fira-code-nerd-font.nix
    ../../modules/packages/fira-sans.nix
    ../../modules/packages/firefox-devedition.nix
    ../../modules/packages/fsearch.nix
    ../../modules/packages/gimp.nix
    ../../modules/packages/google-chrome.nix
    ../../modules/packages/gparted.nix
    ../../modules/packages/jdk25.nix
    ../../modules/packages/jetbrains-rider.nix
    ../../modules/packages/kdePackages-partitionmanager.nix
    ../../modules/packages/lazydocker.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/libreoffice.nix
    ../../modules/packages/losslesscut-bin.nix
    ../../modules/packages/mcp-nixos.nix
    ../../modules/packages/mission-center.nix
    ../../modules/packages/mumble.nix
    ../../modules/packages/naps2.nix
    ../../modules/packages/nodejs.nix
    ../../modules/packages/obs-studio.nix
    ../../modules/packages/pciutils.nix
    ../../modules/packages/picard.nix
    ../../modules/packages/pinta.nix
    ../../modules/packages/pnpm.nix
    ../../modules/packages/powershell.nix
    ../../modules/packages/remmina.nix
    ../../modules/packages/solaar.nix
    ../../modules/packages/sops.nix
    ../../modules/packages/sourcegit.nix
    ../../modules/packages/ssh-to-age.nix
    ../../modules/packages/statix.nix
    ../../modules/packages/systemctl-tui.nix
    ../../modules/packages/teamspeak6-client.nix
    ../../modules/packages/unrar.nix
    ../../modules/packages/usbutils.nix
    ../../modules/packages/video-compare.nix
    ../../modules/packages/video2x.nix
    ../../modules/packages/vlc.nix
    ../../modules/packages/vscode.nix
    ../../modules/packages/wrtag.nix
    ../../modules/packages/xfsprogs.nix

    # Scripts
    ../../modules/scripts/check-persist
  ];

  networking.hostName = hostname;
  networking.hostId = "0aea17fa";
  system.stateVersion = "25.11";
  _module.args = {
    user = "nico";
    homeModules = [
      ../../modules/home/laptop-plasma.nix
      ../../modules/home/fonts.nix
      ../../modules/home/cli-tools.nix
      ../../modules/home/git.nix
      ../../modules/home/git-signing.nix
      ../../modules/home/npm.nix
      ../../modules/home/kde-theming.nix
      ../../modules/home/1password-ssh-agent.nix
      ../../modules/home/1password-autostart.nix
      ../../modules/home/sops-env.nix
      ../../modules/home/lazygit.nix
    ];
    persistRoot = "/persist";
    userDescription = "Nico Welles";
    userEmail = "nico@welles.email";
    sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
    onePasswordVaults = ["Persönlich" "Schokoladenelch"];
    passwordConfig = {initialPassword = "passwort";};
    extraGroups = ["wheel"];
    remoteHost = "nico-schokoladenelch-nixos";
    remoteUser = "schokoladenelch";
    nextcloudUrl = "https://nextcloud.welles.app";
  };
}
