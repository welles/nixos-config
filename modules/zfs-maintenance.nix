# ZFS maintenance: periodic scrubs, TRIM for SSDs and automatic snapshots
_: {
  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
    autoSnapshot.enable = true;
  };
}
