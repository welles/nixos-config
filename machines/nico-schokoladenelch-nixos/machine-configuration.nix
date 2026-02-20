{lib, ...}: {
  networking.hostId = "c0ffee12";

  fileSystems."/mnt/bucket/persist".neededForBoot = true;

  boot.initrd.supportedFilesystems = ["zfs"];
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    udevadm settle
    # Import the pool using the same device nodes as the rest of the system
    # We use -N to import without mounting yet
    zpool import -d /dev/disk/by-id -N -f bucket || true

    echo "Attempting to rollback root..."
    if zfs rollback -r bucket/local/root@blank; then
      echo "  rollbacked to blank root"
    else
      echo "  ROLLBACK FAILED: Dataset or pool not found."
      echo "  Current ZFS status:"
      zfs list || echo "  (No datasets visible)"
    fi
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
