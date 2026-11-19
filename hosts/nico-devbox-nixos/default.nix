# Development desktop VM on nico-schokoladenelch-nixos; see README.md.
{hostname, ...}: {
  imports = [
    # Bundles
    ../../bundles/base.nix
    ../../bundles/containers.nix
    ../../bundles/dev-tools.nix
    ../../bundles/dotnet-dev.nix
    ../../bundles/impermanence-zfs.nix
    ../../bundles/java-dev.nix
    ../../bundles/nix-dev.nix
    ../../bundles/onepassword.nix
    ../../bundles/sops-admin.nix

    # Hardware & boot
    ../../modules/zfs-systemd-boot.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ../../modules/serial-console.nix
    ../../modules/virtiofs-mounts.nix

    # Users & secrets
    ../../modules/user-password-plaintext.nix

    # Networking: DHCP from the UniFi router. Unlike on the desktops,
    # NetworkManager-wait-online stays enabled, as the Claude services need a
    # working network, including DNS, once network-online.target is reached.
    ../../modules/networkmanager.nix
    ../../modules/openssh.nix

    # Desktop environment: Cinnamon over RDP (Plasma 6.8 dropped the X11
    # sessions xrdp needs), no local login screen.
    ../../modules/cinnamon-panel-windows
    ../../modules/cinnamon-screenshot-shortcut.nix
    ../../modules/rdp-only-desktop.nix
    ../../modules/xrdp-audio.nix
    ../../modules/xrdp-glamor.nix
    ../../modules/xrdp-boot-session.nix
    ../../modules/kasmvnc-xrdp-mirror.nix
    # Publishes KasmVNC and Claude Remote Manager (cloudflare/devbox.tf)
    ../../modules/cloudflared.nix
    ../../modules/user-dirs.nix

    # Services
    ../../modules/claude-desktop-autostart.nix
    ../../modules/claude-remote-manager.nix
    ../../modules/home-assistant-api
    ../../modules/workspace-git.nix
    ../../modules/playwright-mcp.nix
    ../../modules/vscode-tunnel.nix

    # Packages
    ../../modules/packages/musicfab.nix
    ../../modules/packages/streamfab.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/nerd-fonts-fira-code.nix
    ../../modules/packages/fira-sans.nix
    ../../modules/packages/gh.nix
    ../../modules/packages/kdePackages-konsole.nix

    # Development: languages and runtimes
    ../../modules/packages/bun.nix
    ../../modules/packages/powershell.nix
    ../../modules/packages/python3.nix

    # Development: tools
    ../../modules/nix-ld-dev-libraries.nix
    ../../modules/packages/azure-cli.nix
    ../../modules/packages/just.nix
    ../../modules/packages/opentofu.nix
    ../../modules/packages/ripgrep.nix
    ../../modules/packages/sqlcmd.nix
    ../../modules/packages/unzip.nix
    ../../modules/packages/wget.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "75163031";
  sops.defaultSopsFile = ./secrets.yaml;
  system.stateVersion = "26.05";
  _module.args = {
    user = "nico";
    persistRoot = "/persist";
    sopsAgeKeyFile = "/persist/var/lib/sops-nix/key.txt";
    pool = "devbox";
    userDescription = "Nico Welles";
    userEmail = "nico@welles.email";
    sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
    onePasswordVaults = ["Persönlich" "Schokoladenelch"];
    passwordConfig = {};
    # Same key as for the server (1Password SSH agent)
    sshAuthorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
    ];
    extraGroups = ["wheel"];
    homeAssistantUrl = "https://homeassistant.welles.app";
    # The server gives this VM virgl (its libvirtVms.nico-devbox-nixos.virglRenderNode)
    xrdpGlamorExtraDrivers = ["virtio_gpu"];
    # The server's tank datasets (its libvirtVms.nico-devbox-nixos.virtiofsShares)
    virtiofsMounts = {
      "/mnt/tank/movies" = "tank-movies";
      "/mnt/tank/shows" = "tank-shows";
      "/mnt/tank/downloads" = "tank-downloads";
      "/mnt/tank/music" = "tank-music";
      "/mnt/tank/audiobooks" = "tank-audiobooks";
      "/mnt/tank/podcasts" = "tank-podcasts";
    };
    ntfyUrl = "https://ntfy.welles.app";
    claudeRemoteManager = {
      hostName = "claude.welles.app";
      # Previews off for now; later the preview base URL and previewAccessAudience.
      previewUrl = null;
      # cloudflare/apps.tf: team_name, and the app's audience tag, which
      # exists after `./tofu.sh apply` (`./tofu.sh output access_audiences`).
      accessTeamDomain = "nicowelles.cloudflareaccess.com";
      accessAudience = "fa22da04b3e7c6c5ba0a0529d443a722d0570e5561daa2ff43839d82432be1f3";
      # Deliberately empty: only the Google E-Mail group of cloudflare/ gets
      # a token for this app, and the app checks every token's audience. The
      # addresses stay a secret of cloudflare/secrets.yaml.
      accessAllowedEmails = [];
      githubAppId = 5736769;
      # The Claude reviewer of claude-review.yml: its reviews start autofix
      # runs and its approvals count for the ready-to-merge message.
      githubTrustedBots = ["welles-claude-reviewer[bot]"];
      ntfyTopic = "claude-remote-manager";
      instructions = builtins.readFile ./claude-remote-manager.md;
    };
  };
}
