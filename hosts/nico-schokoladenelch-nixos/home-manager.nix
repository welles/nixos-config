{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.schokoladenelch = import ./home.nix;
    backupFileExtension = "backup";
    sharedModules = [
      {
        home = {
          username = "schokoladenelch";
          homeDirectory = "/home/schokoladenelch";
          stateVersion = "25.11";
        };
        programs.home-manager.enable = true;
      }
    ];
  };
}
