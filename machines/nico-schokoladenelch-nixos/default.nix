# Schokoladenelch Server Machine Configuration
#
# Hardware-specific settings for the home server. Imports the disko
# disk layout which defines the 2-SSD ZFS mirror (bucket) and the
# 4-HDD RAIDZ1 array (tank).
{...}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
  ];
}
