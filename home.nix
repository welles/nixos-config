{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "nico";
  home.homeDirectory = "/home/nico";

  home.packages = with pkgs; [
    pkgs.nerd-fonts.fira-code
  ];

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
        "OutlineIntensity" = "OutlineOff"
      };
      "kwinrc"."Plugins" = {
        "kzonesEnabled" = true;
      };
      "kwinrc"."Script-kzones" = {
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
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
