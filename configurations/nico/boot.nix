# Boot Loader Configuration
#
# Configures GRUB as the bootloader with EFI support and OS probing
# for dual-boot setups. Adds NTFS and exFAT filesystem support for
# accessing Windows partitions and external drives.
{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        default = "saved";
      };
    };
    #kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["ntfs" "exfat"];
  };
}
