# Docker Compose Stack Orchestration
#
# Declarative management of Docker Compose stacks as systemd services.
# Each stack definition specifies:
#   - enabled: whether the stack should be deployed
#   - secrets: sops-nix secret names required by the stack
#   - proxies: domain-to-port mappings for Caddy reverse proxy
#
# For enabled stacks, this module automatically:
#   1. Copies the docker-compose.yaml to /etc/docker-compose/<name>/
#   2. Creates a systemd service that runs `docker compose up`
#   3. Provisions sops secrets (accessible to the docker group)
#   4. Configures Caddy virtual hosts and Cloudflare DDNS for proxied domains
{
  config,
  pkgs,
  lib,
  ...
}: let
  stacks = {
    ark_server = {
      enabled = true;
      secrets = ["ark_server"];
      proxies = {};
    };
    dockge = {
      enabled = false;
      secrets = [];
      proxies = {};
    };
    drydock = {
      enabled = true;
      secrets = [];
      proxies = {};
    };
    hello_world = {
      enabled = false;
      secrets = ["hello-world"];
      proxies = {
        "hello.welles.app" = 50020;
      };
    };
    jellyfin = {
      enabled = true;
      secrets = [];
      proxies = {
        "jellyfin.welles.app" = 50010;
        "jellyfin-accounts.welles.app" = 50011;
      };
    };
    kasm = {
      enabled = false;
      secrets = ["kasm"];
      proxies = {};
    };
    navidrome = {
      enabled = true;
      secrets = ["navidrome"];
      proxies = {
        "navidrome.welles.app" = 50030;
      };
    };
    webtop = {
      enabled = false;
      secrets = [];
      proxies = {};
    };
    windows = {
      enabled = true;
      secrets = ["windows"];
      proxies = {};
    };
  };

  activeStacks = lib.filterAttrs (name: cfg: cfg.enabled) stacks;

  createStackConfig = name: cfg:
    lib.mkMerge [
      {
        environment.etc."docker-compose/${name}/docker-compose.yaml".source = ./${name}/docker-compose.yaml;

        systemd.services."docker-compose-${name}" = {
          description = "Docker Compose Stack - ${name}";
          requires = ["docker.service"];
          after = ["docker.service"] ++ (map (secret: "sops-nix-secret-${secret}.service") cfg.secrets);
          wantedBy = ["multi-user.target"];

          script = ''
            ${pkgs.docker}/bin/docker compose -f /etc/docker-compose/${name}/docker-compose.yaml up --remove-orphans --pull always
          '';

          preStop = ''
            ${pkgs.docker}/bin/docker compose -f /etc/docker-compose/${name}/docker-compose.yaml down
          '';

          serviceConfig = {
            Restart = "always";
            TimeoutStopSec = 120;
          };
        };
      }

      (lib.mkIf (cfg.secrets != []) {
        sops.secrets = lib.genAttrs cfg.secrets (secretName: {
          owner = "root";
          group = "docker";
          mode = "0440";
          restartUnits = ["docker-compose-${name}.service"];
        });
      })

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
        services.cloudflare-dyndns = {
          enable = true;
          apiTokenFile = config.sops.secrets."cloudflare-ddns-token".path;
          domains = lib.attrNames cfg.proxies;
        };
      })
    ];
in
  lib.mkMerge (lib.mapAttrsToList createStackConfig activeStacks)
