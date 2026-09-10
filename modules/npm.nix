{
  lib,
  user,
  persistRoot ? null,
  ...
}: {
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".npm-global"];
  };

  home-manager.sharedModules = [
    ({config, ...}: {
      imports = [
        ./scripts/npm-global-install
      ];

      home.sessionPath = [
        "${config.home.homeDirectory}/.npm-global/bin"
      ];

      home.file.".npmrc".text = ''
        prefix=${config.home.homeDirectory}/.npm-global
        save-exact=true
        save-prefix=
      '';
    })
  ];
}
