# Isolated Claude Code Remote Control Container
#
# Runs a permanent `claude remote-control` session inside a declarative
# NixOS container (systemd-nspawn), separated from the rest of the server:
#   - Own root filesystem (ephemeral, rebuilt on every container start) and
#     process namespace; runs as the unprivileged user `claude` without
#     wheel/docker access.
#   - Only /home/claude persists, backed by the ZFS dataset bucket/claude
#     (logins for Claude, gh and az, repositories, ~/.claude config).
#   - Private network (veth + NAT) with internet access only: traffic to
#     private ranges (LAN, Docker networks) is dropped before it is forwarded.
#   - Claude Code comes from nixpkgs-unstable; the built-in auto-updater is
#     disabled, updates arrive via `nix flake update`.
#
# Shortcuts on the host (via `claude-shell`):
#   claude-shell          login shell as user claude inside the container
#   claude-shell rc       attach to the tmux session running remote-control
#   claude-shell root     root shell inside the container
#
# One-time setup after the first deploy (as user claude inside the
# container, `claude-shell`): run `claude` and `/login`, `gh auth login`,
# `az login`, then
# `sudo systemctl restart container@claude` on the host.
{
  inputs,
  pkgs,
  ...
}: let
  uid = 1500;
  homeDir = "/mnt/bucket/claude";

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

  claudeShell = pkgs.writeShellScriptBin "claude-shell" ''
    set -euo pipefail
    [ "$(id -u)" -eq 0 ] || exec sudo "$0" "$@"
    machinectl=${pkgs.systemd}/bin/machinectl
    case "''${1:-}" in
      "") exec "$machinectl" shell claude@claude ;;
      rc) exec "$machinectl" shell claude@claude /run/current-system/sw/bin/tmux attach -t rc ;;
      root) exec "$machinectl" shell root@claude ;;
      *)
        echo "Usage: claude-shell [rc|root]" >&2
        exit 1
        ;;
    esac
  '';
in {
  environment.systemPackages = [claudeShell];

  containers.claude = {
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostAddress = "192.168.200.1";
    localAddress = "192.168.200.2";

    bindMounts."/home/claude" = {
      hostPath = homeDir;
      isReadOnly = false;
    };

    config = _: {
      system.stateVersion = "25.11";

      # The host's LAN resolver is unreachable from the container
      networking = {
        nameservers = ["1.1.1.1" "9.9.9.9"];
        useHostResolvConf = false;
      };

      time.timeZone = "Europe/Berlin";

      users.users.claude = {
        inherit uid;
        isNormalUser = true;
        home = "/home/claude";
      };

      environment.systemPackages = devTools;

      # Allow prebuilt binaries (e.g. from npm packages) to run
      programs.nix-ld.enable = true;

      systemd.tmpfiles.rules = ["d /home/claude/workspace 0755 claude users -"];

      systemd.services.claude-remote-control = {
        description = "Claude Code Remote Control session";
        wantedBy = ["multi-user.target"];
        wants = ["network-online.target"];
        after = ["network-online.target"];
        path = devTools;
        environment.DISABLE_AUTOUPDATER = "1";
        serviceConfig = {
          User = "claude";
          WorkingDirectory = "/home/claude/workspace";
          Type = "forking";
          ExecStart = "${pkgs.tmux}/bin/tmux new-session -d -s rc claude remote-control";
          ExecStop = "${pkgs.tmux}/bin/tmux kill-session -t rc";
          Restart = "always";
          RestartSec = "30s";
        };
      };
    };
  };

  systemd = {
    tmpfiles.rules = ["d ${homeDir} 0700 ${toString uid} 100 -"];

    services = {
      "container@claude".unitConfig.RequiresMountsFor = [homeDir];

      # Docker sets the iptables FORWARD policy to DROP, which would also
      # block the container's NAT traffic. DOCKER-USER is Docker's hook for
      # custom rules; the LAN drop in claude-isolation still applies first.
      claude-container-docker-forward = {
        description = "Allow forwarding for the Claude container past Docker's FORWARD policy";
        wantedBy = ["docker.service"];
        after = ["docker.service"];
        partOf = ["docker.service"];
        path = [pkgs.iptables];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        script = ''
          iptables -C DOCKER-USER -i ve-claude -j ACCEPT 2>/dev/null \
            || iptables -I DOCKER-USER -i ve-claude -j ACCEPT
          iptables -C DOCKER-USER -o ve-claude -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT 2>/dev/null \
            || iptables -I DOCKER-USER -o ve-claude -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
        '';
        preStop = ''
          iptables -D DOCKER-USER -i ve-claude -j ACCEPT || true
          iptables -D DOCKER-USER -o ve-claude -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT || true
        '';
      };
    };
  };

  networking = {
    nat = {
      enable = true;
      internalInterfaces = ["ve-claude"];
    };

    networkmanager.unmanaged = ["interface-name:ve-*"];

    # Internet only: drop everything the container sends to private ranges
    # (LAN 10.0.0.0/24, Docker networks 10.10.0.0/16, other RFC1918 nets).
    # A drop verdict in any forward base chain is final.
    nftables.tables.claude-isolation = {
      family = "inet";
      content = ''
        chain forward {
          type filter hook forward priority filter - 10; policy accept;
          iifname "ve-claude" ip daddr { 10.0.0.0/8, 100.64.0.0/10, 169.254.0.0/16, 172.16.0.0/12, 192.168.0.0/16 } drop
        }
      '';
    };
  };
}
