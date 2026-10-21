{
  hostname,
  config,
  ...
}: {
  imports = [
    # Bundles
    ../../bundles/base.nix
    ../../bundles/containers.nix
    ../../bundles/impermanence-zfs.nix
    ../../bundles/sops-admin.nix

    # Hardware & boot
    ./boot.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./sops.nix
    ./users.nix

    # Networking
    ./networking.nix
    ../../modules/networkmanager.nix

    # Shell & user environment
    ../../modules/packages/yazi.nix

    # Services & hardware
    ../../modules/openssh.nix
    ../../modules/server-status.nix
    ./services.nix
    ./nico-devbox-vm.nix
    ../../modules/stacks/default.nix

    # Packages
    ../../modules/packages/bottom.nix
    ../../modules/packages/ctop.nix
    ../../modules/packages/httm.nix
    ../../modules/packages/iotop.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/smartmontools.nix
    ../../modules/packages/systemctl-tui.nix

    # Scripts
    ../../modules/scripts/check-mkv
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
    sopsAgeKeyFile = "/mnt/bucket/persist/var/lib/sops-nix/key.txt";
    pool = "bucket";
    userDescription = "Schokoladenelch";
    userEmail = "nico@welles.email";
    extraDiskMounts = ["/mnt/tank/movies"];
    passwordConfig = {hashedPasswordFile = config.sops.secrets."user-password".path;};
    # 1Password SSH agent
    sshAuthorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
    ];
    extraGroups = ["wheel"];
  };
}
