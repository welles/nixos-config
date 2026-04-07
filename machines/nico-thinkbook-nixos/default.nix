# Lenovo ThinkBook Machine Configuration
#
# Hardware-specific settings for the ThinkBook laptop. Imports the
# NVIDIA hybrid GPU module for Intel + RTX offload rendering.
# This is the primary gaming machine — all gaming peripherals, services,
# and packages live here.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia-gpu.nix
    ../../modules/eden.nix
    ../../modules/xone-dongle.nix
  ];

  hardware.bluetooth.enable = true;

  # Logitech steering wheel support
  hardware.new-lg4ff.enable = true;
  services.udev.packages = with pkgs; [oversteer];
  hardware.usb-modeswitch.enable = true;
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c26d", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01"
  '';

  # Sunshine remote game streaming
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };

  # Steam with open firewall for remote play and dedicated servers
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Gaming and peripheral packages
  environment.systemPackages = with pkgs; [
    openttd-jgrpp
    oversteer
    prismlauncher
    streamcontroller
    (bottles.override {removeWarningPopup = true;})
  ];

  # services.fprintd = {
  #   enable = true;
  #   tod = {
  #     enable = true;
  #     driver = pkgs.libfprint-2-tod1-goodix-550a;
  #   };
  # };
}
