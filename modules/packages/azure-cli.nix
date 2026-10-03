{
  lib,
  pkgs,
  user,
  persistRoot ? null,
  ...
}: {
  environment.systemPackages = [pkgs.azure-cli];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".azure"];
  };
}
