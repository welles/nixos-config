{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia-gpu.nix
  ];

  # services.fprintd = {
  #   enable = true;
  #   tod = {
  #     enable = true;
  #     driver = pkgs.libfprint-2-tod1-goodix-550a;
  #   };
  # };
}
