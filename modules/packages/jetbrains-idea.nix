{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  environment.systemPackages = [pkgs.jetbrains.idea];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [
      ".config/JetBrains"
      ".local/share/JetBrains"
      ".java"
    ];
  };
}
