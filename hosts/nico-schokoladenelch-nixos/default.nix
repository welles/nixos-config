{hostname, ...}: {
  imports = [
    # Bundles
    ../../bundles/base.nix
    ../../bundles/containers.nix
    ../../bundles/impermanence-zfs.nix
    ../../bundles/sops-admin.nix

    # Hardware & boot
    ../../modules/zfs-grub-mirrored-boot.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ../../modules/intel-gpu-i915.nix

    # Networking
    ../../modules/firewall-trusted-subnets.nix
    ../../modules/networkmanager-lan-bridge.nix
    ../../modules/nftables.nix
    ../../modules/tcp-bbr.nix

    # Users & secrets
    ../../modules/root-password.nix
    ../../modules/sops-age-key.nix
    ../../modules/user-password-hashed.nix

    # Shell & user environment
    ../../modules/packages/yazi.nix

    # Services & hardware
    ../../modules/openssh.nix
    ../../modules/server-status.nix
    ../../modules/apcupsd.nix
    ../../modules/caddy.nix
    ../../modules/cloudflared.nix
    ../../modules/fail2ban.nix
    ../../modules/fritzbox-remote-proxy.nix
    ../../modules/glances.nix
    ../../modules/msmtp.nix
    ../../modules/server-logind.nix
    ../../modules/zfs-maintenance.nix

    # Virtual machines (nico-devbox-nixos)
    ../../modules/docker-bridge-forward.nix
    ../../modules/libvirt-vm.nix

    # Docker Compose stacks
    ../../modules/stacks/default.nix
    ./stacks.nix

    # Packages
    ../../modules/packages/bottom.nix
    ../../modules/packages/ctop.nix
    ../../modules/packages/httm.nix
    ../../modules/packages/iotop.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/smartmontools.nix
    ../../modules/packages/systemctl-tui.nix

    # Scripts
    ../../modules/scripts/check-mkv
    ../../modules/scripts/create-zfs-dataset
    ../../modules/scripts/search-tmdb
    ../../modules/scripts/zfs-manual-snapshot
    ../../modules/scripts/zfs-snapshot-diff
  ];

  networking.hostName = hostname;
  networking.hostId = "c0ffee12";
  sops.defaultSopsFile = ./secrets.yaml;
  system.stateVersion = "25.11";
  _module.args = {
    user = "schokoladenelch";
    persistRoot = "/mnt/bucket/persist";
    sopsAgeKeyFile = "/mnt/bucket/persist/var/lib/sops-nix/key.txt";
    pool = "bucket";
    userDescription = "Schokoladenelch";
    userEmail = "nico@welles.email";
    acmeEmail = "admin@welles.email";
    fritzboxRemoteProxy = {
      domain = "fritz.welles.app";
      # Fixed address of the FRITZ!Box in the UniFi router (IoT VLAN)
      upstream = "10.0.3.40:63352";
      # Self-signed certificate of the FRITZ!Box (HTTPS remote access)
      certificate = ./fritzbox-certificate.pem;
    };
    msmtpAccount = {
      host = "smtp.ionos.de";
      user = "noreply@welles.email";
      from = "noreply@welles.email";
    };
    extraDiskMounts = ["/mnt/tank/movies"];
    passwordConfig = {};
    # 1Password SSH agent
    sshAuthorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
    ];
    extraGroups = ["wheel"];
    trustedSubnets = [
      "10.0.1.0/24" # VLAN
      "10.0.4.0/24" # VLAN
      "10.0.5.0/24" # VLAN of the server (and the devbox VM)
      "10.10.0.0/16" # Docker's internal networks
    ];
    lanBridge = {
      name = "br0";
      interface = "enp6s0";
      macAddress = "10:7c:61:b4:90:e4";
    };
    libvirtVms.nico-devbox-nixos = {
      uuid = "dfbb1886-3174-4fc4-9eb9-2c2a41061745";
      # Fix the guest's address in the UniFi router by this MAC address
      macAddress = "52:54:00:c9:00:0a";
      memoryGiB = 16;
      vcpus = 6;
      # Same size as in hosts/nico-devbox-nixos/disk-configuration.nix
      diskSize = "256G";
      # Mounted by the guest at the same paths (its virtiofsMounts)
      virtiofsShares = {
        tank-movies = "/mnt/tank/movies";
        tank-shows = "/mnt/tank/shows";
        tank-downloads = "/mnt/tank/downloads";
        tank-music = "/mnt/tank/music";
        tank-audiobooks = "/mnt/tank/audiobooks";
        tank-podcasts = "/mnt/tank/podcasts";
      };
    };
  };
}
