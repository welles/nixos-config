# Steam on the NVIDIA GPU via PRIME offload
#
# For hosts with `nvidia-prime-offload.nix`: Steam itself and every game it
# starts render on the NVIDIA GPU, without `nvidia-offload` or launch
# options per game. The variables are the ones `nvidia-offload` sets; they
# are baked into Steam's FHS environment, so the desktop entry and `steam`
# on the command line both use them.
{pkgs, ...}: {
  imports = [
    ./nvidia-prime-offload.nix
    ./packages/steam.nix
  ];

  programs.steam.package = pkgs.steam.override {
    extraEnv = {
      __NV_PRIME_RENDER_OFFLOAD = "1";
      __NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __VK_LAYER_NV_optimus = "NVIDIA_only";
    };
  };
}
