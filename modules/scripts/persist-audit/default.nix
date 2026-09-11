{
  config,
  pkgs,
  lib,
  persistRoot ? (builtins.throw "persist-audit: set `_module.args.persistRoot` to the persist dataset root"),
  ...
}: let
  # Check if persistence is defined at all
  hasPersistence = config.environment ? persistence && config.environment.persistence != {};
  cfg =
    if hasPersistence
    then config.environment.persistence
    else {};
  rootCfg = cfg.${persistRoot} or {};

  # Helper to extract the path string from impermanence objects
  getPath = x:
    if builtins.isString x
    then x
    else (x.directory or x.file);

  # Function to get all paths (system + per-user, home-dir expanded) for a
  # given kind ("directories" or "files") under the current persistRoot
  getPathsForKind = kind: let
    sysPaths = map getPath (rootCfg.${kind} or []);

    usersConfig = rootCfg.users or {};
    userPaths = lib.flatten (lib.mapAttrsToList (
        user: uconf: let
          homeDir =
            if config.users.users ? ${user}
            then config.users.users.${user}.home
            else "/home/${user}";
          paths = map getPath (uconf.${kind} or []);
        in
          map (x: "${homeDir}/${x}") paths
      )
      usersConfig);
  in
    map (p: "${persistRoot}${p}") (sysPaths ++ userPaths);

  configuredDirs =
    if hasPersistence
    then getPathsForKind "directories"
    else [];
  configuredFiles =
    if hasPersistence
    then getPathsForKind "files"
    else [];

  dirsFile = pkgs.writeText "configured-persist-dirs" (builtins.concatStringsSep "\n" configuredDirs);
  filesFile = pkgs.writeText "configured-persist-files" (builtins.concatStringsSep "\n" configuredFiles);
in {
  config = lib.mkIf hasPersistence {
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "persist-audit" ''
        export PATH=${pkgs.lib.makeBinPath [pkgs.findutils pkgs.coreutils]}:$PATH
        exec ${pkgs.bash}/bin/bash ${./persist-audit.sh} "${dirsFile}" "${filesFile}" "${persistRoot}" "$@"
      '')
    ];
  };
}
