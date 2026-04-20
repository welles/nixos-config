# ZFS Boot Configuration
#
# On every boot, the ZFS root dataset (zroot/root) is rolled back to its
# blank snapshot, achieving "erase your darlings" impermanence.
{lib, ...}: {
  boot = {
    initrd = {
      supportedFilesystems = ["zfs"];
      postDeviceCommands = lib.mkAfter ''
        udevadm settle
        zpool import -d /dev/disk/by-id -N -f zroot || true
        zfs rollback -r zroot/root@blank && echo -e "\e[32m  rolled back to blank root\e[0m" || echo -e "\e[31m  no blank root snapshot found, skipping rollback\e[0m"
      '';
    };

    supportedFilesystems = ["zfs"];
    zfs = {
      forceImportAll = true;
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
