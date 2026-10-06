# Isolated Development Container ("devbox")
#
# General-purpose development environment inside a declarative NixOS
# container (systemd-nspawn), separated from the rest of the server:
#   - Own root filesystem (ephemeral, rebuilt on every container start) and
#     process namespace; the unprivileged user `dev` has no wheel/docker
#     access.
#   - State lives on the ZFS dataset bucket/devbox (/mnt/bucket/devbox):
#       home/  -> /home/dev (repositories, logins for Claude/gh/az, dotfiles)
#       ssh/   -> SSH host keys, so the host key survives container restarts
#   - Private network (veth + NAT): the container reaches the internet but
#     nothing in private ranges (LAN, Docker networks). From the LAN, only
#     SSH via host port 2222 reaches the container.
#   - Dev tooling: Claude Code (nixpkgs-unstable, auto-updater disabled),
#     gh, azure-cli, nodejs, pnpm, python3, git; nix-ld for prebuilt
#     binaries such as the VS Code server.
#   - A permanent `claude remote-control` session runs in the tmux session
#     `claude`, working in ~/workspace.
#   - A permanent VS Code tunnel (`code tunnel`, official Microsoft relay)
#     named `devbox` makes the container reachable from vscode.dev or a
#     local VS Code ("Remote - Tunnels") after signing in with GitHub.
#   - Home Manager for `dev` with the same modules as the other development
#     hosts: git (author, pull.rebase, rebase.autoStash, LFS), zsh with
#     oh-my-zsh (shell.nix) and the CLI tools (starship, eza, fzf, btop).
#   - SSH key for GitHub from sops (`devbox-github-ssh-key` in secrets.yaml):
#     the host copies it to the tmpfs /run/devbox-secrets, which is mounted
#     read-only into the container; ~/.ssh/config uses it for github.com.
#
# Host shortcuts (via `devbox`):
#   devbox          login shell as user dev
#   devbox claude   attach to the Claude Remote Control tmux session
#   devbox root     root shell inside the container
#
# VS Code (Remote - SSH), ~/.ssh/config on the client:
#   Host devbox
#     HostName <schokoladenelch LAN address>
#     Port 2222
#     User dev
#
# One-time setup after the first deploy (`devbox`): run `claude` and
# `/login`, `gh auth login`, `az login`, `code tunnel user login --provider
# github`, then `devbox root` and
# `systemctl restart claude-remote-control vscode-tunnel`.
{
  config,
  inputs,
  pkgs,
  user,
  userEmail,
  ...
}: let
  name = "devbox";
  # Git author; the host's own userDescription is the server account name
  devUserDescription = "Nico Welles";
  uid = 1500;
  stateDir = "/mnt/bucket/devbox";
  sshPort = 2222;
  lanSubnet = "10.0.0.0/24";
  vethInterface = "ve-${name}";
  secretsDir = "/run/devbox-secrets";

  pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };

  devTools =
    [pkgsUnstable.claude-code]
    ++ (with pkgs; [
      azure-cli
      bashInteractive
      coreutils
      curl
      gh
      git
      gnugrep
      gnused
      jq
      nodejs
      openssh
      pnpm
      python3
      ripgrep
      tmux
      unzip
      wget
    ]);

  # Official VS Code CLI; `code tunnel` downloads the matching VS Code server
  # into ~/.vscode, which runs via nix-ld.
  inherit (pkgs) vscode;

  devboxCli = pkgs.writeShellScriptBin "devbox" ''
    set -euo pipefail
    [ "$(id -u)" -eq 0 ] || exec sudo "$0" "$@"
    machinectl=${pkgs.systemd}/bin/machinectl
    case "''${1:-}" in
      "") exec "$machinectl" shell dev@${name} ;;
      claude) exec "$machinectl" shell dev@${name} /run/current-system/sw/bin/tmux attach -t claude ;;
      root) exec "$machinectl" shell root@${name} ;;
      *)
        echo "Usage: devbox [claude|root]" >&2
        exit 1
        ;;
    esac
  '';
