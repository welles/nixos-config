# ~/workspace, where the agent services (Claude Remote Control, T3 Code)
# clone repositories and work. Imported by every module that uses it;
# impermanence rejects paths persisted twice, and the module system loads
# this file only once however often it is imported.
{
  lib,
  user,
  persistRoot,
  ...
}: {
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = ["workspace"];
  };
}
