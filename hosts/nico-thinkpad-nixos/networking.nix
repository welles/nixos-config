_: {
  networking.firewall.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
}
