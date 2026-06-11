{config, ...}: {
  sops.secrets."wifi-welles-intern-password" = {
    sopsFile = ./secrets.yaml;
  };

  sops.templates."wifi-welles-intern.env" = {
    content = ''
      WIFI_WELLES_INTERN_PSK=${config.sops.placeholder."wifi-welles-intern-password"}
    '';
  };

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [config.sops.templates."wifi-welles-intern.env".path];
    profiles."Welles Intern" = {
      connection = {
        id = "Welles Intern";
        uuid = "93f4e88d-6c1d-4f1e-9a1d-2b3c4d5e6f7a";
        type = "wifi";
        autoconnect = true;
      };
      wifi = {
        mode = "infrastructure";
        ssid = "Welles Intern";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-psk";
        psk = "$WIFI_WELLES_INTERN_PSK";
      };
      ipv4.method = "auto";
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
    };
  };
}
