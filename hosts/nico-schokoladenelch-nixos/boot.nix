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

    # Since kernel 6.18.54 the xe driver claims the Raptor Lake iGPU (a780)
    # but refuses to probe it without force_probe, which keeps i915 from
    # binding and leaves no /dev/dri/renderD128 for Jellyfin transcoding.
    blacklistedKernelModules = ["xe"];
    kernelModules = ["i915"];

    supportedFilesystems = ["zfs"];
    zfs = {
      forceImportRoot = false;
      forceImportAll = false;
      devNodes = "/dev/disk/by-id";
    };
  };
}
