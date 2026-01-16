{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      timeout = 0;
      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
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
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.cinnamon.enable = true;
      xkb.layout = "de";
    };
    displayManager.autoLogin = {
      enable = true;
      user = "eltern";
    };
  };

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "Europe/Berlin";
  };

  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  environment.systemPackages = with pkgs; [
    firefox
  ];

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
    extraGroups = ["networkmanager" "wheel"];
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    dates = "daily";
    flake = "github:welles/nixos-config#eltern-asus-nixos";
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}
