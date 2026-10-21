# Settings, caches and plugins all JetBrains IDEs share. Imported by every
# JetBrains package module; impermanence rejects paths persisted twice, and
# the module system loads this file only once however often it is imported.
{
  lib,
  user,
  persistRoot,
  ...
}: {
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [
      ".config/JetBrains"
      ".local/share/JetBrains"
      ".java"
    ];
  };
}
