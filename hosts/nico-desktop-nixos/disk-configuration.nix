# Disk Layout (Disko)
#
# Single-disk ZFS setup for impermanence ("erase your darlings"):
#   "main" pool (single disk, no redundancy):
#     - Datasets: root (ephemeral), nix, persist
#
# TODO: Replace the device path with the actual disk ID before first install.
#       Find it with: ls -l /dev/disk/by-id/
_: {
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-Samsung_980_PRO_with_Heatsink_1TB_S6WSNS0RB80576F";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            swap = {
              size = "64G";
              content = {
                type = "swap";
                discardPolicy = "both";
              };
            };
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "main";
              };
            };
          };
        };
      };
    };
    zpool = {
      main = {
        type = "zpool";
        options = {
          ashift = "12";
          autotrim = "on";
        };
        rootFsOptions = {
          compression = "lz4";
          acltype = "posixacl";
          xattr = "sa";
          "com.sun:auto-snapshot" = "false";
          mountpoint = "none";
          canmount = "off";
        };
        datasets = {
          "root" = {
            type = "zfs_fs";
            mountpoint = "/";
            options.mountpoint = "legacy";
          };
          "nix" = {
            type = "zfs_fs";
            mountpoint = "/nix";
            options.mountpoint = "legacy";
          };
          "persist" = {
            type = "zfs_fs";
            mountpoint = "/persist";
            options = {
              mountpoint = "legacy";
              "com.sun:auto-snapshot" = "true";
            };
          };
        };
      };
    };
  };
}
