# GPU-accelerated X server for RDP sessions (xrdp.nix)
#
# nixpkgs builds xorgxrdp without glamor, so the X server of an RDP session
# offers no DRI3 and every X11 program (GLX/EGL, Chromium, Wine, the desktop)
# renders on the CPU through llvmpipe, whatever GPU the machine has. This
# module builds xorgxrdp with `--enable-glamor` and points sesman's Xorg
# session at it.
#
# glamor only switches on at runtime if the render node in xorg.conf
# (`/dev/dri/renderD128`) opens and its kernel driver is on `DRMAllowList`;
# otherwise the X server falls back to software rendering as before, so the
# module is safe on machines without a usable GPU. xorgxrdp's default list
# (amdgpu i915 msm radeon) gets `xe` added, for Intel iGPUs and their SR-IOV
# VFs driven by xe. virtio_gpu is deliberately left out: without virgl it
# would only move rendering onto llvmpipe inside the X server.
#
# The log of the session's X server (~/.xorgxrdp.<display>.log) says whether
# glamor is in use ("glamor init ok" vs. "unsupported render node").
{
  config,
  pkgs,
  ...
}: let
  inherit (config.services.xrdp.package) xorgxrdp;

  xorgxrdpGlamor = xorgxrdp.overrideAttrs (old: {
    pname = "xorgxrdp-glamor";

    configureFlags = (old.configureFlags or []) ++ ["--enable-glamor"];

    buildInputs =
      old.buildInputs
      ++ (with pkgs; [
        libepoxy
        libgbm
        libGL
      ]);

    postInstall =
      (old.postInstall or "")
      + ''
        substituteInPlace $out/etc/X11/xrdp/xorg.conf \
          --replace-fail '"DRMAllowList" "amdgpu i915 msm radeon"' \
                         '"DRMAllowList" "amdgpu i915 msm radeon xe"'
      '';
  });
in {
  imports = [./xrdp.nix];

  # glamor's EGL needs the Mesa drivers from /run/opengl-driver
  hardware.graphics.enable = true;

  # The [Xorg] section of sesman.ini references xorgxrdp's modules and
  # xorg.conf by store path; swap them for the glamor build.
  services.xrdp.extraConfDirCommands = ''
    substituteInPlace $out/sesman.ini \
      --replace-fail ${xorgxrdp} ${xorgxrdpGlamor}
  '';
}
