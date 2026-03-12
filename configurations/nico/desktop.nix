# Desktop Environment Configuration
#
# Sets up KDE Plasma 6 as the desktop environment with SDDM as the
# display manager (Wayland session). Configures XDG portals for
# sandboxed application integration and sets a custom SDDM wallpaper.
{pkgs, ...}: {
  services = {
    xserver.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
    power-profiles-daemon.enable = true;
  };

  services.xserver.xkb.layout = "de";

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "kde";
  };

  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background=${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images/5120x2880.png
    '')
  ];
}
