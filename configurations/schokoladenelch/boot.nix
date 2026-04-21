# ZFS Boot Configuration
#
# Configures GRUB with ZFS support and mirrored boot partitions for
# redundancy. On every boot, the ZFS root dataset (bucket/root) is
# rolled back to its blank snapshot, achieving an "erase your darlings"
# impermanence setup where only explicitly persisted data survives reboots.
{pkgs, ...}: {
  boot = {
    initrd = {
      supportedFilesystems = ["zfs"];
      systemd.services.rollback-root = {
        description = "Rollback ZFS root dataset to a blank snapshot";
        wantedBy = ["initrd.target"];
        after = ["zfs-import-bucket.service"];
        before = ["sysroot.mount"];
        path = [pkgs.zfs];
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = ''
          zfs rollback -r bucket/root@blank \
            && echo -e "\e[32m  rolled back to blank root\e[0m" \
            || echo -e "\e[31m  no blank root snapshot found, skipping rollback\e[0m"
        '';
      };
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
