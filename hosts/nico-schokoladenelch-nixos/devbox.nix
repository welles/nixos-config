# Isolated Development VM ("devbox")
#
# General-purpose development environment with an XFCE desktop, running as a
# declarative NixOS MicroVM (microvm.nix, QEMU/KVM) on the server:
#   - Own kernel and hardware virtualisation; the unprivileged user `dev` has
#     no wheel access. The root filesystem is a tmpfs, so the VM starts from
#     a clean system on every boot.
#   - State lives on the ZFS dataset bucket/devbox (/mnt/bucket/devbox) and
#     reaches the VM through virtiofs shares:
#       home/  -> /home/dev (repositories, logins for Claude/gh/az, dotfiles,
#                 XFCE settings)
#       ssh/   -> SSH host keys, so the host key survives VM restarts
#       cli/   -> (host only) key pair the `devbox` command logs in with
#   - Nix (with flakes) runs on the VM's own nix-daemon: the host's
#     /nix/store is shared read-only, builds land in a writable overlay
#     (a disk image under /var/lib/microvms/devbox that is recreated on
#     every VM start). Builds therefore stay inside the network isolation.
#   - Private network (tap + NAT): the VM reaches the internet but nothing in
#     private ranges (LAN, Docker networks) and opens no connections to the
#     host. From the LAN, only SSH via host port 2222 reaches the VM; RDP
#     (3389) is reachable only from the Guacamole Docker network.
#   - Desktop: XFCE through xrdp, used via Guacamole (RDP connection to
#     192.168.200.2:3389, user `dev`, password from sops).
#   - Dev tooling: Claude Code (nixpkgs-unstable, auto-updater disabled),
#     gh, azure-cli, nodejs, pnpm, bun, just, sqlcmd, python3, git, VS Code,
#     Firefox; nix-ld for prebuilt binaries such as the VS Code server.
#   - Browser tests: nix-ld provides the libraries and fonts Chromium needs,
#     so the browsers Playwright downloads (`playwright install chromium`)
#     run unchanged, whatever Playwright version a project pins.
#   - Playwright MCP for Claude Code, with a Nix-built headless Chromium;
#     registered in ~/.claude.json on every VM start.
#   - A permanent `claude remote-control` session runs in the tmux session
#     `claude`, working in ~/workspace.
#   - A permanent VS Code tunnel (`code tunnel`, official Microsoft relay)
#     named `devbox` makes the VM reachable from vscode.dev or a local
#     VS Code ("Remote - Tunnels") after signing in with GitHub.
#   - Home Manager for `dev` with the same modules as the other development
#     hosts: git (author, pull.rebase, rebase.autoStash, LFS), zsh with
#     oh-my-zsh (shell.nix) and the CLI tools (starship, eza, fzf, btop).
#   - Secrets from sops, copied by the host into the tmpfs
#     /run/devbox-secrets and shared read-only into the VM:
#       devbox-github-ssh-key  SSH key for github.com (~/.ssh/config)
#       devbox-user-password   password hash of `dev` (RDP login)
#
# Host shortcuts (via `devbox`):
#   devbox          login shell as user dev
#   devbox claude   attach to the Claude Remote Control tmux session
#   devbox root     root shell inside the VM
#   devbox restart  restart the VM
#
# VS Code (Remote - SSH), ~/.ssh/config on the client:
#   Host devbox
#     HostName <schokoladenelch LAN address>
#     Port 2222
#     User dev
#
# Guacamole connection (Settings -> Connections -> New connection):
#   Protocol RDP, hostname 192.168.200.2, port 3389, username dev,
#   password = the one hashed in devbox-user-password, security mode "Any",
#   "Ignore server certificate" on, keyboard layout German (Qwertz).
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
  cliDir = "${stateDir}/cli";
  sshPort = 2222;
  rdpPort = 3389;
  lanSubnet = "10.0.0.0/24";
  # Network of the Guacamole stack (modules/stacks/guacamole)
  guacamoleSubnet = "10.10.11.0/24";
  tapInterface = "vm-${name}";
  hostAddress = "192.168.200.1";
  vmAddress = "192.168.200.2";
  vmMac = "02:00:00:00:c8:02";
  secretsDir = "/run/devbox-secrets";

  pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };

  # MCP servers for Claude Code (user scope). Playwright MCP from nixpkgs
  # brings its own Nix-built Chromium, independent of nix-ld and of the
  # browsers a project downloads.
  mcpServers.playwright = {
    type = "stdio";
    command = pkgs.lib.getExe pkgsUnstable.playwright-mcp;
    args = ["--headless"];
  };

  devTools =
    (with pkgsUnstable; [bun claude-code])
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
      just
      nix
      nodejs
      openssh
      pnpm
      python3
      ripgrep
      sqlcmd
      tmux
      unzip
      wget
    ]);

  # Shared libraries of Chromium as downloaded by Playwright (its deb.deps),
  # loaded through nix-ld in addition to its default set (which already
  # has curl and systemd).
  chromiumLibraries = with pkgs; [
    alsa-lib
    at-spi2-core
    cairo
    cups.lib
    dbus.lib
    expat
    fontconfig
    freetype
    glib
    gtk3
    libdrm
    libgbm
    libxkbcommon
    nspr
    nss
    pango
    vulkan-loader
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxrandr
  ];

  # Official VS Code CLI; `code tunnel` downloads the matching VS Code server
  # into ~/.vscode, which runs via nix-ld.
  inherit (pkgs) vscode;

  devboxCli = pkgs.writeShellScriptBin "devbox" ''
    set -euo pipefail
    [ "$(id -u)" -eq 0 ] || exec sudo "$0" "$@"
    ssh=(${pkgs.openssh}/bin/ssh -t
      -i ${cliDir}/id_ed25519
      -o IdentitiesOnly=yes
      -o UserKnownHostsFile=${cliDir}/known_hosts
      -o StrictHostKeyChecking=accept-new)
    case "''${1:-}" in
      "") exec "''${ssh[@]}" dev@${vmAddress} ;;
      claude) exec "''${ssh[@]}" dev@${vmAddress} tmux attach -t claude ;;
      root) exec "''${ssh[@]}" root@${vmAddress} ;;
      restart) exec ${pkgs.systemd}/bin/systemctl restart microvm@${name}.service ;;
      *)
        echo "Usage: devbox [claude|root|restart]" >&2
        exit 1
        ;;
    esac
  '';
