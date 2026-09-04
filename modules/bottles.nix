{
  lib,
  pkgs,
  user,
  persistRoot ? null,
  ...
}: {
  environment.systemPackages = [pkgs.bottles];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/bottles"];
  };
}
