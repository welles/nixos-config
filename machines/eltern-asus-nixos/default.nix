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
