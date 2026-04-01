# Parents' ASUS Laptop Configuration
#
# Simplified desktop for non-technical users. Uses Cinnamon (easier
# than Plasma) with auto-login, a quiet boot with Plymouth animation,
# and Firefox set to autostart. Daily auto-upgrades keep the system
# up to date without manual intervention.
{
  inputs,
  pkgs,
  stateVersion,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ../../modules/base.nix
    ../../modules/networkmanager.nix
    ../../modules/avahi.nix
  ];

  networking.hostName = "eltern-asus-nixos";
  system.stateVersion = stateVersion;

  services.libinput.enable = true;

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

  environment.systemPackages = with pkgs; [
    firefox
    jellyfin-desktop
    google-chrome
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
    extraGroups = ["wheel" "networkmanager"];
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    dates = "daily";
    flake = "github:welles/nixos-config#eltern-asus-nixos";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs stateVersion;};
    sharedModules = [
      {
        home.username = "eltern";
        home.homeDirectory = "/home/eltern";
        home.stateVersion = stateVersion;
        programs.home-manager.enable = true;
      }
    ];
    users.eltern = {...}: {};
  };
}
