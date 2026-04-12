# Shared Networking Configuration for Nico
#
# Declaratively manages common WiFi connections across all machines.
# The WiFi password is stored securely in sops and injected into
# the NetworkManager connection profile using a sops template.
{config, ...}: {
  # Define the sops secret for the WiFi password.
  # This secret must be added to configurations/nico/secrets.yaml.
  sops.secrets."wifi-welles-intern-password" = {
    sopsFile = ./secrets.yaml;
  };

  # Generate the NetworkManager connection profile.
  # The file is placed directly in system-connections for automatic pickup.
  sops.templates."Welles Intern.nmconnection" = {
    owner = "root";
    group = "root";
    mode = "0600";
    content = ''
      [connection]
      id=Welles Intern
      uuid=93f4e88d-6c1d-4f1e-9a1d-2b3c4d5e6f7a
      type=wifi
      autoconnect=true

      [wifi]
      mode=infrastructure
      ssid=Welles Intern

      [wifi-security]
      auth-alg=open
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."wifi-welles-intern-password"}

      [ipv4]
      method=auto

      [ipv6]
      addr-gen-mode=stable-privacy
      method=auto

      [proxy]
    '';
    path = "/var/lib/NetworkManager/system-connections/Welles Intern.nmconnection";
  };
}
