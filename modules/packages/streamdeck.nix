{
  lib,
  pkgs,
  user,
  persistRoot ? null,
  ...
}: {
  programs.streamcontroller.enable = true;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".var/app/com.core447.StreamController"];
  };

  home-manager.users.${user}.xdg.configFile."autostart/StreamController.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=StreamController
    Exec=${pkgs.streamcontroller}/bin/streamcontroller -b
  '';
}
