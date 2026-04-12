# KDE Plasma 6 Desktop Configuration
#
# Declarative Plasma settings managed by plasma-manager. Configures:
# - Power management profiles (AC, battery, low battery) with hibernate
# - KWin effects (wobbly windows, blur, translucency, zoom)
# - Fonts (Noto Sans / Fira Code Nerd Font)
# - Breeze Dark workspace theme with Mountain wallpaper
# - Left-aligned floating panel with Kickoff menu and system tray
# - KZones window tiling layouts (50/50, fullscreen, thirds, sidebar)
{pkgs, ...}: {
  # Dolphin file manager settings: compact view, hidden files, item size.
  # xdg.dataFile sets the global view properties (ViewMode) as a symlink; if the
  # user changes view settings in the UI, the next rebuild will restore these.
  xdg.dataFile."dolphin/view_properties/global/.directory".text = ''
    [Dolphin]
    ViewMode=1
  '';

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

    kwin = {
      borderlessMaximizedWindows = false;
      effects = {
        wobblyWindows.enable = true;
        translucency.enable = true;
        blur.enable = true;
        dimInactive.enable = false;
        slideBack.enable = true;
        zoom.enable = true;
      };
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
      "dolphinrc" = {
        "General"."GlobalViewProps" = true;
        "General"."ShowHiddenFiles" = true;
        "CompactMode"."PreviewSize" = 32;
      };

      "breezerc"."Common" = {
        "ShadowSize" = "ShadowNone";
        "OutlineIntensity" = "OutlineOff";
      };
      "kscreenlockerrc" = {
        "Greeter" = {
          "WallpaperPlugin" = "org.kde.image";
        };
        "Greeter/Wallpaper/org.kde.image/General" = {
          "DynamicMode" = 3;
          "Image" = "file://${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images/5120x2880.png";
          "ImagePreview" = "file://${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images/5120x2880.png";
        };
      };
      "kwinrc"."NightColor" = {
        "Active" = true;
      };
      "kwinrc"."Plugins" = {
        "kzonesEnabled" = true;
      };
      "kwinrc"."Script-kzones" = {
        "autoSnapAllNew" = false;
        "layoutsJson" = builtins.toJSON [
          {
            name = "50/50";
            padding = 10;
            zones = [
              {
                x = 0;
                y = 0;
                width = 50;
                height = 100;
              }
              {
                x = 50;
                y = 0;
                width = 50;
                height = 100;
              }
            ];
          }
          {
            name = "100";
            padding = 10;
            zones = [
              {
                x = 0;
                y = 0;
                width = 100;
                height = 100;
              }
            ];
          }
          {
            name = "33/33/33";
            padding = 10;
            zones = [
              {
                x = 0;
                y = 0;
                width = 33;
                height = 100;
              }
              {
                x = 33;
                y = 0;
                width = 34;
                height = 100;
              }
              {
                x = 67;
                y = 0;
                width = 33;
                height = 100;
              }
            ];
          }
          {
            name = "20-20/80";
            padding = 10;
            zones = [
              {
                x = 0;
                y = 0;
                width = 20;
                height = 50;
              }
              {
                x = 0;
                y = 50;
                width = 20;
                height = 50;
              }
              {
                x = 20;
                y = 0;
                width = 80;
                height = 100;
              }
            ];
          }
        ];
      };
    };

    input.keyboard = {
      numlockOnStartup = "on";
    };

    workspace = {
      colorScheme = "BreezeDark";
      iconTheme = "breeze-dark";
      theme = "breeze-dark";
      cursor.theme = "Breeze_Light";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images/5120x2880.png";
      splashScreen.theme = "None";
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
