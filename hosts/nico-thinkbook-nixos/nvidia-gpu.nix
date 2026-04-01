# NVIDIA Hybrid GPU Configuration
#
# Sets up the NVIDIA RTX GPU in PRIME offload mode alongside the
# integrated Intel GPU. The Intel iGPU handles the display by default;
# the NVIDIA dGPU is available on demand via `nvidia-offload`. Uses
# the open-source kernel module with 32-bit graphics support for
# gaming compatibility.
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

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";
    };
  };
}
