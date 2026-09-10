{
  lib,
  pkgs,
  user,
  persistRoot ? null,
  ...
}: {
  environment.systemPackages = [
    pkgs.antigravity-ide
    pkgs.antigravity-cli
  ];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [
      ".antigravity"
      ".antigravity-ide"
      ".antigravity-server"
      ".config/Antigravity"
      ".config/Antigravity IDE"
    ];
  };
}
