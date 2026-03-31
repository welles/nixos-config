# nw-wsl-nixos Machine Configuration
#
# Minimal machine config for NixOS running inside Windows WSL2.
# Disables the bootloader and NetworkManager since both are handled
# by the WSL2 host environment.
{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # WSL2 manages the kernel and init — no bootloader needed
  boot.isContainer = true;

  # WSL2 provides networking via a virtual adapter managed by Windows;
  # NetworkManager (enabled globally in global.nix) is not applicable here
  networking.networkmanager.enable = lib.mkForce false;
}
