{
  lib,
  pkgs,
  user,
  persistRoot ? null,
  ...
}: {
  environment.systemPackages = [
    (pkgs.bottles.override {
      removeWarningPopup = true;
    })
  ];

  # Wine takes the SMBIOS system UUID (Win32_ComputerSystemProduct) only from
  # /var/lib/dbus/machine-id, which NixOS does not create. Without it every
  # bottle reports the placeholder deaddead-dead-dead-dead-deaddeaddead, and
  # StreamFab's key server then hands out keys that do not decrypt (error 605).
  # The Bottles FHS sandbox sees the host's /var, so the link works in there.
  systemd.tmpfiles.rules = ["L+ /var/lib/dbus/machine-id - - - - /etc/machine-id"];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/bottles"];
  };
}
