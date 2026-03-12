# Hardware Support
#
# Enables Bluetooth, Logitech steering wheel force feedback (lg4ff),
# and USB mode switching for the Logitech G923 wheel. The udev rule
# triggers mode switching when the wheel is plugged in so it operates
# in its full-feature HID mode.
{pkgs, ...}: {
  imports = [
    ../../modules/eden
    ../../modules/xone-dongle
  ];

  hardware.bluetooth.enable = true;

  # Logitech steering wheel support
  hardware.new-lg4ff.enable = true;
  services.udev.packages = with pkgs; [oversteer];
  hardware.usb-modeswitch.enable = true;
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c26d", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01"
  '';
}
