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
      # TLS certificate of xrdp (desktop.nix), so RDP clients keep trusting it
      "/var/lib/xrdp"
      "/var/log"
    ];
    files = [
      "/etc/adjtime"
      "/etc/machine-id"
    ];
    users.${user} = {
      directories = [
        ".ssh"
        # Logins of VS Code, Chrome, gh etc. stored in the GNOME keyring
        ".local/share/keyrings"
        "workspace"
      ];
    };
  };
}
