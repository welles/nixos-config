{hostname, ...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/nixos-tools.nix
    ../../modules/nixos-dev.nix
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./boot.nix
    ./desktop.nix
    ./impermanence.nix
    ../../modules/tmux.nix
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ../../modules/home-manager-user.nix
    ./virtualbox.nix
    ./networking.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  _module.args = {
    user = "nixos";
    homeFile = ../../modules/home/nixos.nix;
    persistRoot = "/persist";
  };
}
