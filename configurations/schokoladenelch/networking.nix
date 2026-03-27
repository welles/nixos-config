# Networking & Firewall
#
# Uses nftables with the NixOS firewall. Opens HTTP/HTTPS ports for
# the Caddy reverse proxy, allows all traffic from the local
# 10.0.0.0/24 subnet, and enables TCP BBR congestion control for
# improved throughput. NetworkManager is enabled globally in global.nix.
{pkgs, ...}: {
  networking.nftables.enable = true;

  networking.firewall.allowedTCPPorts = [
    80 # HTTP
    443 # HTTPS
    50051 # Windows RDP (Docker)
  ];
  networking.firewall.allowedUDPPorts = [
    443 # HTTP/3
    50051 # Windows RDP (Docker)
  ];

  networking.firewall.extraInputRules = ''
    ip saddr 10.0.0.0/24 accept
    ip saddr 10.10.0.0/16 accept # Allow internal Docker communication
  '';

  # TCP BBR congestion control for better network throughput
  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
  };

  # UPnP port forwarding for Caddy and game servers
  systemd.services.upnp-port-forward = {
    description = "Request UPnP Port Forwards for Caddy";
    after = ["network-online.target"];
    wants = ["network-online.target"];

    script = ''
      ${pkgs.miniupnpc}/bin/upnpc -e "Caddy HTTP" -r 80 80 TCP || true
      ${pkgs.miniupnpc}/bin/upnpc -e "Caddy HTTPS" -r 443 443 TCP || true
      ${pkgs.miniupnpc}/bin/upnpc -e "Caddy HTTP/3" -r 443 443 UDP || true
      ${pkgs.miniupnpc}/bin/upnpc -e "ARK Server" -r 50060 7777 UDP || true
      ${pkgs.miniupnpc}/bin/upnpc -e "ARK Server" -r 50061 7778 UDP || true
      ${pkgs.miniupnpc}/bin/upnpc -e "ARK Server" -r 50063 27015 UDP || true
    '';

    serviceConfig = {
      Type = "oneshot";
      User = "root";
      Restart = "on-failure";
      RestartSec = "5m";
    };
  };

  systemd.timers.upnp-port-forward = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "2m";
      OnUnitActiveSec = "1h";
      Unit = "upnp-port-forward.service";
    };
  };
}
