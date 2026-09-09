_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    session.general.askForConfirmationOnLogout = false;

    kscreenlocker.autoLock = false;

    # plasma-manager's `overrideConfig` wipes kxkbrc on every activation, so the
    # layout must be declared here rather than set once via System Settings.
    input.keyboard = {
      numlockOnStartup = "on";
      layouts = [{layout = "de";}];
    };

    workspace.lookAndFeel = "org.kde.breezedark.desktop";

    panels = [
      {
        location = "bottom";
        height = 50;
        floating = false;

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
