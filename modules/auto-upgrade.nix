# Automatic Upgrades
#
# Rebuilds the host daily from the flake on GitHub, for hosts nobody updates
# by hand. Doesn't reboot: the new configuration is activated right away,
# kernel and driver updates take effect on the next boot.
{hostname, ...}: {
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    dates = "daily";
    flake = "github:welles/nixos-config#${hostname}";
  };
}
