{pkgs, ...}: {
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
  };

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "Europe/Berlin";
  };

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
