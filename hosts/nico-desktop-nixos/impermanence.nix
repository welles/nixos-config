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
      directories = [
        ".ssh"
        ".npm-global"
        "Desktop"
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Videos"
      ];
    };
  };
}
