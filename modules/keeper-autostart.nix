# Opens Keeper (packages/keeper.nix) when the desktop session starts.
_: {
  imports = [./packages/keeper.nix];

  environment.etc."xdg/autostart/keeperpasswordmanager.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Keeper Password Manager
    Exec=keeperpasswordmanager
    StartupNotify=false
    Terminal=false
  '';
}
