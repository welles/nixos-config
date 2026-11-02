# Floating Plasma panel on the left edge of every screen: launcher, the
# windows of that screen, system tray and clock.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.panels = [
        {
          location = "left";
          screen = "all";
          height = 50;
          floating = true;

          widgets = [
            {
              name = "org.kde.plasma.kickoff";
              config.General.icon = "nix-snowflake-white";
            }

            {
              name = "org.kde.plasma.icontasks";
              config.General.launchers = [];
              config.General.showOnlyCurrentScreen = true;
            }

            "org.kde.plasma.marginsseparator"

            "org.kde.plasma.systemtray"

            {
              name = "org.kde.plasma.digitalclock";
              config.Appearance.showDate = "false";
            }
          ];
        }
      ];
    }
  ];
}
