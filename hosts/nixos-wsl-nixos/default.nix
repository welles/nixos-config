{
  hostname,
  inputs,
  ...
}: {
  imports = [
    ./nixos-tools.nix
    ../../modules/nixos-dev.nix
    ./hardware-configuration.nix
    ./desktop.nix
    ../../modules/tmux.nix
    ./locale.nix
    ./nix.nix
    ./home-manager.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  programs.zsh.enable = true;
  _module.args.user = "nixos";

  wsl = {
    enable = true;
    defaultUser = "nixos";
    interop.includePath = false;
    ssh-agent.enable = true;
  };
}
