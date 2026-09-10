# Impermanence Configuration
#
# The ZFS root dataset is rolled back to a blank snapshot on every boot.
# This module bind-mounts directories and files from /persist to their
# expected locations, preserving state across reboots.
{
  persistRoot,
  ...
}: {
  fileSystems.${persistRoot}.neededForBoot = true;

  environment.persistence.${persistRoot} = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
    ];
    files = [
      "/etc/machine-id"
      "/etc/adjtime"
    ];
  };
}
