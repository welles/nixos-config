{pkgs, ...}: {
  programs.dconf.enable = true;

  services = {
    xserver.enable = true;
    xserver.xkb.layout = "de";
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    power-profiles-daemon.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "kde";
  };
}
