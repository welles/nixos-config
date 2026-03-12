# Nico's Home Manager Configuration
#
# User-level configuration for the desktop environment, shell, Git,
# theming, and autostart applications. Managed by home-manager as
# a NixOS module.
{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./plasma.nix
  ];

  # --- Appearance & Theming ---
  # Unified dark theme across GTK, Qt, and GNOME/Flatpak applications.
  # Uses KDE Breeze Dark with a matching cursor theme.

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Breeze_Light";
    package = pkgs.kdePackages.breeze;
    size = 24;
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

  # --- Git ---
  # SSH-based commit signing via Bitwarden SSH agent.

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

  # --- Shell & CLI Tools ---
  # Zsh with Oh-my-zsh, autosuggestions, and syntax highlighting.
  # Starship prompt, eza (ls replacement), bat (cat replacement),
  # ripgrep, fzf, yazi (file manager), and direnv for per-project
  # Nix shells.

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

  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.fastfetch.enable = true;
  programs.konsole.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # --- Session Environment ---
  # Sets VS Code as default editor, Konsole as default terminal,
  # enables Wayland for Electron apps via NIXOS_OZONE_WL, and
  # points SSH_AUTH_SOCK to the Bitwarden SSH agent socket.

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

  # --- Autostart & Desktop Entries ---
  # Bitwarden starts at login for password/SSH agent access.
  # Remmina applet is hidden from autostart by default.

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

  # --- npm Configuration ---
  # Global npm prefix to avoid permission issues; exact versions
  # by default to prevent accidental minor/patch bumps.

  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm-global
    save-exact=true
    save-prefix=
  '';

  # --- Cleanup ---
  # Remove stale GTK 2.0 config files that conflict with home-manager.

  home.activation = {
    cleanGtkConfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
      rm -f ${config.home.homeDirectory}/.gtkrc-2.0
      rm -f ${config.home.homeDirectory}/.gtkrc-2.0.backup
    '';
  };

  programs.home-manager.enable = true;
}
