{hostname, ...}: {
  imports = [
    # Bundles
    ../../bundles/base.nix
    ../../bundles/desktop-kde.nix
    ../../bundles/dev-tools.nix
    ../../bundles/git-gui.nix
    ../../bundles/impermanence-zfs.nix
    ../../bundles/java-dev.nix
    ../../bundles/nix-dev.nix
    ../../bundles/onepassword.nix
    ../../bundles/sops-admin.nix

    # Hardware & boot
    ../../modules/zfs-grub-boot.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ../../modules/logitech-wheel.nix
    ../../modules/nvidia-base.nix
    ./nvidia-gpu.nix
    ./sops.nix

    # Networking
    ./networking.nix
    ../../modules/networkmanager.nix
    ../../modules/networkmanager-skip-wait-online.nix
    ../../modules/wifi-welles-intern
    ../../modules/wifi-welles-starlink

    # Desktop environment
    ./plasma.nix

    # Shell & user environment
    ../../modules/packages/yazi.nix

    # System
    ../../modules/nix-ld.nix
    ../../modules/minecraft-modding.nix

    # Services & hardware
    ../../modules/autologin.nix
    ../../modules/kwallet-sops-unlock.nix
    ../../modules/easyeffects-voice-mic.nix
    ../../modules/removable-media.nix

    # Packages
    ../../modules/packages/antigravity.nix
    ../../modules/packages/azure-cli.nix
    ../../modules/packages/bottles.nix
    ../../modules/packages/cheat-engine.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/codex.nix
    ../../modules/packages/fsearch.nix
    ../../modules/packages/gh.nix
    ../../modules/packages/gparted.nix
    ../../modules/packages/jdk21.nix
    ../../modules/packages/libreoffice.nix
    ../../modules/packages/obs-studio.nix
    ../../modules/packages/occt.nix
    ../../modules/packages/pciutils.nix
    ../../modules/packages/prismlauncher.nix
    ../../modules/packages/remmina.nix
    ../../modules/packages/steam.nix
    ../../modules/packages/streamcontroller.nix
    ../../modules/packages/usbutils.nix
    ../../modules/packages/vesktop.nix

    # Scripts
    ../../modules/scripts/search-tmdb
    ../../modules/scripts/toggle-screens
  ];

  networking.hostName = hostname;
  networking.hostId = "7e6301e4";
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
