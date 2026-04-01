# Impermanence Configuration
#
# The ZFS root dataset is rolled back to a blank snapshot on every boot.
# This module bind-mounts directories and files from /persist to their
# expected locations, preserving state across reboots.
{...}: {
  fileSystems."/persist".neededForBoot = true;

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
      "/var/lib/docker"
    ];
    files = [
      "/etc/machine-id"
      "/etc/adjtime"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
    users.nixos = {
      directories = [
        ".local/share/zsh"
      ];
    };
  };
}
