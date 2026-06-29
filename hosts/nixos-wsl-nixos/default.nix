{
  hostname,
  inputs,
  ...
}: {
  imports = [
    ../../modules/nixos-tools.nix
    ../../modules/nixos-dev.nix
    ./hardware-configuration.nix
    ./desktop.nix
    ../../modules/tmux.nix
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ../../modules/home-manager-user.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  programs.zsh.enable = true;
  _module.args.user = "nixos";
  _module.args.homeFile = ../../modules/home/nixos.nix;

  wsl = {
    enable = true;
    defaultUser = "nixos";
    interop.includePath = false;
    ssh-agent.enable = true;
  };
}
