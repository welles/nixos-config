{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        default = "saved";
        gfxmodeEfi = "1920x1080";
        gfxpayloadEfi = "keep";
        theme = pkgs.sleek-grub-theme.override {
          # withBanner = "Grub Bootloader";
          withStyle = "dark";
        };
      };
    };
    kernelParams = ["splash" "quiet"];
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = ["rings"];
        })
      ];
    };
  };

  networking.networkmanager.enable = true;

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "Europe/Berlin";
  };

  i18n.defaultLocale = "de_DE.UTF-8";

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

  services = {
    xserver.enable = true;
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
    };
    desktopManager.plasma6.enable = true;
    power-profiles-daemon.enable = true;
    xserver.xkb = {
      layout = "de";
      variant = "";
    };
    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  console.keyMap = "de";

  security.rtkit.enable = true;

  users.users.nico = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "Nico";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };

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

  programs = {
    firefox.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d";
      };
      flake = "/home/nico/nixos";
    };
    zsh.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    lazygit
    vscode
    vesktop
    jetbrains.rider
    dotnet-sdk_10
    smartgit
    fastfetch
    bitwarden-desktop
    alejandra
    statix
    deadnix
    google-chrome
  ];

  nix.settings.auto-optimise-store = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.activationScripts.script.text = ''
    mkdir -p /var/lib/AccountsService/icons

    cp ${./floating.png} /var/lib/AccountsService/icons/nico
  '';

  system.stateVersion = "25.11";
}
