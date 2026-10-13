# KDE Plasma 6 Desktop Configuration — Remote Desktop Profile
#
# Declarative Plasma settings managed by plasma-manager, for hosts used over
# RDP (xrdp.nix) without a GPU, where everything is rendered on the CPU
# (llvmpipe). Configures:
# - No compositing and no animations, which cost the most CPU and make the
#   RDP picture change (and be transferred) more often
# - No screen locking, display power-off or suspend: the session is only
#   reachable over RDP, and suspending would freeze the whole machine
# - Default Breeze Dark look and feel
# - Left-aligned floating panel with Kickoff menu and system tray
_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    session.general.askForConfirmationOnLogout = false;

    kscreenlocker.autoLock = false;

    powerdevil.AC = {
      turnOffDisplay.idleTimeout = "never";
      dimDisplay.enable = false;
      autoSuspend.action = "nothing";
      powerButtonAction = "nothing";
    };

    configFile = {
      "kwinrc"."Compositing"."Enabled" = false;
      "kdeglobals"."KDE"."AnimationDurationFactor" = 0;
    };

    workspace.lookAndFeel = "org.kde.breezedark.desktop";

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
