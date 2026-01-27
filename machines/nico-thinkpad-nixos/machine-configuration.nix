{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    libinput
    iio-sensor-proxy
    maliit-keyboard
    mobile-broadband-provider-info
  ];

  services.fprintd.enable = true;

  networking.modemmanager.enable = true;

  networking.networkmanager.ensureProfiles.profiles = {
    "Telekom LTE" = {
      connection = {
        id = "Telekom LTE";
        uuid = "1ff5123a-440e-4e1b-80d2-ee47cd559c84";
        type = "gsm";
      };
      gsm = {
        apn = "internet.telekom";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "default";
        method = "auto";
      };
    };
  };
}
