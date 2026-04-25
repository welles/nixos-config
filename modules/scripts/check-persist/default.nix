{
  config,
  pkgs,
  lib,
  ...
}: let
  # Check if persistence is defined at all
  hasPersistence = config.environment ? persistence && config.environment.persistence != {};
  cfg =
    if hasPersistence
    then config.environment.persistence
    else {};

  # Helper to extract the path string from impermanence objects
  getPath = x:
    if builtins.isString x
    then x
    else (x.directory or x.file);

  # Function to get all paths for a specific persistence root (like "/persist")
  getPathsForRoot = root: persistConfig: let
    sysDirs = map getPath (persistConfig.directories or []);
    sysFiles = map getPath (persistConfig.files or []);

    usersConfig = persistConfig.users or {};
    userPaths = lib.flatten (lib.mapAttrsToList (
        user: uconf: let
          # Retrieve the home directory of the user safely
          homeDir =
            if config.users.users ? ${user}
            then config.users.users.${user}.home
            else "/home/${user}";
          dirs = map getPath (uconf.directories or []);
          files = map getPath (uconf.files or []);
        in
          (map (x: "${homeDir}/${x}") dirs) ++ (map (x: "${homeDir}/${x}") files)
      )
      usersConfig);
  in
    map (p: "${root}${p}") (sysDirs ++ sysFiles ++ userPaths);

  # Collect all paths across all persistence roots
  allPaths =
    if hasPersistence
    then lib.flatten (lib.mapAttrsToList getPathsForRoot cfg)
    else [];

  pathsFile = pkgs.writeText "configured-persist-paths" (builtins.concatStringsSep "\n" allPaths);
in {
  config = lib.mkIf hasPersistence {
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "check-persist" ''
        export PATH=${pkgs.lib.makeBinPath [pkgs.findutils pkgs.coreutils]}:$PATH
        ${builtins.readFile ./check-persist.sh} "$@" ${pathsFile}
      '')
    ];
  };
}
