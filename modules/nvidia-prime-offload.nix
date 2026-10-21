# NVIDIA PRIME Offload
#
# For laptops with Intel and NVIDIA graphics: the Intel GPU drives the
# display, the NVIDIA GPU only renders applications started with
# `nvidia-offload <command>`.
#
# The host sets the bus IDs of both GPUs (from `lspci`, e.g. 00:02.0 becomes
# "PCI:0:2:0"):
#
#   hardware.nvidia.prime = {
#     intelBusId = "PCI:0:2:0";
#     nvidiaBusId = "PCI:2:0:0";
#   };
_: {
  imports = [./nvidia-base.nix];

  hardware.nvidia.prime.offload = {
    enable = true;
    enableOffloadCmd = true;
  };
}
