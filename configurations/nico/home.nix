{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "nico";
  home.homeDirectory = "/home/nico";

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
      init.defaultBranch = "main";
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

    initContent = "fastfetch";

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

    session = {
      logoutConfirmation = "never";
    };

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
          "Image" = "file://${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/#light";
          "ImagePreview" = "file://${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/#light";
        };
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
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/#light";
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

  home.sessionVariables = {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
    TERMINAL = "konsole";
    EDITOR = "code";
    NIXOS_OZONE_WL = "1";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.npm-global/bin"
  ];

  xdg.configFile."autostart/bitwarden.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Bitwarden
    Comment=Bitwarden startup script
    Exec=${pkgs.bitwarden-desktop}/bin/bitwarden
    StartupNotify=false
    Terminal=false
  '';

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
  };

  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm-global
    save-exact=true
    save-prefix=
  '';

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
