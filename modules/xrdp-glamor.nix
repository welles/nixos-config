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
# VFs driven by xe, plus the kernel drivers in `xrdpGlamorExtraDrivers`.
# That is where VMs with virgl (libvirt-vm.nix: virglRenderNode) add
# `virtio_gpu`; it is not on the list by default, as a virtio-gpu without
# virgl would only move rendering onto llvmpipe inside the X server.
#
# The log of the session's X server (~/.xorgxrdp.<display>.log) says whether
# glamor is in use ("glamor init ok" vs. "unsupported render node").
{
  config,
  lib,
  pkgs,
  xrdpGlamorExtraDrivers,
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
  });

  defaultDrivers = "amdgpu i915 msm radeon";
  drivers = lib.concatStringsSep " " ([defaultDrivers "xe"] ++ xrdpGlamorExtraDrivers);
in {
  imports = [./xrdp.nix];

  # The desktop session picks its GPU variant (cinnamon.nix)
  _module.args.xrdpGlamor = true;

  # glamor's EGL needs the Mesa drivers from /run/opengl-driver
  hardware.graphics.enable = true;

  # The [Xorg] section of sesman.ini references xorgxrdp's modules and
  # xorg.conf by store path; swap the modules for the glamor build and the
  # config for a copy with the extended DRMAllowList next to sesman.ini.
  services.xrdp.extraConfDirCommands = ''
    cp ${xorgxrdpGlamor}/etc/X11/xrdp/xorg.conf $out/xorgxrdp.conf
    chmod +w $out/xorgxrdp.conf
    substituteInPlace $out/xorgxrdp.conf \
      --replace-fail '"DRMAllowList" "${defaultDrivers}"' '"DRMAllowList" "${drivers}"'

    substituteInPlace $out/sesman.ini \
      --replace-fail ${xorgxrdp}/etc/X11/xrdp/xorg.conf $out/xorgxrdp.conf \
      --replace-fail ${xorgxrdp} ${xorgxrdpGlamor}
  '';
}
