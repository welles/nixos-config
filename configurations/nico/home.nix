{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./plasma.nix
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
      init.defaultBranch = "main";
      pull.rebase = true;
      gui.pruneduringfetch = true;
      "smartgit \"submodule\"" = {
        fetchalways = true;
        update = true;
        initializenew = true;
      };
      push.recurseSubmodules = "check";
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

  home.sessionVariables = {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
    TERMINAL = "konsole";
    EDITOR = "code";
    SOPS_EDITOR = "nano";
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

  xdg.configFile."autostart/remmina-applet.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Remmina Applet
    Exec=remmina -i
    Hidden=true
  '';

  home.activation = {
    cleanGtkConfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
      rm -f ${config.home.homeDirectory}/.gtkrc-2.0
      rm -f ${config.home.homeDirectory}/.gtkrc-2.0.backup
    '';

    # cleanPlasmaConfig = lib.hm.dag.entryBefore ["writeBoundary"] ''
    #   rm -f ${config.home.homeDirectory}/.config/gwenviewrc
    #   rm -f ${config.home.homeDirectory}/.config/kscreenlockerrc
    #   rm -f ${config.home.homeDirectory}/.config/plasma-org.kde.plasma.desktop-appletsrc
    #   rm -f ${config.home.homeDirectory}/.config/plasmashellrc

    #   rm -rf ${config.home.homeDirectory}/.local/share/kscreen
    #   rm -f ${config.home.homeDirectory}/.config/kwinoutputconfig.json
    # '';
  };

  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm-global
    save-exact=true
    save-prefix=
  '';

  programs.home-manager.enable = true;
}
