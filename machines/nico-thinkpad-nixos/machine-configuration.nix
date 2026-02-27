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
    wireguard-tools
  ];

  # services.fprintd.enable = true;

  environment.etc."ModemManager/fcc-unlock.d/2c7c:030a" = {
    mode = "0755";
    text = ''
      #!/bin/sh
      export PATH=${pkgs.libmbim}/bin:$PATH
      exec ${pkgs.modemmanager}/share/ModemManager/fcc-unlock.available.d/2c7c:030a "$@"
    '';
  };

  networking.modemmanager.enable = true;

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";
    validateSopsFiles = true;
    secrets = {
      "wireguard/private-key" = {};
      "wireguard/preshared-key" = {};
    };
    templates."FritzBox.nmconnection" = {
      path = "/etc/NetworkManager/system-connections/FritzBox.nmconnection";
      mode = "0600";
      owner = "root";
      group = "root";
      content = ''
        [connection]
        id=FritzBox
        uuid=63d76b1b-99f5-442c-80ce-8f4692cdc67b
        type=wireguard
        autoconnect=false

        [wireguard]
        private-key=${config.sops.placeholder."wireguard/private-key"}

        [wireguard-peer.7FTjjjFqetEwCYZiwDFXDdYQYeEf9vThJyRVaxDmsXw=]
        public-key=7FTjjjFqetEwCYZiwDFXDdYQYeEf9vThJyRVaxDmsXw=
        preshared-key=${config.sops.placeholder."wireguard/preshared-key"}
        allowed-ips=10.0.0.0/24;0.0.0.0/0;fdb0:b8e0:ea8f::/64;::/0;
        endpoint=ekssr2zstzfswdnx.myfritz.net:52935
        persistent-keepalive=25

        [ipv4]
        address1=10.0.0.203/24
        dns=10.0.0.1;
        dns-search=fritz.box;
        method=manual

        [ipv6]
        address1=fdb0:b8e0:ea8f::203/64
        dns=fdb0:b8e0:ea8f::464e:6dff:feda:e75d;
        method=manual
      '';
    };
  };

  system.activationScripts.reload-nm-connections = {
    text = ''
      ${pkgs.networkmanager}/bin/nmcli connection reload || true
    '';
    deps = ["setupSecrets"];
  };

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
