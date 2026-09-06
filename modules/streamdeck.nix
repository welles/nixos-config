{
  lib,
  user,
  persistRoot ? null,
  ...
}: {
  programs.streamcontroller.enable = true;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".streamcontroller"];
  };
}
