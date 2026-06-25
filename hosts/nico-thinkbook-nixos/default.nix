{
  hostname,
  pkgs,
  ...
}: {
  imports = [
    # "global.nix"-style: tmux before the body
    ../../modules/tmux.nix

    # "configurations/nico"-style imports (no systemPackages)
    ../../modules/1password.nix
    ../../modules/docker.nix
    ../../modules/kde-plasma.nix
    ../../modules/networkmanager.nix
    ../../modules/profile-icon
    ../../modules/wifi-welles-intern
    ../../modules/pipewire.nix
    ./services.nix

    # "configurations/nico"-style systemPackages imports (order matters for hash)
    ./packages.nix # first sp-import → last in reversed Phase 1
    ./rclone.nix # second sp-import → 4th in reversed Phase 1

    # "configurations/nico"-style settings
    ./users.nix
    ./locale.nix
    ./nix.nix
    ./sops.nix
    ./home-manager.nix

    # "machines/thinkbook"-style imports (no systemPackages)
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./impermanence.nix
    ./nvidia-gpu.nix
    ../../modules/wifi-welles-starlink
    ../../modules/xone-dongle.nix

    # "machines/thinkbook"-style systemPackages imports (order matters for hash)
    ../../modules/eden.nix # third sp-import → 3rd in reversed Phase 1
    ../../modules/occt # fourth sp-import → 2nd in reversed Phase 1
    ../../modules/scripts/check-persist # last sp-import → 1st in reversed Phase 1

    ../../modules/zfs-laptop-boot.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "54af8977";
  system.stateVersion = "25.11";
  _module.args.user = "nico";

  systemd.services.NetworkManager-wait-online.enable = false;

  hardware = {
    bluetooth.enable = true;
    new-lg4ff.enable = true;
    usb-modeswitch.enable = true;
  };

  services = {
    udev = {
      packages = [pkgs.oversteer];
      extraRules = ''
        ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c26d", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01"
      '';
    };

    sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Phase 2 systemPackages: matches old [machines-body ++ global-body] order
  environment.systemPackages = with pkgs; [
    openttd-jgrpp
    oversteer
    prismlauncher
    streamcontroller
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
