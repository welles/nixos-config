# GPU acceleration on WSL2 through the Windows host's graphics driver
#
# WSL2 exposes the GPU as /dev/dxg, not as a DRM device (the /dev/dri render
# node WSL provides belongs to vgem, which cannot render). Mesa reaches the
# GPU through its d3d12 driver, which needs libd3d12/libdxcore from
# /usr/lib/wsl/lib; NixOS-WSL links them into hardware.graphics with this
# option. Without it, OpenGL falls back to llvmpipe.
#
# Check with `glxinfo -B` (mesa-demos): the renderer should read
# "D3D12 (<GPU name>)" instead of "llvmpipe".
_: {
  imports = [./wsl.nix];

  wsl.useWindowsDriver = true;
}
