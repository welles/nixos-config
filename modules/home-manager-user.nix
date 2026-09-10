{
  inputs,
  config,
  lib,
  user ? (builtins.throw "home-manager-user.nix: set `_module.args.user` to the home username"),
  homeModules ? (builtins.throw "home-manager-user.nix: set `_module.args.homeModules` to the list of home-manager module paths"),
  userDescription ? (builtins.throw "home-manager-user.nix: set `_module.args.userDescription` to the user display name"),
  userEmail ? (builtins.throw "home-manager-user.nix: set `_module.args.userEmail` to the user email"),
  sshSigningKey ? null,
  onePasswordVaults ? null,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs =
      {inherit inputs userDescription userEmail;}
      // lib.optionalAttrs (sshSigningKey != null) {inherit sshSigningKey;}
      // lib.optionalAttrs (onePasswordVaults != null) {inherit onePasswordVaults;};
    users.${user}.imports = homeModules;
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
