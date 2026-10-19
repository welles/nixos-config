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
}
