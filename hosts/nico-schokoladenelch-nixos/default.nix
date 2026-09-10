{
  hostname,
  config,
  ...
}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/yazi.nix
    ../../modules/nixos-tools.nix
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
    ../../modules/scripts/search-tmdb
    ../../modules/scripts/check-mkv
    ../../modules/scripts/create-zfs-dataset
    ../../modules/scripts/zfs-manual-snapshot
    ../../modules/scripts/zfs-snapshot-diff
    ../../modules/scripts/check-persist
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ../../modules/tmux.nix
    ../../modules/docker.nix
    ../../modules/libvirt.nix
    ../../modules/networkmanager.nix
    ../../modules/stacks/default.nix
    ../../modules/server-status.nix
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./impermanence.nix
    ../../modules/locale-de.nix
    ../../modules/keyboard.nix
    ../../modules/nix-settings.nix
    ./sops.nix
    ./users.nix
    ../../modules/user-account.nix
    ./home-manager.nix
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
