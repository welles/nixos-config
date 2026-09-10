{pkgs, ...}: {
  xdg.configFile."autostart/1password.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=1Password
    Comment=1Password startup
    Exec=${pkgs._1password-gui}/bin/1password --silent
    StartupNotify=false
    Terminal=false
  '';
}
