# Shared Networking Configuration for Nico
#
# Declaratively manages common WiFi connections across all machines.
# The WiFi password is stored securely in sops and injected into the
# NetworkManager connection profile via an environment file, using the
# same ensureProfiles pattern as machines/nico-thinkpad-nixos/mobile-network.nix.
{config, ...}: {
  sops.secrets."wifi-welles-intern-password" = {
    sopsFile = ./secrets.yaml;
  };

  # Render a systemd-compatible env file containing the WiFi password.
  # sops.templates creates a symlink, which systemd EnvironmentFile follows —
  # unlike NM's connections directory, which ignores symlinks.
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
