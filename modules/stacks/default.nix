# Docker Compose Stack Orchestration
#
# Declarative management of Docker Compose stacks as systemd services.
# Each stack definition specifies:
#   - enabled: whether the stack should be deployed
#   - secrets: sops-nix secret names required by the stack
#   - proxies: domain-to-port mappings for Caddy reverse proxy
#   - backup.enable: whether to back up this stack with restic
#   - backup.paths: host paths to include in the backup
#
# For enabled stacks, this module automatically:
#   1. Copies the docker-compose.yaml to /etc/docker-compose/<name>/
#   2. Creates a systemd service that runs `docker compose up`
#   3. Provisions sops secrets (accessible to the docker group)
#   4. Configures Caddy virtual hosts and Cloudflare DDNS for proxied domains
#   5. (If backup enabled) Creates a daily 3am restic backup timer that stops
#      the stack, backs up to B2 bucket schokoladenelch-<name>, and restarts.
#      Requires a sops secret "restic-<name>" with restic env vars.
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
      backup = {
        enable = false;
        paths = [];
      };
    };
    dockge = {
      enabled = false;
      secrets = [];
      proxies = {};
      backup = {
        enable = false;
        paths = [];
      };
    };
    forgejo = {
      enabled = true;
      secrets = ["forgejo"];
      proxies = {
        "forgejo.welles.app" = 50140;
      };
      backup = {
        enable = false;
        paths = [];
      };
    };
    drydock = {
      enabled = false;
      secrets = [];
      proxies = {};
      backup = {
        enable = false;
        paths = [];
      };
    };
    jdownloader = {
      enabled = true;
      secrets = ["jdownloader"];
      proxies = {};
      backup = {
        enable = false;
        paths = [];
      };
    };
    musicbrainz_picard = {
      enabled = true;
      secrets = ["musicbrainz_picard"];
      proxies = {};
      backup = {
        enable = false;
        paths = [];
      };
    };
    guacamole = {
      enabled = true;
      secrets = [
        "guacamole_app"
        "guacamole_db"
      ];
      proxies = {};
      backup = {
        enable = false;
        paths = [];
      };
    };
    jellyfin = {
      enabled = true;
      secrets = [];
      proxies = {
        "jellyfin.welles.app" = 50010;
        "jellyfin-accounts.welles.app" = 50011;
        "jellyfin-requests.welles.app" = 50012;
      };
      backup = {
        enable = false;
        paths = [];
      };
    };
    kasm = {
      enabled = false;
      secrets = ["kasm"];
      proxies = {};
      backup = {
        enable = false;
        paths = [];
      };
    };
    navidrome = {
      enabled = true;
      secrets = ["navidrome"];
      proxies = {
        "navidrome.welles.app" = 50030;
      };
      backup = {
        enable = false;
        paths = [];
      };
    };
    nextcloud = {
      enabled = true;
      secrets = ["nextcloud"];
      proxies = {
        "nextcloud.welles.app" = 50100;
      };
      backup = {
        enable = false;
        paths = [];
      };
    };
    webtop = {
      enabled = false;
      secrets = [];
      proxies = {};
      backup = {
        enable = false;
        paths = [];
      };
    };
    windmill = {
      enabled = true;
      secrets = ["windmill"];
      proxies = {
        "windmill.welles.app" = 50150;
      };
      backup = {
        enable = false;
        paths = [];
      };
    };
    windows = {
      enabled = true;
      secrets = ["windows"];
      proxies = {};
      backup = {
        enable = false;
        paths = [];
      };
    };
  };

  activeStacks = lib.filterAttrs (name: cfg: cfg.enabled) stacks;

  createStackConfig = name: cfg:
    lib.mkMerge [
      {
        environment.etc."docker-compose/${name}/docker-compose.yaml".source = ./${name}/docker-compose.yaml;

        systemd.services."docker-compose-${name}" = {
          description = "Docker Compose Stack - ${name}";
          restartTriggers = [./${name}/docker-compose.yaml];
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

      (lib.mkIf cfg.backup.enable {
        sops.secrets."restic-${name}" = {
          owner = "root";
          group = "root";
          mode = "0400";
        };

        systemd.services."restic-backup-${name}" = {
          description = "Restic Backup - ${name}";
          requires = ["docker.service"];
          after = ["docker.service"];
          unitConfig.OnFailure = "restic-backup-notify-${name}.service";

          serviceConfig = {
            Type = "oneshot";
            EnvironmentFile = config.sops.secrets."restic-${name}".path;
          };

          script = let
            docker = "${pkgs.docker}/bin/docker";
            restic = "${pkgs.restic}/bin/restic";
            flock = "${pkgs.util-linux}/bin/flock";
            composefile = "/etc/docker-compose/${name}/docker-compose.yaml";
            repo = "s3:https://s3.eu-central-003.backblazeb2.com/schokoladenelch-${name}";
            pathArgs = lib.concatMapStringsSep " " (p: lib.escapeShellArg p) cfg.backup.paths;
          in ''
            exec ${flock} /run/lock/restic-backup.lock ${pkgs.bash}/bin/bash -c '
              ${docker} compose -f ${composefile} down

              ${restic} -r ${repo} snapshots > /dev/null 2>&1 || ${restic} -r ${repo} init

              ${restic} -r ${repo} backup ${pathArgs}

              ${docker} compose -f ${composefile} up -d --remove-orphans
            '
          '';

          preStop = let
            docker = "${pkgs.docker}/bin/docker";
            composefile = "/etc/docker-compose/${name}/docker-compose.yaml";
          in ''
            ${docker} compose -f ${composefile} up -d --remove-orphans
          '';
        };

        systemd.services."restic-backup-notify-${name}" = {
          description = "Restic Backup Failure Notification - ${name}";
          serviceConfig.Type = "oneshot";
          script = let
            sendmail = "${pkgs.msmtp}/bin/sendmail";
          in ''
            ${sendmail} -t <<EOF
            To: nico@welles.email
            From: noreply@welles.email
            Subject: [restic] Backup failed for stack ${name}

            The restic backup for docker compose stack "${name}" failed.

            Host: $(${pkgs.hostname}/bin/hostname)
            Time: $(date --iso-8601=seconds)

            Journal output (last 50 lines):
            $(journalctl -u restic-backup-${name}.service -n 50 --no-pager)
            EOF
          '';
        };

        systemd.timers."restic-backup-${name}" = {
          description = "Daily Restic Backup Timer - ${name}";
          wantedBy = ["timers.target"];
          timerConfig = {
            OnCalendar = "*-*-* 03:00:00";
            Persistent = true;
          };
        };
      })

      (lib.mkIf (cfg.proxies != {}) {
        services.caddy = {
          enable = true;
          virtualHosts =
            lib.mapAttrs (domain: port: {
              extraConfig = ''
                header Strict-Transport-Security "max-age=15552000; includeSubDomains; preload"
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

        # Wait for internet connectivity before updating DNS records
        systemd.services.cloudflare-dyndns = {
          after = ["network-online.target"];
          wants = ["network-online.target"];
        };
      })
    ];
in
  lib.mkMerge (lib.mapAttrsToList createStackConfig activeStacks)
