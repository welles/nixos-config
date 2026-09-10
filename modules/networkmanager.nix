# Shared NetworkManager Configuration
#
# Enables NetworkManager for network management and adds the system
# user to the networkmanager group for unprivileged network control.
{
  lib,
  user,
  persistRoot ? null,
  ...
}: {
  networking.networkmanager.enable = true;
  users.users.${user}.extraGroups = ["networkmanager"];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot} = {
      directories = ["/var/lib/NetworkManager"];
      files = ["/etc/resolv.conf"];
    };
  };
}
