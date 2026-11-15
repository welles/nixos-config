# Claude Remote Manager behind a Cloudflare Tunnel on another LAN machine
#
# Lets the service (claude-remote-manager.nix) listen on all IPv4 addresses
# and admits its port only from the machine whose cloudflared forwards to it,
# recognised by the MAC address `tunnelHostMacAddress` (it shares the LAN
# segment with this host, and its address comes from DHCP). No other machine
# in the LAN reaches the port. The app checks the Cloudflare Access token of
# every request anyway; this keeps the port closed to the rest of the LAN.
{
  config,
  tunnelHostMacAddress,
  ...
}: {
  imports = [
    ./claude-remote-manager.nix
    ./nftables.nix
  ];

  services.claude-remote-manager.listenAddress = "0.0.0.0";

  networking.firewall.extraInputRules = ''
    ether saddr ${tunnelHostMacAddress} tcp dport ${toString config.services.claude-remote-manager.port} accept
  '';
}
