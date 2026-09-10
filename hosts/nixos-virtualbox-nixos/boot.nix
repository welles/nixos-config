# ZFS Boot Configuration
#
# On every boot, the ZFS root dataset (zroot/root) is rolled back to its
# blank snapshot, achieving "erase your darlings" impermanence.
_: {
  boot = {
    initrd = {
      supportedFilesystems = ["zfs"];
    };

    supportedFilesystems = ["zfs"];
    zfs = {
      forceImportRoot = false;
      forceImportAll = false;
      devNodes = "/dev/disk/by-id";
    };

    loader = {
      systemd-boot.enable = true;
      # VirtualBox EFI NVRAM is limited; disabling this prevents bootctl from
      # failing to write boot entries, which would leave the system unbootable.
      efi.canTouchEfiVariables = false;
    };
  };

  # ZFS requires a unique hostId per machine
  networking.hostId = "1a2b3c4d";
}
