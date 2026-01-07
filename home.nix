{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "nico";
  home.homeDirectory = "/home/nico";

  # home.packages = with pkgs; [
  #   pkgs.nerd-fonts.fira-code
  # ];

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Breeze_Light";
    package = pkgs.kdePackages.breeze;
    size = 24;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "Nico Welles";
      user.email = "nico@welles.email";
      gpg.format = "ssh";
    };
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
      signByDefault = true;
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  gtk = {
    enable = true;

    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.konsole = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    powerdevil = {
      batteryLevels = {
        criticalLevel = 5;
        lowLevel = 20;

        criticalAction = "hibernate";
      };

      AC = {
        turnOffDisplay = {
          idleTimeout = "never";
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
          idleTimeoutWhenLocked = "immediately";
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
          idleTimeoutWhenLocked = "immediately";
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
      "kdeglobals"."General" = {
        # "TerminalApplication" = "kitty";
        # "TerminalService" = "kitty.desktop";
      };
      "breezerc"."Common" = {
        "ShadowSize" = "ShadowNone";
        "OutlineIntensity" = "OutlineOff";
      };
      # "kickoffrc"."Favorites"."FavoriteURLs" = lib.strings.concatStringsSep "," [
      #   "applications:bitwarden.desktop"
      #   "applications:code.desktop"
      #   "applications:firefox.desktop"
      #   "applications:org.kde.konsole.desktop"
      #   "applications:rider.desktop"
      #   "applications:smartgit.desktop"
      #   "applications:steam.desktop"
      #   "applications:systemsettings.desktop"
      #   "applications:teams-for-linux.desktop"
      #   "applications:vesktop.desktop"
      # ];
      "kwinrc"."Plugins" = {
        "kzonesEnabled" = true;
      };
      "kwinrc"."Script-kzones" = {
        "autoSnapAllNew" = true;
        "layoutsJson" = builtins.toJSON [
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
        ];
      };
    };

    shortcuts = {
      # "org.kde.konsole.desktop"."_launch" = "none";
      # "kitty.desktop"."_launch" = "Ctrl+Alt+T";
    };

    input.keyboard = {
      numlockOnStartup = "on";
    };

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor.theme = "Breeze_Light";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/#light";
    };

    kscreenlocker.appearance.wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/#light";

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

          "org.kde.plasma.lock_logout"

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

  home.sessionVariables = {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
    TERMINAL = "konsole";
    EDITOR = "code";
    NIXOS_OZONE_WL = "1";
  };

  home.activation = {
    cleanGtkConfig = lib.hm.dag.entryBefore ["writeBoundary"] ''
      rm -f ${config.home.homeDirectory}/.gtkrc-2.0
      rm -f ${config.home.homeDirectory}/.gtkrc-2.0.backup
    '';

    cleanPlasmaConfig = lib.hm.dag.entryBefore ["writeBoundary"] ''
      rm -f ${config.home.homeDirectory}/.config/gwenviewrc
      rm -f ${config.home.homeDirectory}/.config/kscreenlockerrc
      rm -f ${config.home.homeDirectory}/.config/plasma-org.kde.plasma.desktop-appletsrc
      rm -f ${config.home.homeDirectory}/.config/plasmashellrc
    '';

    # cleanKickoffFavorites = lib.hm.dag.entryBefore ["writeBoundary"] ''
    #   rm -f ${config.home.homeDirectory}/.config/kactivitymanagerd-statsrc
    # '';
  };

  # home.file.".config/autostart-scripts/set-wallpaper-potd.sh" = {
  #   executable = true;
  #   text = ''
  #     #!/bin/sh
  #     sleep 5

  #     qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
  #       var allDesktops = desktops();
  #       for (var i = 0; i < allDesktops.length; i++) {
  #           var d = allDesktops[i];
  #           d.wallpaperPlugin = "org.kde.potd";
  #           d.currentConfigGroup = ["Wallpaper", "org.kde.potd", "General"];
  #           d.writeConfig("Provider", "flickr");
  #           d.writeConfig("FillMode", "2");
  #           d.writeConfig("UpdateOverMeteredConnection", "1");
  #           d.reloadConfig();
  #       }
  #     '
  #   '';
  # };

  # home.file.".config/autostart-scripts/set-favorites.sh" = {
  #   executable = true;
  #   text = let
  #     favList = lib.strings.concatStringsSep "," [
  #       "applications:bitwarden.desktop"
  #       "applications:code.desktop"
  #       "applications:firefox.desktop"
  #       "applications:org.kde.konsole.desktop"
  #       "applications:rider.desktop"
  #       "applications:smartgit.desktop"
  #       "applications:steam.desktop"
  #       "applications:systemsettings.desktop"
  #       "applications:teams-for-linux.desktop"
  #       "applications:vesktop.desktop"
  #     ];
  #   in ''
  #     #!/bin/sh
  #     sleep 5

  #     qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
  #       var favorites = "${favList}";

  #       var allPanels = panels();

  #       for (var i = 0; i < allPanels.length; i++) {
  #           var p = allPanels[i];
  #           var widgets = p.widgets();

  #           for (var j = 0; j < widgets.length; j++) {
  #               var w = widgets[j];

  #               if (w.type == "org.kde.plasma.kickoff" || w.type == "org.kde.plasma.kicker") {

  #                   w.currentConfigGroup = ["General"];
  #                   w.writeConfig("favorites", favorites);

  #                   w.reloadConfig();
  #               }
  #           }
  #       }
  #     '
  #   '';
  # };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
