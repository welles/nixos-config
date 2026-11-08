# WireGuard VPN into the home network
#
# Creates a NetworkManager WireGuard connection to the WireGuard server on
# the home router (UniFi gateway). The server listens on the Telekom line
# (WAN2, public IPv4) at `vpn.welles.app` (kept up to date by the server's
# Cloudflare DDNS, modules/stacks). Each host is its own client on the
# router, registered there with the public key of its private key: the
# host provides the secret wireguard/private-key in its sops.defaultSopsFile
# and its tunnel addresses in `homeWireguardAddress`. The private key is
# injected into the .nmconnection file at activation time. The tunnel routes
# all traffic through the home network and is not set to autoconnect (must
# be activated manually).
#
# On impermanent hosts /etc/NetworkManager/system-connections is a bind
# mount of the persisted directory (networkmanager.nix), set up by systemd
# only after activation. So the file goes straight into the persisted
# directory under `persistRoot`, or it would end up hidden under the mount.
{
  config,
  lib,
  pkgs,
  persistRoot,
  homeWireguardAddress,
  ...
}: {
  imports = [./networkmanager.nix];

  environment.systemPackages = [pkgs.wireguard-tools];

  # Replies from the tunnel arrive on a different interface than the
  # default route expects
  networking.firewall.checkReversePath = "loose";

  sops.secrets."wireguard/private-key" = {};

  sops.templates."WireGuard-Welles.nmconnection" = {
    path = "${lib.optionalString (persistRoot != null) persistRoot}/etc/NetworkManager/system-connections/WireGuard-Welles.nmconnection";
    mode = "0600";
    owner = "root";
    group = "root";
    content = ''
      [connection]
      id=WireGuard Welles
      uuid=5b0f3f5e-8f4e-4f43-9a8e-2d6f0f8c1a51
      type=wireguard
      interface-name=wg-welles
      autoconnect=false

      [wireguard]
      private-key=${config.sops.placeholder."wireguard/private-key"}
      private-key-flags=0

      [wireguard-peer.pgiIWjZnxRMQgiBbjL4DUaIxadvJt2c6dqIX9Gfwx0Y=]
      endpoint=vpn.welles.app:51820
      allowed-ips=0.0.0.0/0;::/0;
      persistent-keepalive=25

      [ipv4]
      address1=${homeWireguardAddress.ipv4}/24
      dns=10.0.6.1;
      dns-search=~;
      method=manual

      [ipv6]
      address1=${homeWireguardAddress.ipv6}/64
      method=manual
    '';
  };

  system.activationScripts.reload-nm-connections = {
    text = ''
      ${pkgs.networkmanager}/bin/nmcli connection reload || true
    '';
    deps = ["setupSecrets"];
  };
}
