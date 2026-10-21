# Cinnamon over RDP (xrdp) on port 3390, as Windows' own RDP server has 3389.
# Without sound, unlike xrdp.nix: WSLg brings its own PulseAudio server.
{xrdpSession, ...}: {
  imports = [../../modules/cinnamon.nix];

  services.xrdp = {
    enable = true;
    defaultWindowManager = xrdpSession;
    openFirewall = true;
    port = 3390;
  };

  # WSL manages the network; Cinnamon would turn these on
  networking.networkmanager.enable = false;
  hardware.bluetooth.enable = false;

  # Opens Keeper (modules/packages/keeper.nix) when the desktop session starts.
  # xrdp keeps the session running across disconnects, so this happens on the
  # first RDP login after WSL starts.
  environment.etc."xdg/autostart/keeperpasswordmanager.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Keeper Password Manager
    Exec=keeperpasswordmanager
    StartupNotify=false
    Terminal=false
  '';
}
