# NixOS Flake Configuration
#
# Manages 6 NixOS systems across desktops, laptops, a home server,
# and a WSL environment. Each system lives in hosts/<hostname>/ and
# is fully self-contained — it imports only the modules it needs.
#
# Systems:
#   - nico-thinkpad-nixos:        ThinkPad laptop (KDE Plasma desktop)
#   - nico-thinkbook-nixos:       ThinkBook laptop (KDE Plasma + NVIDIA)
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
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    stateVersion = "25.11";
    commonModules = [
      inputs.determinate.nixosModules.default
      inputs.disko.nixosModules.disko
      inputs.impermanence.nixosModules.impermanence
      inputs.sops-nix.nixosModules.sops
      home-manager.nixosModules.home-manager
    ];
  in {
    nixosConfigurations = {
      nico-thinkpad-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs stateVersion;};
        modules = commonModules ++ [./hosts/nico-thinkpad-nixos];
      };

      nico-thinkbook-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs stateVersion;};
        modules = commonModules ++ [./hosts/nico-thinkbook-nixos];
      };

      eltern-asus-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs stateVersion;};
        modules = commonModules ++ [./hosts/eltern-asus-nixos];
      };

      nico-schokoladenelch-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs stateVersion;};
        modules = commonModules ++ [./hosts/nico-schokoladenelch-nixos];
      };

      nixos-wsl-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs stateVersion;};
        modules = commonModules ++ [./hosts/nixos-wsl-nixos];
      };

      nixos-virtualbox-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs stateVersion;};
        modules = commonModules ++ [./hosts/nixos-virtualbox-nixos];
      };
    };
  };
}
