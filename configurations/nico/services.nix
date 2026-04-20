# System Services
#
# Configures printing with Gutenprint drivers, Avahi for mDNS/DNS-SD
# network discovery (used by printers and Chromecasts), Flatpak for
# sandboxed app installation, and udisks2 and gvfs for removable media
# auto-mounting.
{pkgs, ...}: {
  imports = [
    ../../modules/avahi.nix
  ];

  services = {
    printing = {
      enable = true;
      drivers = [
        pkgs.gutenprint
        pkgs.gutenprintBin
      ];
    };

    flatpak.enable = true;

    udisks2.enable = true;
    gvfs.enable = true;
  };
}
