{hostname, ...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/yazi.nix
    ../../modules/home/konsole.nix
    ../../modules/tmux.nix

    ../../modules/packages/1password.nix
    ../../modules/docker.nix
    ../../modules/virt-manager-client.nix
    ../../modules/kde-plasma.nix
    ../../modules/packages/fira-code-nerd-font.nix
    ../../modules/packages/fira-sans.nix
    ../../modules/networkmanager.nix
    ../../modules/profile-icon
    ../../modules/wifi-welles-intern
    ../../modules/pipewire.nix
    ../../modules/printing.nix
    ../../modules/flatpak.nix
    ../../modules/avahi.nix
    ../../modules/removable-media.nix

    ../../modules/packages/alejandra.nix
    ../../modules/packages/deadnix.nix
    ../../modules/packages/mcp-nixos.nix
    ../../modules/packages/sops.nix
    ../../modules/packages/ssh-to-age.nix
    ../../modules/packages/statix.nix
    ../../modules/packages/dotnet-sdk_10.nix
    ../../modules/packages/jdk25.nix
    ../../modules/packages/jetbrains-rider.nix
    ../../modules/packages/nodejs.nix
    ../../modules/packages/pnpm.nix
    ../../modules/packages/powershell.nix
    ../../modules/packages/vscode.nix
    ../../modules/packages/delta.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/sourcegit.nix
    ../../modules/packages/discord.nix
    ../../modules/packages/google-chrome.nix
    ../../modules/packages/firefox-devedition.nix
    ../../modules/packages/mumble.nix
    ../../modules/packages/remmina.nix
    ../../modules/packages/teamspeak6-client.nix
    ../../modules/packages/calibre.nix
    ../../modules/packages/drawing.nix
    ../../modules/packages/gimp.nix
    ../../modules/packages/losslesscut-bin.nix
    ../../modules/packages/obs-studio.nix
    ../../modules/packages/picard.nix
    ../../modules/packages/pinta.nix
    ../../modules/packages/video-compare.nix
    ../../modules/packages/video2x.nix
    ../../modules/packages/vlc.nix
    ../../modules/packages/wrtag.nix
    ../../modules/packages/libreoffice.nix
    ../../modules/packages/naps2.nix
    ../../modules/packages/easyeffects.nix
    ../../modules/packages/evtest.nix
    ../../modules/packages/exfatprogs.nix
    ../../modules/packages/fastfetch.nix
    ../../modules/packages/fsearch.nix
    ../../modules/packages/gparted.nix
    ../../modules/packages/lazydocker.nix
    ../../modules/packages/mission-center.nix
    ../../modules/packages/pciutils.nix
    ../../modules/packages/unrar.nix
    ../../modules/packages/usbutils.nix
    ../../modules/packages/xfsprogs.nix
    ../../modules/packages/solaar.nix
    ../../modules/packages/systemctl-tui.nix
    ../../modules/packages/_7zz.nix
    ../../modules/packages/kdePackages-partitionmanager.nix
    ../../modules/rclone

    ../../modules/user-account.nix
    ../../modules/locale-de.nix
    ../../modules/keyboard.nix
    ../../modules/nix-settings.nix
    ../../modules/sops-zfs-persist.nix
    ../../modules/home-manager-user.nix

    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./impermanence.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/codex.nix
    ../../modules/packages/antigravity.nix
    ./nvidia-gpu.nix
    ../../modules/wifi-welles-starlink
    ../../modules/xone-dongle.nix

    ../../modules/packages/eden.nix
    ../../modules/packages/occt
    ../../modules/scripts/check-persist

    ../../modules/zfs-laptop-boot.nix

    ../../modules/nix-ld.nix
    ../../modules/logitech-wheel.nix
    ../../modules/nixos-tools.nix
    ../../modules/bluetooth.nix
    ./networking.nix
    ./sunshine.nix
    ./gaming.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "54af8977";
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
      ../../modules/home/xdg-user-dirs.nix
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
