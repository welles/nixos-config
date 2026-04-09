# Schokoladenelch Server Configuration
#
# Home server running on ZFS with an ephemeral root (impermanence).
# Hosts Docker-based services (Jellyfin, Navidrome, ARK, Windows VM)
# behind a Caddy reverse proxy, accessible remotely via a Cloudflare
# tunnel. Pulls together boot, networking, services, and persistence
# modules.
{
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../../modules/docker.nix
    ../../modules/networkmanager.nix
    ../../modules/tmux.nix
    ../../modules/scripts/zfs-manual-snapshot
    ../../modules/scripts/zfs-snapshot-diff
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./persistence.nix
    ../../modules/stacks/default.nix
  ];

  networking.hostId = "c0ffee12";

  # Secrets management via sops-nix
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/mnt/bucket/persist/var/lib/sops-nix/key.txt";
    age.sshKeyPaths = [];
    validateSopsFiles = true;
    secrets = {
      "cloudflare-ddns-token" = {
        mode = "0444";
      };
      "cloudflare-tunnel-token" = {
        owner = "cloudflared";
        group = "cloudflared";
        mode = "0440";
      };
      "msmtp-password" = {
        mode = "0444";
      };
    };
  };

  # System packages for server administration
  environment.systemPackages = let
    create-zfs-dataset = pkgs.writeShellScriptBin "create-zfs-dataset" (builtins.readFile ../../modules/scripts/create-zfs-dataset.sh);
    check-mkv = pkgs.writeShellScriptBin "check-mkv" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.ffmpeg pkgs.findutils pkgs.coreutils]}:$PATH
      ${builtins.readFile ../../modules/scripts/check-mkv.sh}
    '';
  in
    with pkgs; [
      create-zfs-dataset
      check-mkv
      bottom
      ctop
      httm
      iotop
      lazydocker
      lazygit
      smartmontools
      sops
      ssh-to-age
      systemctl-tui
    ];

  # User accounts
  users.users.root = {
    hashedPassword = "$6$Zb.Cx7FJDZo/huz/$ZcGBfYXbCxpmBEeJd10XSYobATn3AhHY76GsDt/bVBi2ciu3vgAl2tMvFZo.41S9BOv2xDLKSG9t/.wcn2qA11";
  };

  users.users.cloudflared = {
    group = "cloudflared";
    isSystemUser = true;
  };

  users.groups.cloudflared = {};

  users.users.${user} = {
    description = "Schokoladenelch";
    extraGroups = ["wheel"];
    hashedPassword = "$6$Zb.Cx7FJDZo/huz/$ZcGBfYXbCxpmBEeJd10XSYobATn3AhHY76GsDt/bVBi2ciu3vgAl2tMvFZo.41S9BOv2xDLKSG9t/.wcn2qA11";
    isNormalUser = true;
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
    ];
  };
}
