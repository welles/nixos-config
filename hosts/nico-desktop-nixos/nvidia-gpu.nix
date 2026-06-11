# NVIDIA GPU Configuration
#
# Discrete RTX 3080 as the sole GPU — no PRIME offload needed.
# Uses the open-source kernel module with 32-bit graphics support.
{config, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = false;
  };
}
