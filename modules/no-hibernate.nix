# Hibernation off: systemd refuses every sleep mode that writes to disk, so
# logind reports it as unavailable and desktops (KDE's logout screen and
# launcher) hide their hibernate buttons. For hosts that cannot hibernate,
# e.g. ZFS hosts without boot.zfs.unsafeAllowHibernation.
_: {
  systemd.sleep.settings.Sleep = {
    AllowHibernation = false;
    AllowHybridSleep = false;
    AllowSuspendThenHibernate = false;
  };
}
