{
  config,
  pkgs,
  user,
  ...
}: {
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [
    80 # HTTP
    443 # HTTPS
  ];
  networking.firewall.allowedUDPPorts = [
    443 # HTTPS/3
  ];

  networking.firewall.extraCommands = ''
    # Allow incoming traffic from local network
    iptables -I INPUT -s 10.0.0.0/24 -j ACCEPT
  '';

  environment.systemPackages = with pkgs; [
    bottom
    docker-compose
    iotop
    lazydocker
    lazygit
    smartmontools
    sops
    ssh-to-age
  ];

  # TCP BBR optimization for better network throughput
  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
  };

  # Automatic NixOS garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  services.fail2ban.enable = true;

  # ZFS maintenance
  services.zfs.autoScrub.enable = true;
  services.zfs.trim.enable = true;

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g mouse on
    '';
  };

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";
    # gnupg.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    secrets = {
      # This secret will be at /run/secrets/hello-world
      "hello-world" = {
        owner = "root";
        group = "docker";
        mode = "0440";
      };
      "cloudflare-ddns-token" = {
        mode = "0444";
      };
      "navidrome" = {
        owner = "root";
        group = "docker";
        mode = "0440";
      };
    };
  };

  services.cloudflare-dyndns = {
    enable = true;
    apiTokenFile = config.sops.secrets."cloudflare-ddns-token".path;
    domains = [
      "jellyfin.welles.app"
      "jellyfin-accounts.welles.app"
      "hello.welles.app"
    ];
  };

  services.caddy = {
    enable = true;
    email = "admin@welles.email";

    virtualHosts = {
      "jellyfin.welles.app" = {
        extraConfig = ''
          reverse_proxy 10.0.0.20:50100
        '';
      };
      "jellyfin-accounts.welles.app" = {
        extraConfig = ''
          reverse_proxy 10.0.0.20:50101
        '';
      };
      "hello.welles.app" = {
        extraConfig = ''
          reverse_proxy 10.0.0.20:50200
        '';
      };
    };
  };

  systemd.services.upnp-port-forward = {
    description = "Request UPnP Port Forwards for Caddy";
    after = ["network-online.target"];
    wants = ["network-online.target"];

    script = ''
      ${pkgs.miniupnpc}/bin/upnpc -r 80 80 TCP
      ${pkgs.miniupnpc}/bin/upnpc -r 443 443 TCP
      ${pkgs.miniupnpc}/bin/upnpc -r 443 443 UDP
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

  services.logind.settings.Login.KillUserProcesses = false;

  virtualisation.docker.enable = true;

  services.zfs.autoSnapshot.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  environment.persistence."/mnt/bucket/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/caddy"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
      "/var/lib/docker"
      "/var/lib/sops-nix"
    ];
    files = [
      "/etc/machine-id"
      "/etc/adjtime"
      "/etc/resolv.conf"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
    users.${user} = {
      directories = [
        ".local/share/zsh"
      ];
      files = [
      ];
    };
  };

  programs.zsh.enable = true;

  environment.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake github:welles/nixos-config#${config.networking.hostName} --refresh";
    nixos-boot = "sudo nixos-rebuild boot --flake github:welles/nixos-config#${config.networking.hostName} --refresh";
  };

  users.users.root = {
    hashedPassword = "$6$Zb.Cx7FJDZo/huz/$ZcGBfYXbCxpmBEeJd10XSYobATn3AhHY76GsDt/bVBi2ciu3vgAl2tMvFZo.41S9BOv2xDLKSG9t/.wcn2qA11";
  };

  users.users.${user} = {
    description = "Schokoladenelch";
    extraGroups = ["networkmanager" "wheel" "docker"];
    hashedPassword = "$6$Zb.Cx7FJDZo/huz/$ZcGBfYXbCxpmBEeJd10XSYobATn3AhHY76GsDt/bVBi2ciu3vgAl2tMvFZo.41S9BOv2xDLKSG9t/.wcn2qA11";
    isNormalUser = true;
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
    ];
  };
}
