{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  environment.systemPackages = [pkgs.prismlauncher];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/PrismLauncher"];
  };
}
