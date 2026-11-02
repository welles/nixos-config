{
  lib,
  user,
  persistRoot,
  ...
}: {
  programs.obs-studio.enable = true;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".config/obs-studio"];
  };
}
