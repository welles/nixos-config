# NixOS Flake Configuration
#
# Manages 6 NixOS systems across desktops, laptops, a VM, a home
# server, and a WSL environment. Each system is assembled from shared
# global settings, a user-specific configuration (configurations/<user>/),
# and a machine-specific configuration (machines/<hostname>/).
#
# Systems:
#   - nico-thinkpad-nixos:        ThinkPad laptop (KDE Plasma desktop)
#   - nico-thinkbook-nixos:       ThinkBook laptop (KDE Plasma + NVIDIA)
#   - nico-vm-nixos:              Development VM (Xfce + XRDP)
#   - eltern-asus-nixos:          Parents' ASUS laptop (Cinnamon, auto-upgrade)
#   - nico-schokoladenelch-nixos: Home server (ZFS, Docker, Caddy, impermanence)
#   - nixos-wsl-nixos:            Windows WSL2 development environment
#   - nixos-virtualbox-nixos:     VirtualBox VM development environment
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    stateVersion = "25.11";
    mkSystem = hostname: user:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs hostname user stateVersion;};
        modules = [
          inputs.determinate.nixosModules.default
          inputs.disko.nixosModules.disko
          inputs.impermanence.nixosModules.impermanence
          inputs.sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          ./global.nix
          ./configurations/${user}
          ./machines/${hostname}
        ];
      };
  in {
    nixosConfigurations = {
      nico-thinkpad-nixos = mkSystem "nico-thinkpad-nixos" "nico";
      nico-thinkbook-nixos = mkSystem "nico-thinkbook-nixos" "nico";
      eltern-asus-nixos = mkSystem "eltern-asus-nixos" "eltern";
      nico-schokoladenelch-nixos = mkSystem "nico-schokoladenelch-nixos" "schokoladenelch";
      nixos-wsl-nixos = mkSystem "nixos-wsl-nixos" "nixos";
      nixos-virtualbox-nixos = mkSystem "nixos-virtualbox-nixos" "nixos";
    };
  };
}
