{
  inputs,
  config,
  user,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    # Feature modules inject their Home Manager configuration through
    # `home-manager.sharedModules`; this only declares the user.
    users.${user} = {};
    backupFileExtension = "backup";
    sharedModules = [
      inputs.plasma-manager-unstable.homeModules.plasma-manager
      {
        home = {
          username = user;
          homeDirectory = "/home/${user}";
          stateVersion = config.system.stateVersion;
        };
        programs.home-manager.enable = true;
      }
    ];
  };
}
