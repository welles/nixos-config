# GRUB EFI Bootloader
#
# Configures GRUB as the bootloader with EFI support. Adds exFAT
# filesystem support for external USB drives.
{...}: {
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };
  boot.supportedFilesystems = ["exfat"];
}
