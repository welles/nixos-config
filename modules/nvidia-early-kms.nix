# Loads the NVIDIA driver in the initrd, so the GPU takes over the display
# early in the boot instead of after the switch to the real root.
_: {
  imports = [./nvidia-base.nix];

  boot.initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
}
