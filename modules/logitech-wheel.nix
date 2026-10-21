{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.boot.kernelPackages) kernel kernelModuleMakeFlags;

  # nixpkgs' new-lg4ff splices kernelModuleMakeFlags unquoted into bash.
  # Since the deterministic module signing (NixOS/nixpkgs#571181) these
  # contain `cmd_sign=…/kmodigest$(space)$@`, and bash runs `$(space)` as a
  # command, failing the build with exit code 127. Quote the flags so make
  # gets them verbatim. Replaces `hardware.new-lg4ff.enable`, which only adds
  # the package and loads the module; drop this once nixpkgs is fixed.
  new-lg4ff = config.boot.kernelPackages.new-lg4ff.overrideAttrs {
    preConfigure = ''
      makeFlagsArray+=(
        KVERSION="${kernel.modDirVersion}"
        KDIR="${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
        KCFLAGS="-DCONFIG_LOGIWHEELS_FF -DCONFIG_LEDS_CLASS"
        ${lib.escapeShellArgs kernelModuleMakeFlags}
      )
    '';
  };
in {
  boot = {
    extraModulePackages = [new-lg4ff];
    kernelModules = ["hid-logitech-new"];
  };

  hardware.usb-modeswitch.enable = true;

  services.udev = {
    packages = [pkgs.oversteer];
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c26d", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01"
    '';
  };

  environment.systemPackages = [pkgs.oversteer];
}
