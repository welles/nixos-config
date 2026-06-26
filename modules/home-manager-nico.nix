{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.nico = import ./home/nico-laptop.nix;
    backupFileExtension = "backup";
    sharedModules = [
      inputs.plasma-manager-unstable.homeModules.plasma-manager
      {
        home = {
          username = "nico";
          homeDirectory = "/home/nico";
          stateVersion = "25.11";
        };
        programs.home-manager.enable = true;
      }
    ];
  };
}
