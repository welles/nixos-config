# Mobile data connection to the Telekom network (IPv4 and IPv6).
_: {
  imports = [./modemmanager.nix];

  networking.networkmanager.ensureProfiles.profiles."Telekom LTE" = {
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
}
