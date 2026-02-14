{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
    version = "25.11";
    mkSystem = hostname: configuration:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          inputs.disko.nixosModules.disko
          ./configurations/${configuration}/configuration.nix
          (
            if builtins.pathExists ./machines/${hostname}/disk-configuration.nix
            then ./machines/${hostname}/disk-configuration.nix
            else {}
          )
          ./machines/${hostname}/hardware-configuration.nix
          ./machines/${hostname}/machine-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users."${configuration}" = import ./configurations/${configuration}/home.nix;
            home-manager.sharedModules = [
              plasma-manager.homeModules.plasma-manager
              {home.stateVersion = version;}
            ];
            home-manager.backupFileExtension = "backup";
          }
          {
            networking.hostName = hostname;
            system.stateVersion = version;
          }
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
