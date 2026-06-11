{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./plasma.nix
    ../../modules/home/shell.nix
    ../../modules/home/cli-tools.nix
    ../../modules/home/git.nix
    ../../modules/home/npm.nix
  ];

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.theme = null;
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  fonts.fontconfig.enable = true;

  home = {
    sessionVariables = {
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
      TERMINAL = "konsole";
      EDITOR = "code";
      SOPS_EDITOR = "nano";
      SOPS_AGE_KEY_FILE = "/var/lib/sops-nix/key.txt";
    };

    activation = {
      cleanGtkConfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
        rm -f ${config.home.homeDirectory}/.gtkrc-2.0
        rm -f ${config.home.homeDirectory}/.gtkrc-2.0.backup
      '';
      restartDesktopPortal = lib.hm.dag.entryAfter ["writeBoundary"] ''
        $DRY_RUN_CMD systemctl --user restart plasma-xdg-desktop-portal-kde.service || true
      '';
    };
  };

  programs = {
    konsole = {
      enable = true;
      profiles.default = {
        name = "Default";
        font = {
          name = "FiraCode Nerd Font";
          size = 11;
        };
        extraConfig.Appearance.EnableLigatures = true;
      };
      defaultProfile = "default";
    };

    git = {
      settings.gpg.format = "ssh";
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
        signByDefault = true;
      };
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = false;
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
    desktop = "$HOME/Desktop";
    publicShare = "$HOME/Public";
    templates = "$HOME/Templates";
  };

  xdg.configFile."autostart/bitwarden.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Bitwarden
    Comment=Bitwarden startup script
    Exec=${pkgs.bitwarden-desktop}/bin/bitwarden
    StartupNotify=false
    Terminal=false
  '';
}
