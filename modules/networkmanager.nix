# Shared NetworkManager Configuration
#
# Enables NetworkManager for network management and adds the system
# user to the networkmanager group for unprivileged network control.
#
# Connections (Wi-Fi networks with their passwords, mobile data, …) are set
# up in NetworkManager itself, not declared here. Their profiles in
# /etc/NetworkManager/system-connections are persisted, and NetworkManager's
# state in /var/lib/NetworkManager (which networks are on, last used) too.
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
