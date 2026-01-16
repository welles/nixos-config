{pkgs, ...}: {
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "nodev";
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
