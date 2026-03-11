{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

  networking.firewall = {
    checkReversePath = "loose";
    allowedUDPPorts = [51820];
  };

  sops.secrets = {
    "wireguard/private-key" = {};
    "wireguard/preshared-key" = {};
  };

  sops.templates."FritzBox.nmconnection" = {
    path = "/etc/NetworkManager/system-connections/FritzBox.nmconnection";
    mode = "0600";
    owner = "root";
    group = "root";
    content = ''
      [connection]
      id=FritzBox
      uuid=63d76b1b-99f5-442c-80ce-8f4692cdc67b
      type=wireguard
      interface-name=wg-fritz
      autoconnect=false

      [wireguard]
      private-key=${config.sops.placeholder."wireguard/private-key"}
      private-key-flags=0
      listen-port=51820
      mtu=1280

      [wireguard-peer.7FTjjjFqetEwCYZiwDFXDdYQYeEf9vThJyRVaxDmsXw=]
      public-key=7FTjjjFqetEwCYZiwDFXDdYQYeEf9vThJyRVaxDmsXw=
      preshared-key=${config.sops.placeholder."wireguard/preshared-key"}
      preshared-key-flags=0
      allowed-ips=10.0.0.0/24;0.0.0.0/0;fdb0:b8e0:ea8f::/64;::/0;
      endpoint=ekssr2zstzfswdnx.myfritz.net:52935
      persistent-keepalive=25

      [ipv4]
      address1=10.0.0.201/24
      dns=10.0.0.1;
      dns-search=fritz.box;
      method=manual

      [ipv6]
      address1=fdb0:b8e0:ea8f::201/64
      dns=fdb0:b8e0:ea8f::464e:6dff:feda:e75d;
      method=manual
    '';
  };

  system.activationScripts.reload-nm-connections = {
    text = ''
      ${pkgs.networkmanager}/bin/nmcli connection reload || true
    '';
    deps = ["setupSecrets"];
  };
}
