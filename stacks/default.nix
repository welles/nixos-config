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
          after = ["docker.service"] ++ lib.optional (cfg.secrets != []) "sops-nix.service";
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
