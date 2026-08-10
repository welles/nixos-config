{
  lib,
  pkgs,
  user,
  persistRoot ? null,
  ...
}: {
  environment.systemPackages = [pkgs.claude-code pkgs.codex pkgs.gemini-cli];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user} = {
      files = [".claude.json"];
      directories = [".claude" ".codex" ".gemini"];
    };
  };
}
