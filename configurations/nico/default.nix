# Nico's Desktop Configuration
#
# Primary desktop configuration used across multiple machines (ThinkPad,
# ThinkBook). Pulls together all the thematic modules and sets up the
# user account, networking, and locale.
{
  pkgs,
  inputs,
  user,
  ...
}: {
  imports = [
    ../../modules/docker.nix
    ../../modules/networkmanager.nix
    ../../modules/profile-icon
    ../../modules/wifi-welles-intern
    ./boot.nix
    ./desktop.nix
    ./audio.nix
    ./services.nix
    ./packages.nix
    ./rclone.nix
  ];

  # Base sops-nix configuration: use a shared age key for all nico machines.
  # Machine-specific secrets use defaultSopsFile in the machine config;
  # nico-level secrets (e.g. rclone) specify their sopsFile explicitly.
  sops = {
    age.keyFile = "/var/lib/sops-nix/key.txt";
    defaultSopsFormat = "yaml";
    validateSopsFiles = true;
  };

  # Disable waiting for NetworkManager at boot to speed up startup
  systemd.services.NetworkManager-wait-online.enable = false;

  # German locale settings for all LC_* categories
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

  # User account
  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "Nico";
    extraGroups = ["wheel" "libvirtd"];
    shell = pkgs.zsh;
  };

  # Enable plasma-manager home-manager module for KDE Plasma configuration
  home-manager.sharedModules = [inputs.plasma-manager-unstable.homeModules.plasma-manager];
}
