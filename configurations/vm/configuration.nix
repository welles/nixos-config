{
  config,
  pkgs,
  ...
}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  environment.systemPackages = with pkgs; [
    git
    htop
    vim
    wget
    seafile-client
  ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;

  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

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
      defaultWindowManager = "${pkgs.xfce.xfce4-session}/bin/startxfce4";
      openFirewall = true;
      audio.enable = true;
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "de";
        variant = "";
      };
      desktopManager.xfce.enable = true;
      displayManager.lightdm = {
        enable = true;
      };
      serverFlagsSection = ''
        Section "ServerFlags"
          Option "StandbyTime" "0"
          Option "SuspendTime" "0"
          Option "OffTime" "0"
          Option "BlankTime" "0"
        EndSection
      '';
    };

    displayManager.autoLogin = {
      enable = true;
      user = "vm";
    };
  };

  environment.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake github:welles/nixos-config#${config.networking.hostName} --refresh";
    nixos-boot = "sudo nixos-rebuild boot --flake github:welles/nixos-config#${config.networking.hostName} --refresh";
  };

  time.timeZone = "Europe/Berlin";

  users.users.vm = {
    description = "VM User";
    extraGroups = ["networkmanager" "wheel"];
    initialPassword = "password";
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
