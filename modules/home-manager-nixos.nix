{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.nixos = import ./home/nixos.nix;
    backupFileExtension = "backup";
    sharedModules = [
      {
        home = {
          username = "nixos";
          homeDirectory = "/home/nixos";
          stateVersion = "25.11";
        };
        programs.home-manager.enable = true;
      }
    ];
  };
}