in {
  imports = [inputs.microvm.nixosModules.host];

  environment.systemPackages = [devboxCli];

  microvm.vms.${name}.config = {
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

    microvm = {
      hypervisor = "qemu";
      vcpu = 4;
      mem = 8192;
      # Free page reporting hands memory the guest doesn't use back to the host
      balloon = true;

      interfaces = [
        {
          type = "tap";
          id = tapInterface;
          mac = vmMac;
          tap.vhost = true;
        }
      ];

      shares = [
        {
          proto = "virtiofs";
          tag = "ro-store";
          source = "/nix/store";
          mountPoint = "/nix/.ro-store";
          readOnly = true;
        }
        {
          proto = "virtiofs";
          tag = "home";
          source = "${stateDir}/home";
          mountPoint = "/home/dev";
        }
        {
          proto = "virtiofs";
          tag = "ssh";
          source = "${stateDir}/ssh";
          mountPoint = "/etc/ssh/host-keys";
        }
        {
          proto = "virtiofs";
          tag = "secrets";
          source = secretsDir;
          mountPoint = "/run/host-secrets";
          readOnly = true;
        }
      ];

      # The Nix database lives on the tmpfs root and forgets everything built
      # into the overlay on reboot, so the overlay starts empty every time
      # (microvm-run runs in /var/lib/microvms/devbox and recreates it).
      writableStoreOverlay = "/nix/.rw-store";
      volumes = [
        {
          image = "nix-store-overlay.img";
          mountPoint = "/nix/.rw-store";
          size = 32768;
        }
      ];
      preStart = "rm -f nix-store-overlay.img";
    };

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

    networking = {
      hostName = name;
      # The host's LAN resolver is unreachable from the VM
      nameservers = ["1.1.1.1" "9.9.9.9"];
      firewall.allowedTCPPorts = [22 rdpPort];
    };

    systemd.network.networks."10-uplink" = {
      matchConfig.MACAddress = vmMac;
      address = ["${vmAddress}/30"];
      gateway = [hostAddress];
    };

    time.timeZone = "Europe/Berlin";

    nix.settings.experimental-features = ["nix-command" "flakes"];

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

    services = {
      openssh = {
        enable = true;
        hostKeys = [
          {
            path = "/etc/ssh/host-keys/ssh_host_ed25519_key";
            type = "ed25519";
          }
        ];
        # Key of the host's `devbox` command (for dev and root)
        authorizedKeysFiles = ["/run/host-secrets/cli.pub"];
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "prohibit-password";
          # root only from the host itself, i.e. through `devbox root`
          AllowUsers = ["dev" "root@${hostAddress}"];
        };
      };

      xserver.desktopManager.xfce.enable = true;

      xrdp = {
        enable = true;
        port = rdpPort;
        defaultWindowManager = "${pkgs.xfce4-session}/bin/xfce4-session";
      };
    };

    environment.systemPackages = devTools ++ [vscode pkgs.firefox];

    # Allow prebuilt binaries (VS Code server, npm packages, Playwright's
    # browsers) to run
    programs.nix-ld = {
      enable = true;
      libraries = chromiumLibraries;
    };

    # Pages in browser tests need fonts; Chromium expects Liberation
    fonts = {
      packages = with pkgs; [dejavu_fonts liberation_ttf noto-fonts-color-emoji];
      fontconfig.enable = true;
    };

    systemd = {
      tmpfiles.rules = ["d /home/dev/workspace 0755 dev users -"];

      services = {
        # The root filesystem is a fresh tmpfs on every boot, so the RDP
        # password of `dev` is set from the shared secret each time.
        dev-password = {
          description = "Set the password of dev from the host's secret";
          wantedBy = ["multi-user.target"];
          before = ["xrdp-sesman.service"];
          unitConfig.RequiresMountsFor = ["/run/host-secrets"];
          path = [pkgs.shadow];
          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
          };
          script = ''
            usermod --password "$(cat /run/host-secrets/dev-password)" dev
          '';
        };

        # ~/.claude.json is mutable state, so the servers are (re)registered
        # through the CLI on every start instead of linking a file.
        claude-mcp-servers = {
          description = "Register MCP servers for Claude Code";
          wantedBy = ["multi-user.target"];
          before = ["claude-remote-control.service" "vscode-tunnel.service"];
          path = devTools;
          environment.DISABLE_AUTOUPDATER = "1";
          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            User = "dev";
          };
          script = pkgs.lib.concatLines (pkgs.lib.mapAttrsToList (name: server: ''
              claude mcp remove --scope user ${name} >/dev/null 2>&1 || true
              claude mcp add-json --scope user ${name} ${pkgs.lib.escapeShellArg (builtins.toJSON server)}
            '')
            mcpServers);
        };

        claude-remote-control = {
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

        vscode-tunnel = {
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
      "d ${cliDir} 0700 root root -"
    ];

    services = {
      "microvm@${name}".unitConfig.RequiresMountsFor = [stateDir];
      "microvm-virtiofsd@${name}".unitConfig.RequiresMountsFor = [stateDir];

      # The tap interface is (re)created before every VM start; give the
      # host its end of the point-to-point network.
      "microvm-tap-interfaces@${name}".serviceConfig.ExecStartPost = [
        "${pkgs.iproute2}/bin/ip address replace ${hostAddress}/30 dev ${tapInterface}"
      ];

      # sops secrets are symlinks into /run/secrets.d, which the VM can't
      # see; copy them into a tmpfs directory that is shared read-only.
      # Also provides the public key of the `devbox` command.
      devbox-secrets = {
        description = "Provide secrets to the devbox VM";
        requiredBy = ["microvm-virtiofsd@${name}.service" "microvm@${name}.service"];
        before = ["microvm-virtiofsd@${name}.service" "microvm@${name}.service"];
        unitConfig.RequiresMountsFor = [stateDir];
        path = [pkgs.openssh];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        script = ''
          install -d -m 0750 -o root -g 100 ${secretsDir}
          install -m 0400 -o ${toString uid} -g 100 \
            ${config.sops.secrets."devbox-github-ssh-key".path} ${secretsDir}/github_ed25519
          install -m 0400 -o root -g root \
            ${config.sops.secrets."devbox-user-password".path} ${secretsDir}/dev-password
          [ -e ${cliDir}/id_ed25519 ] \
            || ssh-keygen -q -t ed25519 -N "" -C "devbox-cli" -f ${cliDir}/id_ed25519
          install -m 0444 -o root -g root ${cliDir}/id_ed25519.pub ${secretsDir}/cli.pub
        '';
      };

      # Docker sets the iptables FORWARD policy to DROP, which would also
      # block the VM's traffic. DOCKER-USER is Docker's hook for custom
      # rules; the filtering in devbox-isolation still applies first.
      devbox-docker-forward = {
        description = "Allow forwarding for the devbox VM past Docker's FORWARD policy";
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
            iptables -C DOCKER-USER "$dir" ${tapInterface} -j ACCEPT 2>/dev/null \
              || iptables -I DOCKER-USER "$dir" ${tapInterface} -j ACCEPT
          done
        '';
        preStop = ''
          for dir in -i -o; do
            iptables -D DOCKER-USER "$dir" ${tapInterface} -j ACCEPT || true
          done
        '';
      };
    };
  };

  networking = {
    nat = {
      enable = true;
      internalInterfaces = [tapInterface];
    };

    networkmanager.unmanaged = ["interface-name:vm-*"];

    # - Replies to connections opened towards the VM may pass.
    # - The VM must not open connections to private ranges (LAN
    #   10.0.0.0/24, Docker networks 10.10.0.0/16, other RFC1918 nets) or to
    #   the host itself.
    # - New connections into the VM: SSH from the LAN (DNAT of host port
    #   2222) and RDP from the Guacamole network.
    # A drop verdict in any filter base chain is final.
    nftables.tables.devbox-isolation = {
      family = "inet";
      content = ''
        chain prerouting {
          type nat hook prerouting priority dstnat; policy accept;
          ip saddr ${lanSubnet} fib daddr type local tcp dport ${toString sshPort} dnat ip to ${vmAddress}:22
        }

        chain input {
          type filter hook input priority filter - 10; policy accept;
          iifname "${tapInterface}" ct state established,related accept
          iifname "${tapInterface}" drop
        }

        chain forward {
          type filter hook forward priority filter - 10; policy accept;
          ct state established,related accept
          iifname "${tapInterface}" ip daddr { 10.0.0.0/8, 100.64.0.0/10, 169.254.0.0/16, 172.16.0.0/12, 192.168.0.0/16 } drop
          oifname "${tapInterface}" ip saddr ${lanSubnet} tcp dport 22 accept
          oifname "${tapInterface}" ip saddr ${guacamoleSubnet} tcp dport ${toString rdpPort} accept
          oifname "${tapInterface}" drop
        }
      '';
    };
  };
}