in {
  environment.systemPackages = [devboxCli];

  containers.${name} = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "192.168.200.1";
    localAddress = "192.168.200.2";

    forwardPorts = [
      {
        protocol = "tcp";
        hostPort = sshPort;
        containerPort = 22;
      }
    ];

    bindMounts = {
      "/home/dev" = {
        hostPath = "${stateDir}/home";
        isReadOnly = false;
      };
      "/etc/ssh/host-keys" = {
        hostPath = "${stateDir}/ssh";
        isReadOnly = false;
      };
      "/run/host-secrets" = {
        hostPath = secretsDir;
        isReadOnly = true;
      };
    };

    config = _: {
      # The impermanence module only provides the option shell.nix refers to;
      # with persistRoot = null nothing is persisted through it.
      imports = [
        inputs.home-manager.nixosModules.home-manager
        inputs.impermanence.nixosModules.impermanence
        ../../modules/shell.nix
      ];

      _module.args = {
        user = "dev";
        persistRoot = null;
      };

      system.stateVersion = "25.11";

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = {
          inherit userEmail;
          userDescription = devUserDescription;
        };
        users.dev = {
          imports = [
            ../../modules/cli-tools.nix
            ../../modules/packages/git.nix
          ];
          home.stateVersion = "25.11";

          programs.ssh = {
            enable = true;
            enableDefaultConfig = false;
            settings."github.com" = {
              IdentityFile = "/run/host-secrets/github_ed25519";
              IdentitiesOnly = true;
            };
          };
        };
      };

      # The host's LAN resolver is unreachable from the container
      networking = {
        nameservers = ["1.1.1.1" "9.9.9.9"];
        useHostResolvConf = false;
      };

      time.timeZone = "Europe/Berlin";

      programs.ssh.knownHosts.github = {
        hostNames = ["github.com"];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      };

      users.users.dev = {
        inherit uid;
        isNormalUser = true;
        home = "/home/dev";
        openssh.authorizedKeys.keys = config.users.users.${user}.openssh.authorizedKeys.keys;
      };

      services.openssh = {
        enable = true;
        hostKeys = [
          {
            path = "/etc/ssh/host-keys/ssh_host_ed25519_key";
            type = "ed25519";
          }
        ];
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
          AllowUsers = ["dev"];
        };
      };

      environment.systemPackages = devTools ++ [vscode];

      # Allow prebuilt binaries (VS Code server, npm packages) to run
      programs.nix-ld.enable = true;

      systemd = {
        tmpfiles.rules = ["d /home/dev/workspace 0755 dev users -"];

        services.claude-remote-control = {
          description = "Claude Code Remote Control session";
          wantedBy = ["multi-user.target"];
          wants = ["network-online.target"];
          after = ["network-online.target"];
          path = devTools;
          environment.DISABLE_AUTOUPDATER = "1";
          serviceConfig = {
            User = "dev";
            WorkingDirectory = "/home/dev/workspace";
            Type = "forking";
            ExecStart = "${pkgs.tmux}/bin/tmux new-session -d -s claude claude remote-control";
            ExecStop = "${pkgs.tmux}/bin/tmux kill-session -t claude";
            Restart = "always";
            RestartSec = "30s";
          };
        };

        services.vscode-tunnel = {
          description = "VS Code Remote Tunnel";
          wantedBy = ["multi-user.target"];
          wants = ["network-online.target"];
          after = ["network-online.target"];
          path = devTools;
          serviceConfig = {
            User = "dev";
            WorkingDirectory = "/home/dev/workspace";
            ExecStart = "${vscode}/bin/code tunnel --accept-server-license-terms --name ${name}";
            Restart = "always";
            RestartSec = "30s";
          };
        };
      };
    };
  };

  systemd = {
    tmpfiles.rules = [
      "d ${stateDir}/home 0700 ${toString uid} 100 -"
      "d ${stateDir}/ssh 0700 root root -"
    ];

    services = {
      "container@${name}".unitConfig.RequiresMountsFor = [stateDir];

      # sops secrets are symlinks into /run/secrets.d, which the container
      # can't see; copy the GitHub key into a tmpfs directory owned by dev.
      devbox-secrets = {
        description = "Provide secrets to the devbox container";
        requiredBy = ["container@${name}.service"];
        before = ["container@${name}.service"];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        script = ''
          install -d -m 0750 -o root -g 100 ${secretsDir}
          install -m 0400 -o ${toString uid} -g 100 \
            ${config.sops.secrets."devbox-github-ssh-key".path} ${secretsDir}/github_ed25519
        '';
      };

      # Docker sets the iptables FORWARD policy to DROP, which would also
      # block the container's traffic. DOCKER-USER is Docker's hook for
      # custom rules; the filtering in devbox-isolation still applies first.
      devbox-docker-forward = {
        description = "Allow forwarding for the devbox container past Docker's FORWARD policy";
        wantedBy = ["docker.service"];
        after = ["docker.service"];
        partOf = ["docker.service"];
        path = [pkgs.iptables];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        script = ''
          for dir in -i -o; do
            iptables -C DOCKER-USER "$dir" ${vethInterface} -j ACCEPT 2>/dev/null \
              || iptables -I DOCKER-USER "$dir" ${vethInterface} -j ACCEPT
          done
        '';
        preStop = ''
          for dir in -i -o; do
            iptables -D DOCKER-USER "$dir" ${vethInterface} -j ACCEPT || true
          done
        '';
      };
    };
  };

  networking = {
    nat = {
      enable = true;
      internalInterfaces = [vethInterface];
    };

    networkmanager.unmanaged = ["interface-name:ve-*"];

    # - Replies to connections opened from the LAN (SSH) may pass.
    # - The container must not open connections to private ranges (LAN
    #   10.0.0.0/24, Docker networks 10.10.0.0/16, other RFC1918 nets).
    # - New connections into the container are only allowed from the LAN
    #   (port forwarding happens before the input firewall).
    # A drop verdict in any forward base chain is final.
    nftables.tables.devbox-isolation = {
      family = "inet";
      content = ''
        chain forward {
          type filter hook forward priority filter - 10; policy accept;
          ct state established,related accept
          iifname "${vethInterface}" ip daddr { 10.0.0.0/8, 100.64.0.0/10, 169.254.0.0/16, 172.16.0.0/12, 192.168.0.0/16 } drop
          oifname "${vethInterface}" ip saddr != ${lanSubnet} drop
        }
      '';
    };
  };
}
