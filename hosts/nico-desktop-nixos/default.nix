{
  hostname,
  config,
  ...
}: {
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
    ./nvidia-gpu.nix
    ./sops.nix

    # Networking
    ./networking.nix

    # Desktop environment
    ./plasma.nix

    # Home Manager
    ../../modules/packages/yazi.nix

    # System
    ../../modules/nix-ld.nix
    ../../modules/minecraft-modding.nix

    # Services & hardware
    ./services.nix

    # Packages
    ../../modules/packages/antigravity.nix
    ../../modules/packages/azure-cli.nix
    ../../modules/packages/bottles.nix
    ../../modules/packages/cheat-engine.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/codex.nix
    ../../modules/packages/discord.nix
    ../../modules/packages/easyeffects.nix
    ../../modules/packages/fsearch.nix
    ../../modules/packages/gh.nix
    ../../modules/packages/gparted.nix
    ../../modules/packages/jdk21.nix
    ../../modules/packages/libreoffice.nix
    ../../modules/packages/obs-studio.nix
    ../../modules/packages/occt.nix
    ../../modules/packages/pciutils.nix
    ../../modules/packages/remmina.nix
    ../../modules/packages/streamdeck.nix
    ../../modules/packages/usbutils.nix

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
    passwordConfig = {hashedPasswordFile = config.sops.secrets."user-password".path;};
    extraGroups = ["wheel"];
  };
}
