# ZFS Laptop Boot Configuration
#
# Full boot configuration for ZFS-with-impermanence laptops. Combines:
# - GRUB bootloader with EFI and ZFS support
# - ZFS pool import and dataset rollback in initrd (erase-your-darlings)
# - exFAT filesystem support
#
# Shared by nico-thinkbook-nixos and nico-thinkpad-nixos.
{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        zfsSupport = true;
      };
    };

    initrd = {
      supportedFilesystems = ["zfs"];
      # Ensure nvme module is unconditionally loaded early in initrd (before ZFS
      # pool scanning), avoiding a race where udev hasn't yet loaded it from
      # availableKernelModules when zpool import runs.
      kernelModules = ["nvme"];
      systemd.services.rollback-root = {
        description = "Rollback ZFS root dataset to a blank snapshot";
        wantedBy = ["initrd.target"];
        after = ["zfs-import-main.service"];
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
          if zfs rollback -r main/root@blank; then
            echo -e "\e[1;30;42m [ OK ] \e[0m \e[1;32mmain/root rolled back to @blank\e[0m"
          else
            echo -e "\e[1;97;41m [FAIL] \e[0m \e[1;31mno blank snapshot found for main/root\e[0m"
          fi
          echo ""
        '';
      };
    };

    supportedFilesystems = ["zfs" "exfat"];
    zfs = {
      devNodes = "/dev/disk/by-id";
      forceImportRoot = false;
      forceImportAll = false;
    };
  };
}
