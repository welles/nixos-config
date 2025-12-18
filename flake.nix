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

  outputs = { self, nixpkgs, home-manager, catppuccin, plasma-manager, ... }@inputs: {
    nixosConfigurations = {

      nico-thinkpad-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./hardware-configuration-nico-thinkpad-nixos.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.nico = import ./home.nix;
            home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
          }
          catppuccin.nixosModules.catppuccin
          { networking.hostName = "nico-thinkpad-nixos"; }
        ];
      };

      nico-thinkbook-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./hardware-configuration-nico-thinkbook-nixos.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.nico = import ./home.nix;
            home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
          }
          catppuccin.nixosModules.catppuccin
          { networking.hostName = "nico-thinkbook-nixos"; }
        ];
      };

    };
  };
}
