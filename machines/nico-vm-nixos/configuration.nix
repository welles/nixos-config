{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "INSTALL_DEVICE_PLACEHOLDER";
    };
  };

  environment.systemPackages = with pkgs; [
    git
    htop
    vim
    wget
  ];

  i18n.defaultLocale = "de_DE.UTF-8";

  networking = {
    hostName = "nico-vm-nixos";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  security.rtkit.enable = true;

  services = {
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    qemuGuest.enable = true;
    spice-vdagentd.enable = true;

    xrdp = {
      enable = true;
      defaultWindowManager = "startxfce4";
      openFirewall = true;
    };

    xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
      displayManager.lightdm.enable = true;
    };
  };

  system.stateVersion = "25.11";

  time.timeZone = "Europe/Berlin";

  users.users.nico = {
    description = "Nico";
    extraGroups = ["networkmanager" "wheel"];
    initialPassword = "password";
    isNormalUser = true;
  };
}
