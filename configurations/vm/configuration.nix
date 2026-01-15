{
  config,
  pkgs,
  ...
}: {
  boot.loader = {
    efi.canTouchEfiVariables = false;
    grub = {
      enable = true;
      efiSupport = false;
      device = "nodev";
    };
  };

  environment.systemPackages = with pkgs; [
    git
    htop
    vim
    wget
  ];

  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  networking.networkmanager.enable = true;

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
      xkb.layout = "de";
      desktopManager.xfce.enable = true;
      displayManager.lightdm.enable = true;
    };
  };

  time.timeZone = "Europe/Berlin";

  users.users.vm = {
    description = "VM User";
    extraGroups = ["networkmanager" "wheel"];
    initialPassword = "password";
    isNormalUser = true;
  };
}
