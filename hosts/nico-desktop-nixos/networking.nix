{...}: {
  imports = [
    ../../modules/wifi-welles-starlink
  ];

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
}
