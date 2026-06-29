{
  inputs,
  config,
  user ? (builtins.throw "home-manager-user.nix: set `_module.args.user` to the home username"),
  homeFile ? (builtins.throw "home-manager-user.nix: set `_module.args.homeFile` to the home-manager config path"),
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.${user} = import homeFile;
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
