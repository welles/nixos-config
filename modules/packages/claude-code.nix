{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  environment.systemPackages = [pkgs.claude-code];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user} = {
      files = [".claude.json"];
      directories = [".claude"];
    };
  };
}
