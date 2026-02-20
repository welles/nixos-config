{lib, ...}: {
  networking.hostId = "c0ffee12";

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r bucket/local/root@blank && echo "  rollbacked to blank root" || echo "  no blank root snapshot found, skipping rollback"
  '';

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["zfs"];
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
  boot.zfs.forceImportRoot = false;
  boot.zfs.devNodes = "/dev/disk/by-id";
}
