{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  environment.systemPackages = [pkgs.vscode];

  home-manager.sharedModules = [
    {
      home.sessionVariables.EDITOR = "code";
    }
  ];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".config/Code" ".vscode"];
  };
}
