# Uses NVIDIA's proprietary (closed) kernel module instead of the open one.
# Only for GPUs the closed module still supports (Maxwell up to Ada), e.g.
# when the open module misdrives a display.
_: {
  imports = [./nvidia-base.nix];

  hardware.nvidia.open = false;
}
