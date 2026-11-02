{
  lib,
  user,
  persistRoot,
  ...
}: {
  programs.firefox.enable = true;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".mozilla"];
  };
}
