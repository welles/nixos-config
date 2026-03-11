{
  config,
  pkgs,
  lib,
  ...
}: let
  stacks = {
    ark_server = {
      enabled = true;
      secret = "ark_server";
      proxies = {};
    };
    dockge = {
      enabled = true;
      secret = null;
      proxies = {};
    };
    hello_world = {
      enabled = true;
      secret = "hello-world";
      proxies = {
        "hello.welles.app" = 50020;
      };
    };
    jellyfin = {
      enabled = true;
      secret = null;
      proxies = {
        "jellyfin.welles.app" = 50010;
        "jellyfin-accounts.welles.app" = 50011;
      };
    };
    kasm = {
      enabled = true;
      secret = "kasm";
      proxies = {};
    };
    navidrome = {
      enabled = true;
      secret = "navidrome";
      proxies = {
        "navidrome.welles.app" = 50030;
      };
    };
    webtop = {
      enabled = true;
      secret = null;
      proxies = {};
    };
    windows = {
      enabled = true;
      secret = "windows";
      proxies = {};
    };
  };

  activeStacks = lib.filterAttrs (name: cfg: cfg.enabled) stacks;

  # 2. The Configuration Generator
  createStackConfig = name: cfg:
    lib.mkMerge [
      # Base Stack Configuration (Files & Systemd)
      {
        environment.etc."docker-compose/${name}/docker-compose.yaml".source = ./${name}/docker-compose.yaml;

        systemd.services."docker-compose-${name}" = {
          description = "Docker Compose Stack - ${name}";
          requires = ["docker.service"];
          after = ["docker.service"] ++ lib.optional (cfg.secret != null) "sops-nix.service";
          wantedBy = ["multi-user.target"];

          script = ''
            ${pkgs.docker-compose}/bin/docker-compose -f /etc/docker-compose/${name}/docker-compose.yaml up --remove-orphans --pull always
          '';

          preStop = ''
            ${pkgs.docker-compose}/bin/docker-compose -f /etc/docker-compose/${name}/docker-compose.yaml down
          '';

          serviceConfig = {
            Restart = "always";
            TimeoutStopSec = 120;
          };
        };
      }

      # Optional: Bind SOPS secret if defined
      (lib.mkIf (cfg.secret != null) {
        sops.secrets."${cfg.secret}".restartUnits = ["docker-compose-${name}.service"];
      })

      # Optional: Configure Caddy Reverse Proxy if defined
      (lib.mkIf (cfg.proxies != {}) {
        services.caddy = {
          enable = true;
          virtualHosts =
            lib.mapAttrs (domain: port: {
              extraConfig = ''
                reverse_proxy 127.0.0.1:${toString port}
              '';
            })
            cfg.proxies;
        };
      })
    ];
in
  # 3. Merge everything into the final system configuration
  lib.mkMerge (lib.mapAttrsToList createStackConfig activeStacks)
