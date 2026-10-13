# ZFS systemd-boot Configuration
#
# systemd-boot with ZFS support, for virtual machines: the EFI variables are
# never touched (their NVRAM may be small, reset or not writable at all),
# bootctl installs the fallback loader (EFI/BOOT/BOOTX64.EFI) the firmware
# boots without any variables.
#
# Import alongside zfs-rollback.nix for the actual rollback-on-boot service.
_: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };

    initrd.supportedFilesystems = ["zfs"];
    supportedFilesystems = ["zfs"];
    zfs = {
      devNodes = "/dev/disk/by-id";
      forceImportRoot = false;
      forceImportAll = false;
    };
  };
}
