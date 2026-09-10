# ZFS Boot Configuration
#
# Configures GRUB with ZFS support and mirrored boot partitions for
# redundancy. On every boot, the ZFS root dataset (bucket/root) is
# rolled back to its blank snapshot, achieving an "erase your darlings"
# impermanence setup where only explicitly persisted data survives reboots.
_: {
  boot = {
    initrd = {
      supportedFilesystems = ["zfs"];
    };

    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        zfsSupport = true;
        efiSupport = true;
        mirroredBoots = [
          {
            path = "/boot";
            devices = ["nodev"];
          }
          {
            path = "/boot-fallback";
            devices = ["nodev"];
          }
        ];
      };
    };

    supportedFilesystems = ["zfs"];
    zfs = {
      forceImportRoot = false;
      forceImportAll = false;
      devNodes = "/dev/disk/by-id";
    };
  };
}
