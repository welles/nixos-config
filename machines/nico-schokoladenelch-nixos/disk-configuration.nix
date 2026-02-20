{
  disko.devices = {
    disk = {
      # -----------------------------------------------------------------------
      # THE SSD MIRROR (OS, Apps, Docker, Persistence)
      # -----------------------------------------------------------------------
      ssd1 = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-WD_BLACK_SN850X_HS_1000GB_24051E800825";
        content = {
          type = "gpt";
          partitions = {
            # Primary Boot Partition
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            # ZFS Mirror Part 1
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "rpool";
              };
            };
          };
        };
      };

      ssd2 = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-SKHynix_HFS001TEM4X182N_5ME4N00541020650D";
        content = {
          type = "gpt";
          partitions = {
            # Fallback Boot Partition
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot-fallback";
                mountOptions = ["umask=0077"];
              };
            };
            # ZFS Mirror Part 2
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "rpool";
              };
            };
          };
        };
      };

      # -----------------------------------------------------------------------
      # THE HDD ARRAY (Mass Storage)
      # -----------------------------------------------------------------------
      hdd1 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-TOSHIBA_MG08ACA16TE_44S0A028FVGG";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "tank";
              };
            };
          };
        };
      };
      hdd2 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-TOSHIBA_MG08ACA16TE_44S0A02LFVGG";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "tank";
              };
            };
          };
        };
      };
      hdd3 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-TOSHIBA_MG08ACA16TE_44S0A0DFFVGG";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "tank";
              };
            };
          };
        };
      };
      hdd4 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-TOSHIBA_MG08ACA16TE_44S0A0NQFVGG";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "tank";
              };
            };
          };
        };
      };
    };

    # -----------------------------------------------------------------------
    # ZFS POOL DEFINITIONS
    # -----------------------------------------------------------------------
    zpool = {
      # --- The SSD Pool ---
      rpool = {
        type = "zpool";
        mode = "mirror"; # Creates the RAID 1
        rootFsOptions = {
          compression = "lz4";
          acltype = "posixacl";
          xattr = "sa";
          autotrim = "on"; # Critical for SSD longevity
          "com.sun:auto-snapshot" = "false"; # Disable global snapshots
        };

        datasets = {
          # The Ephemeral Root (Wiped on boot)
          "local/root" = {
            type = "zfs_fs";
            mountpoint = "/";
            options.mountpoint = "legacy";
          };
          # The Nix Store (Must persist)
          "local/nix" = {
            type = "zfs_fs";
            mountpoint = "/nix";
            options.mountpoint = "legacy";
          };
          # The Safe Haven (Your SSH keys and config)
          "safe/persist" = {
            type = "zfs_fs";
            mountpoint = "/persist";
            options.mountpoint = "legacy";
          };
          # Your Docker Data
          "safe/apps" = {
            type = "zfs_fs";
            mountpoint = "/mnt/apps";
            options."com.sun:auto-snapshot" = "true"; # Good idea to snapshot app configs!
          };
        };
      };

      # --- The HDD Pool ---
      tank = {
        type = "zpool";
        mode = "raidz1"; # 1 Parity Drive
        rootFsOptions = {
          compression = "lz4";
          acltype = "posixacl";
          xattr = "sa";
          "com.sun:auto-snapshot" = "false";
        };

        datasets = {
          # Movies/TV Shows (Massive files, no snapshots needed to save space)
          "media/movies" = {
            type = "zfs_fs";
            mountpoint = "/mnt/tank/media/movies";
          };

          # Family Photos (Enable snapshots here to protect against accidental deletion)
          "media/photos" = {
            type = "zfs_fs";
            mountpoint = "/mnt/tank/media/photos";
            options."com.sun:auto-snapshot" = "true";
          };

          # Nextcloud Data
          "nextcloud" = {
            type = "zfs_fs";
            mountpoint = "/mnt/tank/nextcloud";
            options."com.sun:auto-snapshot" = "true";
          };
        };
      };
    };
  };
}
