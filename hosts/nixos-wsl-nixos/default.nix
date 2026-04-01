# NixOS WSL2 Configuration
#
# NixOS running inside Windows WSL2. Provides Docker for containerised
# development and a full developer toolchain. Networking is handled by
# the WSL2 host so NetworkManager is not enabled here.
{
  inputs,
  pkgs,
  stateVersion,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-wsl.nixosModules.default
    ../../modules/base.nix
    ../../modules/docker.nix
  ];

  networking.hostName = "nixos-wsl-nixos";
  system.stateVersion = stateVersion;

  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.interop.includePath = false;
  wsl.ssh-agent.enable = true;

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    lazygit
    lazydocker
    k9s
    k0sctl
    kubeseal
    kubelogin
    jetbrains.rider
    dotnet-sdk_10
    nodejs
    vscode
    firefox-devedition
    google-chrome
    microsoft-edge
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}";
  };

  users.users.nixos = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "NixOS";
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    linger = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs stateVersion;};
    sharedModules = [
      {
        home.username = "nixos";
        home.homeDirectory = "/home/nixos";
        home.stateVersion = stateVersion;
        programs.home-manager.enable = true;
      }
    ];
    users.nixos = import ./home.nix;
  };
}
