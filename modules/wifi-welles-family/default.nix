{config, ...}: {
  sops.secrets."wifi-welles-family-password" = {
    sopsFile = ./secrets.yaml;
  };

  sops.templates."wifi-welles-family.env" = {
    content = ''
      WIFI_WELLES_FAMILY_PSK=${config.sops.placeholder."wifi-welles-family-password"}
    '';
  };

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [config.sops.templates."wifi-welles-family.env".path];
    profiles."Welles Family" = {
      connection = {
        id = "Welles Family";
        uuid = "02376dc8-e153-4e67-8eb3-8c3bf85489ae";
        type = "wifi";
        autoconnect = true;
      };
      wifi = {
        mode = "infrastructure";
        ssid = "Welles Family";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-psk";
        psk = "$WIFI_WELLES_FAMILY_PSK";
      };
      ipv4.method = "auto";
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
    };
  };
}
