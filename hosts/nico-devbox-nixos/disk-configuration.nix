# Devbox VM Disk Layout (Disko)
#
# The VM's single virtio disk (the zvol bucket/vms/nico-devbox-nixos on the
# server; libvirt gives it the serial "nico-devbox-nixos"), with a ZFS pool
# for impermanence ("erase your darlings"):
#   "devbox" pool (single disk, redundancy comes from the server's mirror):
#     - Datasets: root (ephemeral), nix, persist
# The pool name must differ from the server's pools (bucket, tank).
{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-id/virtio-nico-devbox-nixos";
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
              size = "8G";
              content = {
                type = "swap";
                discardPolicy = "both";
              };
            };
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "devbox";
              };
            };
          };
        };
      };
    };
    zpool = {
      devbox = {
        type = "zpool";
        options = {
          ashift = "12";
          # Hands freed blocks back to the sparse zvol on the server
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
            # The snapshot zfs-rollback.nix rolls back to on every boot
            postCreateHook = "zfs snapshot devbox/root@blank";
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
