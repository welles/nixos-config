{hostname, ...}: {
  imports = [
    ../../modules/home/shell.nix
    # Import order is intentional: NixOS concatenates environment.systemPackages
    # in reverse import order (last import = first in the merged list). This order
    # replicates the exact systemPackages ordering from the old
    # global.nix + configurations/schokoladenelch + machines/ layout.
    ../../modules/nixos-tools.nix # nixos-diff → last in merged list
    ./packages.nix # bottom/ctop/etc. → 2nd-to-last group
    ../../modules/scripts/check-mkv # → position 5
    ../../modules/scripts/create-zfs-dataset # → position 4
    ../../modules/scripts/zfs-manual-snapshot # → position 3
    ../../modules/scripts/zfs-snapshot-diff # → position 2
    ../../modules/scripts/check-persist # → position 1 (first in merged list)
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ../../modules/tmux.nix
    ../../modules/docker.nix
    ../../modules/networkmanager.nix
    ../../modules/stacks/default.nix
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./impermanence.nix
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ./sops.nix
    ./users.nix
    ./home-manager.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "c0ffee12";
  system.stateVersion = "25.11";
  _module.args = {
    user = "schokoladenelch";
    persistRoot = "/mnt/bucket/persist";
  };
}
