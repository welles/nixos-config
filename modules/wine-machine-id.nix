# System UUID for Wine
#
# Wine takes the SMBIOS system UUID (Win32_ComputerSystemProduct) only from
# /var/lib/dbus/machine-id, which NixOS does not create. Without it every
# prefix reports the placeholder deaddead-dead-dead-dead-deaddeaddead. The
# DVDFab programs (StreamFab, MusicFab) use it as hardware ID: StreamFab's
# key server then hands out keys that do not decrypt (error 605), and their
# activation is tied to it. Linking /etc/machine-id keeps the ID stable
# across prefixes and reinstalls (impermanence-base.nix persists it). The
# Bottles FHS sandbox sees the host's /var, so the link works in there too.
_: {
  systemd.tmpfiles.rules = ["L+ /var/lib/dbus/machine-id - - - - /etc/machine-id"];
}
