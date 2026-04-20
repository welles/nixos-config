# ZFS Boot Configuration
#
# Configures GRUB with ZFS support and mirrored boot partitions for
# redundancy. On every boot, the ZFS root dataset (bucket/root) is
# rolled back to its blank snapshot, achieving an "erase your darlings"
# impermanence setup where only explicitly persisted data survives reboots.
{lib, ...}: {
  boot = {
    initrd = {
      supportedFilesystems = ["zfs"];
      postDeviceCommands = lib.mkAfter ''
        udevadm settle
        zpool import -d /dev/disk/by-id -N -f bucket || true
        zfs rollback -r bucket/root@blank && echo -e "\e[32m  rollbacked to blank root\e[0m" || echo -e "\e[31m  no blank root snapshot found, skipping rollback\e[0m"
      '';
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
      forceImportAll = true;
      devNodes = "/dev/disk/by-id";
    };
  };
}
