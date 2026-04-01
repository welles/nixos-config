# Lenovo ThinkPad Configuration
#
# Primary laptop for Nico. ThinkPad convertible with IIO sensors for
# automatic screen rotation, a virtual on-screen keyboard (Maliit),
# KDE Plasma 6 desktop, Docker, and a full developer toolchain.
{
  inputs,
  pkgs,
  stateVersion,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./fritzbox-wireguard.nix
    ./mobile-network.nix
    ../../modules/base.nix
    ../../modules/networkmanager.nix
    ../../modules/docker.nix
    ../../modules/desktop/kde.nix
    ../../modules/pipewire.nix
    ../../modules/avahi.nix
  ];

  networking.hostName = "nico-thinkpad-nixos";
  system.stateVersion = stateVersion;

  # --- Hardware ---
  hardware.bluetooth.enable = true;
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    libinput
    iio-sensor-proxy
    maliit-keyboard

    # Nix tooling
    alejandra
    deadnix
    mcp-nixos
    sops
    ssh-to-age
    statix

    # Development
    dotnet-sdk_10
    jdk25
    jetbrains.rider
    nodejs
    pnpm
    powershell
    vscode

    # Version control
    lazygit
    smartgit

    # Internet & communication
    discord
    google-chrome
    mumble
    remmina
    spotify
    teamspeak6-client

    # Media & graphics
    calibre
    drawing
    gimp
    losslesscut-bin
    obs-studio
    picard
    pinta
    video-compare
    video2x
    vlc
    wrtag

    # Office & productivity
    bitwarden-desktop
    libreoffice
    naps2

    # System utilities
    easyeffects
    evtest
    exfatprogs
    fastfetch
    fsearch
    gparted
    lazydocker
    mission-center
    nerd-fonts.fira-code
    pciutils
    unrar
    usbutils
    xfsprogs
    systemctl-tui

    # KDE extensions
    kdePackages.kzones
    kdePackages.partitionmanager
  ];

  # --- Networking ---
  networking.firewall.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  # --- Boot ---
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };
    supportedFilesystems = ["exfat"];
  };

  # --- Audio ---
  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.min-quantum" = 1024;
    };
  };

  # --- Virtualisation ---
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.vmVariant = {
    virtualisation.useBootLoader = true;
    virtualisation.useEFIBoot = true;
    boot.loader.timeout = 30;
    virtualisation = {
      memorySize = 8192;
      cores = 4;
      qemu.options = ["-vga virtio" "-display gtk,gl=on"];
    };
  };

  # --- Services ---
  services.printing = {
    enable = true;
    drivers = [
      pkgs.gutenprint
      pkgs.gutenprintBin
    ];
  };
  services.flatpak.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # --- Locale ---
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # --- Secrets ---
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";
    validateSopsFiles = true;
  };

  # --- User Account ---
  users.users.nico = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "Nico";
    extraGroups = ["wheel" "libvirtd"];
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;

  environment.shellAliases = {
    ls-gpus = "lspci | grep -E 'VGA|3D'";
  };

  system.activationScripts.set-profile-icon.text = ''
    mkdir -p /var/lib/AccountsService/icons
    cp ${./floating.png} /var/lib/AccountsService/icons/nico
  '';

  # --- Home Manager ---
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs stateVersion;};
    sharedModules = [
      inputs.plasma-manager.homeModules.plasma-manager
      {
        home.username = "nico";
        home.homeDirectory = "/home/nico";
        home.stateVersion = stateVersion;
        programs.home-manager.enable = true;
      }
    ];
    users.nico = import ./home.nix;
  };
}
