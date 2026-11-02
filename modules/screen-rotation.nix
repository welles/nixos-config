# Rotates the screen with the device, from the accelerometer read through
# iio-sensor-proxy (for convertibles and tablets).
{pkgs, ...}: {
  hardware.sensor.iio.enable = true;

  environment.systemPackages = [pkgs.iio-sensor-proxy];
}
