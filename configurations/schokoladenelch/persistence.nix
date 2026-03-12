# Impermanence Configuration
#
# Since the ZFS root dataset is rolled back to a blank snapshot on every
# boot, this module defines which directories and files should persist
# across reboots by bind-mounting them from the persistent ZFS dataset.
# This includes system state (logs, machine-id, SSH host keys), Docker
# data, and the user's shell history.
{user, ...}: {
  fileSystems."/mnt/bucket/persist".neededForBoot = true;
  fileSystems."/mnt/bucket/apps".neededForBoot = true;

  environment.persistence."/mnt/bucket/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/caddy"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
      "/var/lib/docker"
      "/var/lib/sops-nix"
    ];
    files = [
      "/etc/machine-id"
      "/etc/adjtime"
      "/etc/resolv.conf"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
    users.${user} = {
      directories = [
        ".local/share/zsh"
      ];
      files = [
      ];
    };
  };
}
