# ZFS GRUB Boot Configuration
#
# GRUB bootloader with EFI and ZFS support, plus:
# - nvme kernel module preloaded early in initrd, before ZFS pool import
# - exFAT filesystem support
#
# Import alongside zfs-rollback.nix for the actual rollback-on-boot service.
_: {
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        zfsSupport = true;
      };
    };

    initrd = {
      supportedFilesystems = ["zfs"];
      # Ensure nvme module is unconditionally loaded early in initrd (before ZFS
      # pool scanning), avoiding a race where udev hasn't yet loaded it from
      # availableKernelModules when zpool import runs.
      kernelModules = ["nvme"];
    };

    supportedFilesystems = ["zfs" "exfat"];
    zfs = {
      devNodes = "/dev/disk/by-id";
      forceImportRoot = false;
      forceImportAll = false;
    };
  };
}
