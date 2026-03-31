# nw-wsl-nixos Machine Configuration
#
# Machine config for NixOS running inside Windows WSL2.
# Uses NixOS-WSL for proper WSL2 integration and disables
# NetworkManager since networking is handled by the WSL2 host.
{
  inputs,
  lib,
  user,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = user;

  # WSL2 provides networking via a virtual adapter managed by Windows;
  # NetworkManager (enabled globally in global.nix) is not applicable here
  networking.networkmanager.enable = lib.mkForce false;
}
