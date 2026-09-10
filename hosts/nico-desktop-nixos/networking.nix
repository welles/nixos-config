{...}: {
  imports = [
    ../../modules/networkmanager.nix
    ../../modules/wifi-welles-intern
    ../../modules/wifi-welles-starlink
  ];

  systemd.services.NetworkManager-wait-online.enable = false;
}
