# Boot without waiting for the network. NetworkManager-wait-online only
# delays the boot on machines where nothing needs network-online.target.
_: {
  systemd.services.NetworkManager-wait-online.enable = false;
}
