{...}: {
  imports = [../../modules/nvidia-base.nix];

  boot.initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
}
