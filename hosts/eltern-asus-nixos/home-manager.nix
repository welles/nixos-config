{
  inputs,
  user,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.${user} = import ./home.nix;
    backupFileExtension = "backup";
    sharedModules = [
      {
        home = {
          username = user;
          homeDirectory = "/home/${user}";
          stateVersion = "25.11";
        };
        programs.home-manager.enable = true;
      }
    ];
  };
}
