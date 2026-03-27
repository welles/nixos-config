# Server Services
#
# Configures the core services that make this machine a home server:
# - Caddy: HTTPS reverse proxy for Docker stacks
# - Cloudflared: Cloudflare tunnel for remote access without port forwarding
# - Cockpit: Web-based server management UI (port 9090, LAN only)
# - Fail2ban: Intrusion prevention by banning repeated auth failures
# - Glances: Web-based system monitoring dashboard
# - msmtp: Outbound email relay via Ionos SMTP (for notifications)
# - OpenSSH: Remote access with key-only authentication (no passwords)
# - ZFS maintenance: Automatic scrubs, trimming, and snapshots
{
  config,
  pkgs,
  ...
}: {
  services.caddy = {
    enable = true;
    email = "admin@welles.email";
  };

  services.cloudflared.enable = true;

  systemd.services.cloudflared-tunnel = {
    description = "Cloudflare Tunnel (Remotely Managed)";
    after = ["network-online.target"];
    wants = ["network-online.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --token $(cat $CREDENTIALS_DIRECTORY/token)'";
      LoadCredential = "token:${config.sops.secrets."cloudflare-tunnel-token".path}";
      Restart = "always";
      RestartSec = "5s";
      User = "cloudflared";
      Group = "cloudflared";
      StateDirectory = "cloudflared";
      WorkingDirectory = "/var/lib/cloudflared";
    };
  };

  services.cockpit.enable = true;

  services.fail2ban.enable = true;

  services.glances = {
    enable = true;
    extraArgs = ["--webserver" "--disable-check-update"];
  };

  programs.msmtp = {
    enable = true;
    setSendmail = true;
    defaults = {
      port = 465;
      tls = true;
      tls_starttls = false;
      auth = true;
    };
    accounts = {
      default = {
        host = "smtp.ionos.de";
        user = "noreply@welles.email";
        from = "noreply@welles.email";
        passwordeval = "cat ${config.sops.secrets."msmtp-password".path}";
      };
    };
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      Macs = [
        "hmac-sha2-512-etm@openssh.com"
        "hmac-sha2-256-etm@openssh.com"
        "umac-128-etm@openssh.com"
        "hmac-sha2-512" # Cloudflare required
        "hmac-sha2-256" # Cloudflare required
      ];
    };
  };

  # ZFS maintenance: periodic scrubs, TRIM for SSDs, and automatic snapshots
  services.zfs.autoScrub.enable = true;
  services.zfs.trim.enable = true;
  services.zfs.autoSnapshot.enable = true;

  # Keep user processes alive after logout (for tmux sessions)
  services.logind.settings.Login.KillUserProcesses = false;
}
