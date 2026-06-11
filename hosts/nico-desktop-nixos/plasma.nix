_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    panels = [
      {
        location = "left";
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
  };
}
