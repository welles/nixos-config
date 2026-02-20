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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    plasma-manager,
    ...
  } @ inputs: let
    stateVersion = "25.11";
    mkSystem = hostname: user:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs hostname user stateVersion;};
        modules = [
          inputs.disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          ./global.nix
          ./configurations/${user}/configuration.nix
          ./machines/${hostname}/hardware-configuration.nix
          ./machines/${hostname}/machine-configuration.nix
          ./machines/${hostname}/disk-configuration.nix
        ];
      };
  in {
    nixosConfigurations = {
      nico-thinkpad-nixos = mkSystem "nico-thinkpad-nixos" "nico";
      nico-thinkbook-nixos = mkSystem "nico-thinkbook-nixos" "nico";
      nico-vm-nixos = mkSystem "nico-vm-nixos" "vm";
      eltern-asus-nixos = mkSystem "eltern-asus-nixos" "eltern";
    };
  };
}
