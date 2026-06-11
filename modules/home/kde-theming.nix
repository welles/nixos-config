{
  config,
  pkgs,
  lib,
  ...
}: {
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.theme = null;
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  fonts.fontconfig.enable = true;

  home.activation = {
    cleanGtkConfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
      rm -f ${config.home.homeDirectory}/.gtkrc-2.0
      rm -f ${config.home.homeDirectory}/.gtkrc-2.0.backup
    '';
    restartDesktopPortal = lib.hm.dag.entryAfter ["writeBoundary"] ''
      $DRY_RUN_CMD systemctl --user restart plasma-xdg-desktop-portal-kde.service || true
    '';
  };
}
