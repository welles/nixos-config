# Virtual Machine Configuration
#
# Lightweight VM setup with Xfce desktop, XRDP for remote access,
# and auto-login. Sleep/suspend/hibernate are disabled since VMs
# are managed by the hypervisor. Includes SPICE and QEMU guest
# agents for clipboard sharing and display resizing.
{
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../../modules/pipewire.nix
  ];

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
    nfs-utils
  ];

  programs.firefox.enable = true;

  security.polkit.enable = true;

  # Disable all power-saving targets (managed by hypervisor)
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  services = {
    openssh.enable = true;

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
      user = user;
    };
  };

  environment.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake github:welles/nixos-config#${config.networking.hostName} --refresh";
    nixos-boot = "sudo nixos-rebuild boot --flake github:welles/nixos-config#${config.networking.hostName} --refresh";
  };

  users.users.${user} = {
    description = "VM User";
    extraGroups = ["networkmanager" "wheel"];
    initialPassword = "password";
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
