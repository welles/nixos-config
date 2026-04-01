# Mobile Broadband (LTE) Configuration
#
# Enables ModemManager and provisions a Telekom LTE connection profile.
# Includes an FCC unlock script for the Quectel RM520N-GL modem
# (USB ID 2c7c:030a) which is required before the modem can connect
# to the cellular network.
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mobile-broadband-provider-info
  ];

  environment.etc."ModemManager/fcc-unlock.d/2c7c:030a" = {
    mode = "0755";
    text = ''
      #!/bin/sh
      export PATH=${pkgs.libmbim}/bin:$PATH
      exec ${pkgs.modemmanager}/share/ModemManager/fcc-unlock.available.d/2c7c:030a "$@"
    '';
  };

  networking.modemmanager.enable = true;

  networking.networkmanager.ensureProfiles.profiles = {
    "Telekom LTE" = {
      connection = {
        id = "Telekom LTE";
        uuid = "1ff5123a-440e-4e1b-80d2-ee47cd559c84";
        type = "gsm";
      };
      gsm = {
        apn = "internet.v6.telekom";
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
