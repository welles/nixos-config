{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    plasma-manager,
    ...
  } @ inputs: let
    mkSystem = hostname: hardwareConfig:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          hardwareConfig
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.nico = import ./home.nix;
            home-manager.sharedModules = [plasma-manager.homeModules.plasma-manager];
          }
          catppuccin.nixosModules.catppuccin
          {
            networking.hostName = hostname;
          }
        ];
      };
  in {
    nixosConfigurations = {
      nico-thinkpad-nixos = mkSystem "nico-thinkpad-nixos" ./hardware-configuration-nico-thinkpad-nixos.nix;
      nico-thinkbook-nixos = mkSystem "nico-thinkbook-nixos" ./hardware-configuration-nico-thinkbook-nixos.nix;
    };
  };
}
