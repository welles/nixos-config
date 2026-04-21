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
          echo ""
          echo -e "\e[1;97;44m======================================================\e[0m"
          echo -e "\e[1;97;44m===           ZFS IMPERMANENCE ROLLBACK            ===\e[0m"
          echo -e "\e[1;97;44m======================================================\e[0m"
          echo ""
          if zfs rollback -r bucket/root@blank; then
            echo -e "\e[1;30;42m [ OK ] \e[0m \e[1;32mbucket/root rolled back to @blank\e[0m"
          else
            echo -e "\e[1;97;41m [FAIL] \e[0m \e[1;31mno blank snapshot found for bucket/root\e[0m"
          fi
          echo ""
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
