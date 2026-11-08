{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  environment.systemPackages = [pkgs.azure-cli];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".azure"];
  };
}
