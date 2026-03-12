# Boot Loader Configuration
#
# Configures GRUB as the bootloader with EFI support. Adds exFAT
# filesystem support for external USB drives.
{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };
    #kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["exfat"];
  };
}
