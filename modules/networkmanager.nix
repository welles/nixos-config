# NetworkManager Configuration
#
# Enables NetworkManager for network management. Add the relevant user
# to the "networkmanager" group in the host's user definition for
# unprivileged network control.
{...}: {
  networking.networkmanager.enable = true;
}
