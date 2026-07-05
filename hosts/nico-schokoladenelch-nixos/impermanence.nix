{
  persistRoot,
  user,
  ...
}: {
  fileSystems = {
    ${persistRoot}.neededForBoot = true;
    "/mnt/bucket/apps".neededForBoot = true;
    "/mnt/bucket/libvirt".neededForBoot = true;
    "/mnt/tank/libvirt".neededForBoot = true;
  };

  environment.persistence.${persistRoot} = {
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
      files = [];
    };
  };
}
