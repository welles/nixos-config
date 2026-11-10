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
    ../../modules/user-password-hashed.nix

    # Networking: DHCP from the UniFi router. Unlike on the desktops,
    # NetworkManager-wait-online stays enabled, as the Claude services need a
    # working network, including DNS, once network-online.target is reached.
    ../../modules/networkmanager.nix
    ../../modules/openssh.nix

    # Desktop environment: Cinnamon over RDP (Plasma 6.8 dropped the X11
    # sessions xrdp needs), no local login screen.
    ../../modules/cinnamon.nix
    ../../modules/rdp-only-desktop.nix
    ../../modules/xrdp-audio.nix
    ../../modules/xrdp-glamor.nix
    ../../modules/user-dirs.nix

    # Services
    ../../modules/claude-workspace.nix
    ../../modules/cloudcli
    ../../modules/playwright-mcp.nix
    ../../modules/t3code-server.nix
    ../../modules/vscode-tunnel.nix

    # Packages
    ../../modules/packages/musicfab.nix
    ../../modules/packages/streamfab.nix
    ../../modules/claude-code-foundry
    ../../modules/packages/claude-code.nix
    ../../modules/packages/claude-desktop.nix
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
    claudeWorkspaceRepos = [
      "welles/nixos-config"
      "stamm-phoenix/website-astro"
      "stamm-phoenix/playwright-api"
    ];
    sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
    onePasswordVaults = ["Persönlich" "Schokoladenelch"];
    passwordConfig = {};
    # Same key as for the server (1Password SSH agent)
    sshAuthorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
    ];
    extraGroups = ["wheel"];
    # nico-schokoladenelch-nixos (fixed in the UniFi router): its Cloudflare
    # Tunnel publishes CloudCLI and T3 Code
    webUiSources = ["10.0.5.5"];
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
  };
}
