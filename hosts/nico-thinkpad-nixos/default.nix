{hostname, ...}: {
  imports = [
    # Bundles
    ../../bundles/archive-tools.nix
    ../../bundles/base.nix
    ../../bundles/containers.nix
    ../../bundles/desktop-kde.nix
    ../../bundles/dev-tools.nix
    ../../bundles/disk-tools.nix
    ../../bundles/dotnet-dev.nix
    ../../bundles/git-gui.nix
    ../../bundles/hardware-tools.nix
    ../../bundles/image-editing.nix
    ../../bundles/impermanence-zfs.nix
    ../../bundles/java-dev.nix
    ../../bundles/music-tagging.nix
    ../../bundles/nix-dev.nix
    ../../bundles/onepassword.nix
    ../../bundles/sops-admin.nix
    ../../bundles/system-monitoring.nix
    ../../bundles/video-tools.nix
    ../../bundles/voice-chat.nix

    # Hardware & boot
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ../../modules/screen-rotation.nix
    ../../modules/zfs-grub-boot.nix

    # Networking
    ../../modules/avahi.nix
    ../../modules/lte-telekom.nix
    ../../modules/networkmanager.nix
    ../../modules/networkmanager-skip-wait-online.nix
    ../../modules/quectel-rm520n-fcc-unlock.nix
    ../../modules/wireguard-home.nix

    # Desktop environment
    ../../modules/flatpak.nix
    ../../modules/plasma-hot-corners.nix
    ../../modules/plasma-lid-ignore-on-ac.nix
    ../../modules/plasma-night-color.nix
    ../../modules/plasma-no-logout-confirmation.nix
    ../../modules/plasma-no-screen-autolock.nix
    ../../modules/plasma-panel.nix
    ../../modules/plasma-power-ac.nix
    ../../modules/plasma-power-battery.nix
    ../../modules/printing.nix
    ../../modules/removable-media.nix

    # Shell & user environment
    ../../modules/packages/yazi.nix

    # System
    ../../modules/nix-ld.nix
    ../../modules/no-hibernate.nix

    # Services & hardware
    ../../modules/rclone
    ../../modules/user-password-plaintext.nix

    # Packages
    ../../modules/packages/antigravity.nix
    ../../modules/packages/azure-cli.nix
    ../../modules/packages/calibre.nix
    ../../modules/claude-code-foundry
    ../../modules/packages/claude-code.nix
    ../../modules/packages/claude-desktop.nix
    ../../modules/packages/codex.nix
    ../../modules/packages/easyeffects.nix
    ../../modules/packages/fsearch.nix
    ../../modules/packages/gh.nix
    ../../modules/packages/libinput.nix
    ../../modules/packages/libreoffice.nix
    ../../modules/packages/maliit-keyboard.nix
    ../../modules/packages/naps2.nix
    ../../modules/packages/obs-studio.nix
    ../../modules/packages/powershell.nix
    ../../modules/packages/remmina.nix
    ../../modules/packages/solaar.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "0aea17fa";
  sops.defaultSopsFile = ./secrets.yaml;
  system.stateVersion = "25.11";
  _module.args = {
    user = "nico";
    persistRoot = "/persist";
    sopsAgeKeyFile = "/persist/var/lib/sops-nix/key.txt";
    pool = "main";
    userDescription = "Nico Welles";
    userEmail = "nico@welles.email";
    sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
    onePasswordVaults = ["Persönlich" "Schokoladenelch"];
    passwordConfig = {};
    extraGroups = ["wheel"];
    nextcloudUrl = "https://nextcloud.welles.app";
    homeWireguardAddress = {
      ipv4 = "10.0.6.2";
      ipv6 = "fdcc:e6dd:c616:f6a8::2";
    };
  };
}
