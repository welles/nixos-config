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
          ./configurations/${user}/configuration.nix
          ./machines/${hostname}/hardware-configuration.nix
          ./machines/${hostname}/machine-configuration.nix
          ./machines/${hostname}/disk-configuration.nix
          {
            networking.hostName = hostname;
            system.stateVersion = stateVersion;

            time = {
              timeZone = "Europe/Berlin";
              hardwareClockInLocalTime = true;
            };
            i18n.defaultLocale = "de_DE.UTF-8";
            console.keyMap = "de";

            services.xserver.xkb.layout = "de";

            nixpkgs.config.allowUnfree = true;
            nix.settings.experimental-features = ["nix-command" "flakes"];
            nix.settings.auto-optimise-store = true;

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs user stateVersion;};
              users.${user} = import ./configurations/${user}/home.nix;
              backupFileExtension = "backup";
              sharedModules = [
                {
                  home.username = user;
                  home.homeDirectory = "/home/${user}";
                  home.stateVersion = stateVersion;
                }
              ];
            };
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
