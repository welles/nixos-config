{lib, ...}: {
  networking.hostId = "c0ffee12";

  fileSystems."/mnt/bucket/persist".neededForBoot = true;
  fileSystems."/mnt/bucket/apps".neededForBoot = true;
  fileSystems."/mnt/bucket/stacks".neededForBoot = true;

  boot.initrd.supportedFilesystems = ["zfs"];
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    udevadm settle
    zpool import -d /dev/disk/by-id -N -f bucket || true
    zfs rollback -r bucket/root@blank && echo "  rollbacked to blank root" || echo "  no blank root snapshot found, skipping rollback"
  '';

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["zfs"];
  boot.zfs.forceImportAll = true;
  boot.zfs.devNodes = "/dev/disk/by-id";
  boot.loader.grub = {
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
}
