{
  pkgs,
  user,
  ...
}: {
  services = {
    printing.enable = true;
    libinput.enable = true;
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.cinnamon.enable = true;
    };
    displayManager.autoLogin = {
      enable = true;
      inherit user;
    };
  };

  environment.etc."xdg/autostart/firefox.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Firefox
    Exec=${pkgs.firefox}/bin/firefox
  '';
}
