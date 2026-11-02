# Plasma screen corners: top left opens the application launcher, bottom
# left shows the desktop.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.configFile."kwinrc"."ElectricBorders" = {
        "BottomLeft" = "ShowDesktop";
        "TopLeft" = "ApplicationLauncher";
      };
    }
  ];
}
