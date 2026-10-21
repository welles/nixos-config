{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  environment.systemPackages = [pkgs.fsearch];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".config/fsearch"];
  };
}
