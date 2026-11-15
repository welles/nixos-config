# Cloudflare Tunnel (remotely managed) for remote access without port
# forwarding. The tunnel token is the sops secret `cloudflare-tunnel-token`
# in the host's secrets.yaml.
{
  config,
  lib,
  pkgs,
  ...
}: {
  services.cloudflared.enable = true;

  systemd.services.cloudflared-tunnel = {
    description = "Cloudflare Tunnel (Remotely Managed)";
    after = ["network-online.target"];
    wants = ["network-online.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      # HTTP/2 (TCP) instead of the default QUIC: on this line QUIC counted many reordered packets as lost and kept its
      # window small, which slowed streaming over the tunnel (music_manager, issue welles/music-manager#17). Same TLS
      # and token; revert by removing --protocol if it does not help.
      ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate --protocol http2 run --token $(cat $CREDENTIALS_DIRECTORY/token)'";
      LoadCredential = "token:${config.sops.secrets."cloudflare-tunnel-token".path}";
      Restart = "always";
      RestartSec = "5s";
      User = "cloudflared";
      Group = "cloudflared";
      StateDirectory = "cloudflared";
      WorkingDirectory = "/var/lib/cloudflared";
    };
  };

  sops.secrets."cloudflare-tunnel-token" = {
    owner = "cloudflared";
    group = "cloudflared";
    mode = "0440";
  };

  users = {
    users.cloudflared = {
      group = "cloudflared";
      isSystemUser = true;
    };
    groups.cloudflared = {};
  };

  # SSH through the tunnel needs these MACs in addition to the ETM ones
  services.openssh.settings.Macs = lib.mkIf config.services.openssh.enable [
    "hmac-sha2-512-etm@openssh.com"
    "hmac-sha2-256-etm@openssh.com"
    "umac-128-etm@openssh.com"
    "hmac-sha2-512" # Cloudflare required
    "hmac-sha2-256" # Cloudflare required
  ];
}
