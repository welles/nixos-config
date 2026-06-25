{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.eltern = import ./home.nix;
    backupFileExtension = "backup";
    sharedModules = [
      {
        home = {
          username = "eltern";
          homeDirectory = "/home/eltern";
          stateVersion = "25.11";
        };
        programs.home-manager.enable = true;
      }
    ];
  };
}
