# Schokoladenelch Home Server Configuration
#
# Home server running on ZFS with an ephemeral root (impermanence).
# Hosts Docker-based services (Jellyfin, Navidrome, ARK, Windows VM)
# behind a Caddy reverse proxy, accessible remotely via a Cloudflare
# tunnel.
{
  inputs,
  config,
  pkgs,
  stateVersion,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./persistence.nix
    ./stacks/default.nix
    ../../modules/base.nix
    ../../modules/docker.nix
    ../../modules/networkmanager.nix
  ];

  networking.hostName = "nico-schokoladenelch-nixos";
  system.stateVersion = stateVersion;

  networking.hostId = "c0ffee12";

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/mnt/bucket/persist/var/lib/sops-nix/key.txt";
    age.sshKeyPaths = [];
    validateSopsFiles = true;
    secrets = {
      "cloudflare-ddns-token".mode = "0444";
      "cloudflare-tunnel-token" = {
        owner = "cloudflared";
        group = "cloudflared";
        mode = "0440";
      };
      "msmtp-password".mode = "0444";
    };
  };

  environment.systemPackages = let
    create-zfs-dataset = pkgs.writeShellScriptBin "create-zfs-dataset" (builtins.readFile ./scripts/create-zfs-dataset.sh);
    check-mkv = pkgs.writeShellScriptBin "check-mkv" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.ffmpeg pkgs.findutils pkgs.coreutils]}:$PATH
      ${builtins.readFile ./scripts/check-mkv.sh}
    '';
  in
    with pkgs; [
      create-zfs-dataset
      check-mkv
      bottom
      ctop
      iotop
      lazydocker
      lazygit
      smartmontools
      sops
      ssh-to-age
      systemctl-tui
    ];

  programs.tmux = {
    enable = true;
    extraConfig = "set -g mouse on";
  };

  users.users.root.hashedPassword = "$6$Zb.Cx7FJDZo/huz/$ZcGBfYXbCxpmBEeJd10XSYobATn3AhHY76GsDt/bVBi2ciu3vgAl2tMvFZo.41S9BOv2xDLKSG9t/.wcn2qA11";

  users.users.cloudflared = {
    group = "cloudflared";
    isSystemUser = true;
  };
  users.groups.cloudflared = {};

  users.users.schokoladenelch = {
    description = "Schokoladenelch";
    extraGroups = ["wheel" "docker" "networkmanager"];
    hashedPassword = "$6$Zb.Cx7FJDZo/huz/$ZcGBfYXbCxpmBEeJd10XSYobATn3AhHY76GsDt/bVBi2ciu3vgAl2tMvFZo.41S9BOv2xDLKSG9t/.wcn2qA11";
    isNormalUser = true;
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs stateVersion;};
    sharedModules = [
      {
        home.username = "schokoladenelch";
        home.homeDirectory = "/home/schokoladenelch";
        home.stateVersion = stateVersion;
        programs.home-manager.enable = true;
      }
    ];
    users.schokoladenelch = import ./home.nix;
  };
}
