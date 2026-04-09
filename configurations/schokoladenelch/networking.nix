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

  # Configure NetworkManager-wait-online to wait for ANY connection instead of ALL.
  # This prevents the service from failing if some (unused) interfaces are not online.
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = [
    ""
    "${pkgs.networkmanager}/bin/nm-online -q"
  ];

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
      UPNPC="${pkgs.miniupnpc}/bin/upnpc"
      echo "Requesting port forwards..."
      $UPNPC -e "Caddy HTTP" -r 80 80 TCP || echo "Failed to forward 80 TCP"
      sleep 2
      $UPNPC -e "Caddy HTTPS" -r 443 443 TCP || echo "Failed to forward 443 TCP"
      sleep 2
      $UPNPC -e "Caddy HTTP/3" -r 443 443 UDP || echo "Failed to forward 443 UDP"
      sleep 2
      $UPNPC -e "ARK Server" -r 50060 7777 UDP || echo "Failed to forward 7777 UDP"
      sleep 2
      $UPNPC -e "ARK Server" -r 50061 7778 UDP || echo "Failed to forward 7778 UDP"
      sleep 2
      $UPNPC -e "ARK Server" -r 50063 27015 UDP || echo "Failed to forward 27015 UDP"
      sleep 2
      $UPNPC -e "Forgejo SSH" -r 50141 22 TCP || echo "Failed to forward 22 TCP"
      echo "Finished requesting port forwards."
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
