# NixOS VirtualBox Configuration
#
# NixOS running in a VirtualBox VM for development. ZFS ephemeral root
# with impermanence. XFCE desktop with auto-login, Docker, and a full
# developer toolchain.
{
  inputs,
  lib,
  pkgs,
  stateVersion,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./boot.nix
    ./desktop.nix
    ./persistence.nix
    ../../modules/base.nix
    ../../modules/docker.nix
  ];

  networking.hostName = "nixos-virtualbox-nixos";
  system.stateVersion = stateVersion;

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  services.xserver.videoDrivers = ["virtualbox" "modesetting"];

  networking.useDHCP = lib.mkDefault true;

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

  environment.sessionVariables.DOTNET_ROOT = "${pkgs.dotnet-sdk_10}";

  users.users.nixos = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "NixOS";
    extraGroups = ["wheel" "docker"];
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
    users.nixos = import ../../modules/home/nixos-dev.nix;
  };
}
