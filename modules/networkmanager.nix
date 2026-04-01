# Shared NetworkManager Configuration
#
# Enables NetworkManager for network management and adds the system
# user to the networkmanager group for unprivileged network control.
{user, ...}: {
  networking.networkmanager.enable = true;
  users.users.${user}.extraGroups = ["networkmanager"];
}
