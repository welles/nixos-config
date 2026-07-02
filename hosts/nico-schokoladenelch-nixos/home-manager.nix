{
  inputs,
  user,
  userDescription,
  userEmail,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs userDescription userEmail;};
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
