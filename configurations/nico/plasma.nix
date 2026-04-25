# KDE Plasma 6 Desktop Configuration
#
# Declarative Plasma settings managed by plasma-manager. Configures:
# - Power management profiles (AC, battery, low battery) with hibernate
# - Fonts (Noto Sans / Fira Code Nerd Font)
# - Default Breeze Dark look and feel
# - Left-aligned floating panel with Kickoff menu and system tray
_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    session.general.askForConfirmationOnLogout = false;

    powerdevil = {
      batteryLevels = {
        criticalLevel = 5;
        lowLevel = 20;

        criticalAction = "hibernate";
      };

      AC = {
        turnOffDisplay = {
          idleTimeout = 28800;
          idleTimeoutWhenLocked = 60;
        };

        dimDisplay = {
          enable = false;
        };

        autoSuspend = {
          action = "nothing";
        };

        powerButtonAction = "hibernate";

        powerProfile = "performance";

        whenLaptopLidClosed = "doNothing";
        inhibitLidActionWhenExternalMonitorConnected = true;
      };

      battery = {
        turnOffDisplay = {
          idleTimeout = 900;
          idleTimeoutWhenLocked = 60;
        };

        dimDisplay = {
          enable = true;
          idleTimeout = 300;
        };

        autoSuspend = {
          action = "sleep";
        };

        powerButtonAction = "hibernate";

        powerProfile = "balanced";

        whenLaptopLidClosed = "hibernate";
        inhibitLidActionWhenExternalMonitorConnected = true;
      };

      lowBattery = {
        turnOffDisplay = {
          idleTimeout = 180;
          idleTimeoutWhenLocked = 60;
        };

        dimDisplay = {
          enable = true;
          idleTimeout = 60;
        };

        autoSuspend = {
          action = "hibernate";
        };

        powerButtonAction = "hibernate";

        powerProfile = "powerSaving";

        whenLaptopLidClosed = "hibernate";
        inhibitLidActionWhenExternalMonitorConnected = true;
      };
    };

    kscreenlocker = {
      autoLock = false;
    };

    fonts = {
      general = {
        family = "Noto Sans";
        pointSize = 11;
      };
      fixedWidth = {
        family = "Fira Code Nerd Font";
        pointSize = 11;
      };
    };

    configFile = {
      "kwinrc"."NightColor" = {
        "Active" = true;
      };
      "kwinrc"."ElectricBorders" = {
        "BottomLeft" = "ShowDesktop";
        "TopLeft" = "ApplicationLauncher";
      };
      "kwinrc"."Plugins" = {
        # "mousetilerEnabled" = true;
        "rememberwindowpositionsEnabled" = true;
      };
    };

    input.keyboard = {
      numlockOnStartup = "on";
    };

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    panels = [
      {
        location = "left";
        height = 50;
        floating = true;

        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "nix-snowflake-white";
              };
            };
          }

          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                launchers = [];
              };
            };
          }

          "org.kde.plasma.marginsseparator"

          "org.kde.plasma.systemtray"

          # "org.kde.plasma.lock_logout"

          {
            name = "org.kde.plasma.digitalclock";
            config = {
              Appearance = {
                showDate = "false";
              };
            };
          }
        ];
      }
    ];
  };
}
