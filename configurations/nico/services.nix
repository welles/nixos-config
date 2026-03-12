# System Services
#
# Configures printing with Gutenprint drivers, Avahi for mDNS/DNS-SD
# network discovery (used by printers and Chromecasts), Flatpak for
# sandboxed app installation, udisks2 and gvfs for removable media
# auto-mounting, and a polkit rule that lets members of the "wheel"
# group mount filesystems without entering a password.
{pkgs, ...}: {
  imports = [
    ../../modules/avahi.nix
  ];

  services.printing = {
    enable = true;
    drivers = [
      pkgs.gutenprint
      pkgs.gutenprintBin
    ];
  };

  services.flatpak.enable = true;

  services.udisks2.enable = true;
  services.gvfs.enable = true;

  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
             action.id == "org.freedesktop.udisks2.filesystem-mount") &&
            subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';
  };
}
