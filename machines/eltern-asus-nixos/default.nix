# Parents' ASUS Laptop Machine Configuration
#
# Hardware-specific settings for the ASUS laptop. Enables libinput
# for touchpad support. Disk layout uses two separate SSDs: a 120GB
# SanDisk for the root filesystem and a 24GB SanDisk for boot + swap.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
  ];

  services.libinput.enable = true;
}
