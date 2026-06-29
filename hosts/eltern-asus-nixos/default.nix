{hostname, ...}: {
  imports = [
    ../../modules/nixos-tools.nix # nixos-diff → last in merged systemPackages
    ./packages.nix # firefox/jellyfin/chrome → before nixos-diff
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ../../modules/tmux.nix
    ../../modules/networkmanager.nix
    ../../modules/avahi.nix
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ./home-manager.nix
    ./boot.nix
    ./desktop.nix
    ./users.nix
    ./auto-upgrade.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  _module.args.user = "eltern";
}
