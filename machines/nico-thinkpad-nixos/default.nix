# Lenovo ThinkPad Machine Configuration
#
# Hardware-specific settings for the ThinkPad convertible laptop.
# Enables IIO sensors for automatic screen rotation, a virtual
# on-screen keyboard (Maliit), SSH for remote access, and sops-nix
# for secret management (used by the WireGuard and mobile network
# modules).
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./fritzbox-wireguard.nix
    ./mobile-network.nix
  ];

  hardware.bluetooth.enable = true;
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    libinput
    iio-sensor-proxy
    maliit-keyboard
  ];

  # services.fprintd.enable = true;

  networking.firewall.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
    openFirewall = true;
  };

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";
    validateSopsFiles = true;
  };
}
