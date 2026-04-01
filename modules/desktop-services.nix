# Desktop Services
#
# Services for desktop use: printing with Gutenprint drivers,
# Flatpak for sandboxed app installation, and udisks2 + gvfs for
# removable media auto-mounting.
{pkgs, ...}: {
  services.printing = {
    enable = true;
    drivers = [pkgs.gutenprint pkgs.gutenprintBin];
  };

  services.flatpak.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}
