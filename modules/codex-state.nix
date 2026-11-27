# Sessions, settings and login of Codex, shared by the CLI
# (packages/codex.nix) and the ChatGPT desktop app (packages/chatgpt.nix).
# Impermanence rejects paths persisted twice, and the module system loads
# this file only once however often it is imported.
{
  lib,
  user,
  persistRoot,
  ...
}: {
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".codex"];
  };
}
