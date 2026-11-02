# Plasma's Night Color shifts the screen to warmer colours in the evening.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.configFile."kwinrc"."NightColor"."Active" = true;
    }
  ];
}
