# Networking & Firewall
#
# Uses nftables with the NixOS firewall. Opens HTTP/HTTPS ports for
# the Caddy reverse proxy, allows all traffic from the local
# 10.0.0.0/24 subnet, and enables TCP BBR congestion control for
# improved throughput. NetworkManager is enabled globally in global.nix.
#
# The LAN port enp6s0 is a port of the bridge br0, which holds the server's
# address (DHCP from the Fritzbox) and connects bridged VMs such as
# nico-devbox-nixos (nico-devbox-vm.nix) directly to the LAN. br0 uses the
# MAC address of enp6s0, so the Fritzbox keeps assigning the same address
# and port forwards to the server keep working.
_: {
  networking = {
    nftables.enable = true;

    networkmanager.ensureProfiles.profiles = {
      br0 = {
        connection = {
          id = "br0";
          type = "bridge";
          interface-name = "br0";
          autoconnect-slaves = 1;
        };
        ethernet.cloned-mac-address = "10:7c:61:b4:90:e4";
        bridge.stp = false;
        ipv4.method = "auto";
        ipv6.method = "auto";
      };
      br0-enp6s0 = {
        connection = {
          id = "br0-enp6s0";
          type = "ethernet";
          interface-name = "enp6s0";
          master = "br0";
          slave-type = "bridge";
        };
      };
    };

    firewall = {
      allowedTCPPorts = [
        80 # HTTP
        443 # HTTPS
        50051 # Windows RDP (Docker)
      ];
      allowedUDPPorts = [
        443 # HTTP/3
        50051 # Windows RDP (Docker)
      ];

      extraInputRules = ''
        ip saddr 10.0.0.0/24 accept
        ip saddr 10.10.0.0/16 accept # Allow internal Docker communication
      '';
    };
  };

  # # Configure NetworkManager-wait-online to wait for ANY connection instead of ALL.
  # # This prevents the service from failing if some (unused) interfaces are not online.
  # systemd = {
  #   services = {
  #     NetworkManager-wait-online.serviceConfig.ExecStart = [
  #       ""
  #       "${pkgs.networkmanager}/bin/nm-online -q"
  #     ];

  #     # UPnP port forwarding for Caddy and game servers
  #     upnp-port-forward = {
  #       description = "Request UPnP Port Forwards for Caddy";
  #       after = ["network-online.target"];
  #       wants = ["network-online.target"];

  #       script = ''
  #         UPNPC="${pkgs.miniupnpc}/bin/upnpc"
  #         echo "Requesting port forwards..."
  #         $UPNPC -e "Caddy HTTP" -r 80 80 TCP || echo "Failed to forward 80 TCP"
  #         sleep 2
  #         $UPNPC -e "Caddy HTTPS" -r 443 443 TCP || echo "Failed to forward 443 TCP"
  #         sleep 2
  #         $UPNPC -e "Caddy HTTP/3" -r 443 443 UDP || echo "Failed to forward 443 UDP"
  #         sleep 2
  #         $UPNPC -e "ARK Server" -r 50060 7777 UDP || echo "Failed to forward 7777 UDP"
  #         sleep 2
  #         $UPNPC -e "ARK Server" -r 50061 7778 UDP || echo "Failed to forward 7778 UDP"
  #         sleep 2
  #         $UPNPC -e "ARK Server" -r 50063 27015 UDP || echo "Failed to forward 27015 UDP"
  #         sleep 2
  #         $UPNPC -e "Forgejo SSH" -r 50141 22 TCP || echo "Failed to forward 22 TCP"
  #         echo "Finished requesting port forwards."
  #       '';

  #       serviceConfig = {
  #         Type = "oneshot";
  #         User = "root";
  #         Restart = "on-failure";
  #         RestartSec = "5m";
  #       };
  #     };
  #   };

  #   timers.upnp-port-forward = {
  #     wantedBy = ["timers.target"];
  #     timerConfig = {
  #       OnBootSec = "2m";
  #       OnUnitActiveSec = "1h";
  #       Unit = "upnp-port-forward.service";
  #     };
  #   };
  # };

  # TCP BBR congestion control for better network throughput
  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
  };
}
