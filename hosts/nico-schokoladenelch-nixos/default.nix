{
  hostname,
  config,
  ...
}: {
  imports = [
    # Hardware & boot
    ./boot.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./impermanence.nix
    ./sops.nix
    ./users.nix

    # Networking
    ./networking.nix
    ../../modules/networkmanager.nix

    # Home Manager
    ../../modules/home/shell.nix
    ../../modules/home/yazi.nix

    # User & identity
    ./home-manager.nix
    ../../modules/user-account.nix

    # System
    ../../modules/keyboard.nix
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ../../modules/nixos-tools.nix
    ../../modules/tmux.nix

    # Services & hardware
    ../../modules/docker.nix
    ../../modules/libvirt.nix
    ../../modules/server-status.nix
    ./services.nix
    ../../modules/stacks/default.nix

    # Packages
    ../../modules/packages/bottom.nix
    ../../modules/packages/ctop.nix
    ../../modules/packages/httm.nix
    ../../modules/packages/iotop.nix
    ../../modules/packages/lazydocker.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/smartmontools.nix
    ../../modules/packages/sops.nix
    ../../modules/packages/ssh-to-age.nix
    ../../modules/packages/systemctl-tui.nix

    # Scripts
    ../../modules/scripts/check-mkv
    ../../modules/scripts/check-persist
    ../../modules/scripts/create-zfs-dataset
    ../../modules/scripts/search-tmdb
    ../../modules/scripts/zfs-manual-snapshot
    ../../modules/scripts/zfs-snapshot-diff
  ];

  networking.hostName = hostname;
  networking.hostId = "c0ffee12";
  system.stateVersion = "25.11";
  _module.args = {
    user = "schokoladenelch";
    persistRoot = "/mnt/bucket/persist";
    userDescription = "Schokoladenelch";
    userEmail = "nico@welles.email";
    extraDiskMounts = ["/mnt/tank/movies"];
    passwordConfig = {hashedPasswordFile = config.sops.secrets."user-password".path;};
    extraGroups = ["wheel"];
  };
}
