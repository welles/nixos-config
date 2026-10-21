{
  inputs,
  config,
  lib,
  user,
  homeModules,
  userDescription,
  userEmail,
  sshSigningKey,
  onePasswordVaults,
  sopsAgeKeyFile,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs =
      {inherit inputs userDescription userEmail;}
      // lib.optionalAttrs (sshSigningKey != null) {inherit sshSigningKey;}
      // lib.optionalAttrs (onePasswordVaults != null) {inherit onePasswordVaults;}
      // lib.optionalAttrs (sopsAgeKeyFile != null) {inherit sopsAgeKeyFile;};
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
