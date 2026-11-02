# Intel iGPU on i915 instead of xe
#
# Since kernel 6.18.54 the xe driver claims Raptor Lake iGPUs (a780) but
# refuses to probe them without force_probe, which keeps i915 from binding
# and leaves no /dev/dri/renderD128 (e.g. for Jellyfin transcoding).
_: {
  boot = {
    blacklistedKernelModules = ["xe"];
    kernelModules = ["i915"];
  };
}
