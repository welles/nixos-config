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
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    plasma-manager-unstable = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.home-manager.follows = "home-manager-unstable";
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
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    home-manager-unstable,
    ...
  } @ inputs: let
    stateVersion = "25.11";
    mkSystem = pkgs: hm: hostname: user:
      pkgs.lib.nixosSystem {
        specialArgs = {inherit inputs hostname user stateVersion;};
        modules = [
          inputs.disko.nixosModules.disko
          inputs.impermanence.nixosModules.impermanence
          inputs.sops-nix.nixosModules.sops
          hm.nixosModules.home-manager
          ./global.nix
          ./configurations/${user}
          ./machines/${hostname}
        ];
      };
    mkStableSystem = mkSystem nixpkgs home-manager;
    mkUnstableSystem = mkSystem nixpkgs-unstable home-manager-unstable;
    # New-style builder: everything lives under hosts/<hostname>/
    # The host owns its stateVersion and user — no global.nix, no configurations/ split.
    mkHostSystem = pkgs: hm: hostname:
      pkgs.lib.nixosSystem {
        specialArgs = {inherit inputs hostname;};
        modules = [
          inputs.disko.nixosModules.disko
          inputs.impermanence.nixosModules.impermanence
          inputs.sops-nix.nixosModules.sops
          hm.nixosModules.home-manager
          ./hosts/${hostname}
        ];
      };
    mkUnstableHostSystem = mkHostSystem nixpkgs-unstable home-manager-unstable;
    mkStableHostSystem = mkHostSystem nixpkgs home-manager;
  in {
    nixosConfigurations = {
      nico-thinkpad-nixos = mkUnstableSystem "nico-thinkpad-nixos" "nico";
      nico-thinkbook-nixos = mkUnstableSystem "nico-thinkbook-nixos" "nico";
      eltern-asus-nixos = mkStableHostSystem "eltern-asus-nixos";
      nico-schokoladenelch-nixos = mkStableHostSystem "nico-schokoladenelch-nixos";
      nixos-wsl-nixos = mkUnstableHostSystem "nixos-wsl-nixos";
      nixos-virtualbox-nixos = mkUnstableHostSystem "nixos-virtualbox-nixos";
      nico-desktop-nixos = mkUnstableHostSystem "nico-desktop-nixos";
    };
  };
}
