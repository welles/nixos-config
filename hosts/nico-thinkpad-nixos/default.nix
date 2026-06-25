{
  hostname,
  pkgs,
  ...
}: {
  imports = [
    # "global.nix"-style: tmux before the body
    ../../modules/tmux.nix

    # "configurations/nico"-style imports (no systemPackages)
    ../../modules/docker.nix
    ../../modules/kde-plasma.nix
    ../../modules/networkmanager.nix
    ../../modules/profile-icon
    ../../modules/wifi-welles-intern
    ../../modules/pipewire.nix
    ./services.nix

    # "configurations/nico"-style systemPackages imports (order matters for hash)
    ./packages.nix # first sp-import → last in reversed Phase 1
    ./rclone.nix # second sp-import → 2nd in reversed Phase 1

    # "configurations/nico"-style settings
    ./users.nix
    ./locale.nix
    ./nix.nix
    ./sops.nix
    ./home-manager.nix

    # "machines/thinkpad"-style imports (no systemPackages)
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./impermanence.nix
    ./fritzbox-wireguard.nix
    ./mobile-network.nix

    # last sp-import → 1st in reversed Phase 1
    ../../modules/scripts/check-persist

    ../../modules/zfs-laptop-boot.nix
  ];

  networking = {
    hostName = hostname;
    hostId = "0aea17fa";
    firewall.enable = true;
  };
  system.stateVersion = "25.11";
  _module.args.user = "nico";

  systemd.services.NetworkManager-wait-online.enable = false;

  hardware = {
    bluetooth.enable = true;
    sensor.iio.enable = true;
  };

  # Phase 2 systemPackages: matches old [machines-body ++ global-body] order
  environment.systemPackages = with pkgs; [
    libinput
    iio-sensor-proxy
    maliit-keyboard
    (writeShellScriptBin "nixos-diff" ''
      TMPDIR=$(mktemp -d)
      trap 'rm -rf "$TMPDIR"' EXIT
      RESULT="$TMPDIR/result"

      echo "Building new configuration..."
      (cd "$TMPDIR" && nixos-rebuild build \
        --flake github:welles/nixos-config#${hostname} \
        --refresh) || exit 1

      echo ""
      echo "=== Package changes ==="
      ${pkgs.nvd}/bin/nvd diff /run/current-system "$RESULT"

      echo ""
      echo "=== Service changes ==="
      sudo "$RESULT/bin/switch-to-configuration" dry-activate
    '')
  ];

  environment.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake github:welles/nixos-config#${hostname} --refresh";
    nixos-boot = "sudo nixos-rebuild boot --flake github:welles/nixos-config#${hostname} --refresh";
  };
}
