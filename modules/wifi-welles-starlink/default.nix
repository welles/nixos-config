{config, ...}: {
  sops.secrets."wifi-welles-starlink-password" = {
    sopsFile = ./secrets.yaml;
  };

  sops.templates."wifi-welles-starlink.env" = {
    content = ''
      WIFI_WELLES_STARLINK_PSK=${config.sops.placeholder."wifi-welles-starlink-password"}
    '';
  };

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [config.sops.templates."wifi-welles-starlink.env".path];
    profiles."Welles Starlink" = {
      connection = {
        id = "Welles Starlink";
        uuid = "86e3b8f2-05d3-4022-80fe-c555d9df494e";
        type = "wifi";
        autoconnect = true;
      };
      wifi = {
        mode = "infrastructure";
        ssid = "Welles Starlink";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-psk";
        psk = "$WIFI_WELLES_STARLINK_PSK";
      };
      ipv4.method = "auto";
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
    };
  };
}
