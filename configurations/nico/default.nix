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

  sops.age.keyFile = "/var/lib/sops-nix/key.txt";

  systemd.services.NetworkManager-wait-online.enable = false;

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
