{
  hostname,
  lib,
  ...
}: {
  imports = [
    ../../modules/nixos-tools.nix
    ../../modules/nixos-dev.nix
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./boot.nix
    ./desktop.nix
    ./persistence.nix
    ../../modules/tmux.nix
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ../../modules/home-manager-user.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  programs.zsh.enable = true;
  _module.args.user = "nixos";
  _module.args.homeFile = ../../modules/home/nixos.nix;

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  services.xserver.videoDrivers = ["virtualbox" "modesetting"];

  networking.useDHCP = lib.mkDefault true;
}
