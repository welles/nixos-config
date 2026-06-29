{
  hostname,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/nixos-tools.nix # nixos-diff → last in merged systemPackages
    ./packages.nix # firefox/jellyfin/chrome → before nixos-diff
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ../../modules/tmux.nix
    ../../modules/networkmanager.nix
    ../../modules/avahi.nix
    ./locale.nix
    ./nix.nix
    ./home-manager.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  programs.zsh.enable = true;
  _module.args.user = "eltern";

  boot = {
    loader = {
      timeout = 0;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };
    kernelParams = [
      "splash"
      "quiet"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    initrd.verbose = false;
    consoleLogLevel = 0;
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

  services = {
    printing.enable = true;
    libinput.enable = true;
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.cinnamon.enable = true;
    };
    displayManager.autoLogin = {
      enable = true;
      user = "eltern";
    };
  };

  environment.etc."xdg/autostart/firefox.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Firefox
    Exec=${pkgs.firefox}/bin/firefox
  '';

  users.users.eltern = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "Moni & Gerri";
    extraGroups = ["wheel"];
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    dates = "daily";
    flake = "github:welles/nixos-config#${hostname}";
  };
}
