_: {
  boot = {
    initrd = {
      supportedFilesystems = ["zfs"];
      kernelModules = ["nvme"];
    };
    supportedFilesystems = ["zfs" "exfat"];
    zfs = {
      devNodes = "/dev/disk/by-id";
      forceImportRoot = false;
      forceImportAll = false;
    };
    loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      grub = {
        enable = true;
        efiSupport = true;
        zfsSupport = true;
        device = "nodev";
      };
    };
  };
}
