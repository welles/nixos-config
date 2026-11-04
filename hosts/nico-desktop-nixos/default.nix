{hostname, ...}: {
  imports = [
    # Bundles
    ../../bundles/archive-tools.nix
    ../../bundles/base.nix
    ../../bundles/desktop-kde.nix
    ../../bundles/dev-tools.nix
    ../../bundles/disk-tools.nix
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
    ../../modules/zfs-grub-boot.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ../../modules/logitech-wheel.nix
    ../../modules/nvidia-base.nix
    ../../modules/nvidia-early-kms.nix

    # Networking
    ../../modules/minecraft-server-port.nix
    ../../modules/networkmanager.nix
    ../../modules/networkmanager-skip-wait-online.nix
    ../../modules/wifi-welles-family
    ../../modules/wifi-welles-starlink

    # Desktop environment
    ../../modules/plasma-no-screen-autolock.nix
    ../../modules/plasma-panel.nix
    ../../modules/plasma-power-ac.nix
    ../../modules/plasma-power-button-hibernate.nix

    # Shell & user environment
    ../../modules/packages/yazi.nix

    # System
    ../../modules/nix-ld.nix
    ../../modules/minecraft-modding.nix

    # Services & hardware
    ../../modules/easyeffects-voice-mic.nix
    ../../modules/removable-media.nix
    ../../modules/user-password-plaintext.nix

    # Packages
    ../../modules/packages/antigravity.nix
    ../../modules/packages/azure-cli.nix
    ../../modules/packages/bottles.nix
    ../../modules/packages/calibre.nix
    ../../modules/packages/cheat-engine.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/claude-desktop.nix
    ../../modules/packages/codex.nix
    ../../modules/packages/fsearch.nix
    ../../modules/packages/gh.nix
    ../../modules/packages/jdk21.nix
    ../../modules/packages/libreoffice.nix
    ../../modules/packages/naps2.nix
    ../../modules/packages/obs-studio.nix
    ../../modules/packages/occt.nix
    ../../modules/packages/powershell.nix
    ../../modules/packages/prismlauncher.nix
    ../../modules/packages/remmina.nix
    ../../modules/packages/solaar.nix
    ../../modules/packages/steam.nix
    ../../modules/packages/streamcontroller.nix

    # Scripts
    ../../modules/scripts/search-tmdb
    ../../modules/scripts/toggle-screens
  ];

  networking.hostName = hostname;
  networking.hostId = "7e6301e4";
  sops.defaultSopsFile = ./secrets.yaml;
  system.stateVersion = "26.05";
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
  };
}
