{
  hostname,
  lib,
  ...
}: {
  imports = [
    ./nixos-tools.nix
    ../../modules/nixos-dev.nix
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./boot.nix
    ./desktop.nix
    ./persistence.nix
    ../../modules/tmux.nix
    ./locale.nix
    ./nix.nix
    ./home-manager.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  programs.zsh.enable = true;
  _module.args.user = "nixos";

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  services.xserver.videoDrivers = ["virtualbox" "modesetting"];

  networking.useDHCP = lib.mkDefault true;
}
