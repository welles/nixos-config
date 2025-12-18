{
  config,
  pkgs,
  ...
}: {
  boot.loader = {
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
    };
  };
  catppuccin.grub = {
    enable = true;
    flavor = "mocha";
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

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

  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
  };
  services.desktopManager.plasma6.enable = true;

  services.power-profiles-daemon.enable = true;

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  console.keyMap = "de";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
  };

  programs.firefox.enable = true;

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d";
    };
    flake = "/home/nico/nixos";
  };

  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
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

  system.stateVersion = "25.11"; # Did you read the comment?
}
