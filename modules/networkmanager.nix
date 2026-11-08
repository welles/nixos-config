# Shared NetworkManager Configuration
#
# Enables NetworkManager for network management and adds the system
# user to the networkmanager group for unprivileged network control.
#
# Wi-Fi networks with their passwords, and other connections no module
# declares (unlike lte-telekom.nix), are set up in NetworkManager itself.
# Their profiles in /etc/NetworkManager/system-connections are persisted, and
# NetworkManager's state in /var/lib/NetworkManager (which networks are on,
# last used) too.
{
  lib,
  user,
  persistRoot,
  ...
}: {
  networking.networkmanager.enable = true;
  users.users.${user}.extraGroups = ["networkmanager"];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot} = {
      directories = [
        "/var/lib/NetworkManager"
        {
          directory = "/etc/NetworkManager/system-connections";
          mode = "0700";
        }
      ];
      files = ["/etc/resolv.conf"];
    };
  };
}
