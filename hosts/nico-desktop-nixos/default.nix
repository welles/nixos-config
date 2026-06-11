{
  inputs,
  hostname,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./machine-configuration.nix
    ./disk-configuration.nix
    ./impermanence.nix
    ../../modules/tmux.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "7e6301e4";
  system.stateVersion = "26.05";

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-39.8.10"
      ];
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # sops age key lives on the persist dataset so it survives reboots.
  # The direct path bypasses the /var/lib/sops-nix bind mount, which
  # is set up by systemd after the stage-2 activation where sops reads
  # the key — so the bind mount would be too late on first boot.
  sops.age.keyFile = lib.mkForce "/persist/var/lib/sops-nix/key.txt";

  boot = {
    initrd = {
      supportedFilesystems = ["zfs"];
      kernelModules = ["nvme"];
      systemd.services.rollback-root = {
        description = "Rollback ZFS root dataset to a blank snapshot";
        wantedBy = ["initrd.target"];
        after = ["zfs-import-main.service"];
        before = ["sysroot.mount"];
        path = [pkgs.zfs];
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = ''
          echo ""
          echo -e "\e[1;97;44m======================================================\e[0m"
          echo -e "\e[1;97;44m===           ZFS IMPERMANENCE ROLLBACK            ===\e[0m"
          echo -e "\e[1;97;44m======================================================\e[0m"
          echo ""
          if zfs rollback -r main/root@blank; then
            echo -e "\e[1;30;42m [ OK ] \e[0m \e[1;32mmain/root rolled back to @blank\e[0m"
          else
            echo -e "\e[1;97;41m [FAIL] \e[0m \e[1;31mno blank snapshot found for main/root\e[0m"
          fi
          echo ""
        '';
      };
    };
    supportedFilesystems = ["zfs" "exfat"];
    zfs = {
      devNodes = "/dev/disk/by-id";
      forceImportRoot = false;
      forceImportAll = false;
    };
    loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      grub = {
        enable = true;
        efiSupport = true;
        zfsSupport = true;
        device = "nodev";
      };
    };
  };

  programs.zsh.enable = true;

  users.users.nico = {
    isNormalUser = true;
    home = "/home/nico";
    shell = pkgs.zsh;
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "nixos-diff" ''
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

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.nico = import ./home.nix;
    backupFileExtension = "backup";
    sharedModules = [
      {
        home = {
          username = "nico";
          homeDirectory = "/home/nico";
          stateVersion = "26.05";
        };
        programs.home-manager.enable = true;
      }
    ];
  };
}
