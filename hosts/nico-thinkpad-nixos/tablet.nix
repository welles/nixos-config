{pkgs, ...}: {
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    libinput
    iio-sensor-proxy
    maliit-keyboard
  ];
}
