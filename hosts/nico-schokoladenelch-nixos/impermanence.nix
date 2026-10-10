{persistRoot, ...}: {
  fileSystems = {
    ${persistRoot}.neededForBoot = true;
    "/mnt/bucket/apps".neededForBoot = true;
  };

  environment.persistence.${persistRoot} = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
      "/var/lib/sops-nix"
    ];
    files = [
      "/etc/machine-id"
      "/etc/adjtime"
    ];
  };
}
