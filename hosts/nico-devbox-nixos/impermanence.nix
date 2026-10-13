# Impermanence Configuration
#
# The ZFS root dataset (devbox/root) is rolled back to its blank snapshot
# on every boot; only what is listed here (and in the imported modules)
# survives on /persist.
{
  persistRoot,
  user,
  ...
}: {
  fileSystems.${persistRoot}.neededForBoot = true;

  environment.persistence.${persistRoot} = {
    hideMounts = true;
    directories = [
      "/var/lib/nixos"
      "/var/lib/sops-nix"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
      "/var/log"
    ];
    files = [
      "/etc/adjtime"
      "/etc/machine-id"
    ];
    users.${user} = {
      directories = [".ssh"];
    };
  };
}
