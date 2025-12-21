{
  config,
  pkgs,
  ...
}: {
  home.username = "nico";
  home.homeDirectory = "/home/nico";

  home.packages = with pkgs; [
    # (pkgs.catppuccin-kde.override {
    #   flavour = ["mocha"];
    #   accents = ["blue"];
    #   winDecStyles = ["modern"];
    # })
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

  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  # };

  gtk = {
    enable = true;
    # theme = {
    #   name = "Breeze-Dark";
    #   package = pkgs.kdePackages.breeze-gtk;
    # };

    # iconTheme = {
    #   name = "breeze-dark";
    #   package = pkgs.kdePackages.breeze-icons;
    # };
    # gtk3.extraConfig = {
    #   gtk-application-prefer-dark-theme = 1;
    # };
    # gtk4.extraConfig = {
    #   gtk-application-prefer-dark-theme = 1;
    # };
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

  # programs.kitty = {
  #   enable = true;

  #   font = {
  #     name = "FiraCode Nerd Font";
  #     size = 11;
  #   };

  #   settings = {
  #     confirm_os_window_close = 0;
  #     background_opacity = "0.9";
  #   };
  # };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
    };
  };

  programs.konsole = {
    enable = true;
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
        dimInactive.enable = true;
        slideBack.enable = true;
        zoom.enable = true;
      };
    };

    configFile = {
      "kdeglobals"."General" = {
        # "TerminalApplication" = "kitty";
        # "TerminalService" = "kitty.desktop";
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
    TERMINAL = "kitty";
    EDITOR = "code";
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
