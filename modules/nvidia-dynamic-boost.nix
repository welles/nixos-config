# NVIDIA Dynamic Boost
#
# For laptops whose NVIDIA GPU supports Dynamic Boost: runs `nvidia-powerd`,
# which shifts power between CPU and GPU, so the GPU may draw more than its
# base power limit under load (e.g. 50 W → up to 115 W). The firmware still
# decides the budget; it usually only grants the boost on AC power in the
# laptop's performance mode.
#
# Whether the GPU supports it: `cat /proc/driver/nvidia/gpus/*/power` shows
# "Notebook Dynamic Boost: Supported". Desktop GPUs do not.
_: {
  imports = [./nvidia-base.nix];

  hardware.nvidia.dynamicBoost.enable = true;
}
