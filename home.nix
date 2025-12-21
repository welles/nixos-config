{
  config,
  pkgs,
  ...
}: {
  home.username = "nico";
  home.homeDirectory = "/home/nico";

  home.packages = with pkgs; [
    (pkgs.catppuccin-kde.override {
      flavour = ["mocha"];
      accents = ["blue"];
      winDecStyles = ["modern"];
    })
  ];

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

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

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
    style.name = "kvantum";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.konsole.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
    };
  };

  programs.plasma = {
    enable = true;
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

    input.keyboard = {
      numlockOnStartup = "on";
    };

    workspace = {
      lookAndFeel = "Catppuccin-Mocha-Blue";
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
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
