{
  hostname,
  inputs,
  ...
}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/nixos-tools.nix
    ../../modules/nixos-dev.nix
    ./hardware-configuration.nix
    ./desktop.nix
    ../../modules/tmux.nix
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ../../modules/home-manager-user.nix
    inputs.nixos-wsl.nixosModules.default
    ./wsl.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  _module.args.user = "nixos";
  _module.args.homeFile = ../../modules/home/nixos.nix;
}
