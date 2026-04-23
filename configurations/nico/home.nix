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
    ../../modules/home/shell.nix
    ../../modules/home/cli-tools.nix
    ../../modules/home/git.nix
    ../../modules/home/npm-packages.nix
  ];

  # --- Appearance & Theming ---
  # Unified dark theme across GTK, Qt, and GNOME/Flatpak applications.
  # Uses KDE Breeze Dark with a matching cursor theme.

  fonts.fontconfig.enable = true;

  home = {
    pointerCursor = {
      gtk.enable = true;
      name = "Breeze_Light";
      package = pkgs.kdePackages.breeze;
      size = 24;
    };

    # --- Session Environment ---
    # Sets VS Code as default editor, Konsole as default terminal,
    # enables Wayland for Electron apps via NIXOS_OZONE_WL, and
    # points SSH_AUTH_SOCK to the Bitwarden SSH agent socket.
    sessionVariables = {
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
      TERMINAL = "konsole";
      EDITOR = "code";
      SOPS_EDITOR = "nano";
      NIXOS_OZONE_WL = "1";
      SOPS_AGE_KEY_FILE = "/var/lib/sops-nix/key.txt";
    };

    sessionPath = [
      "${config.home.homeDirectory}/.npm-global/bin"
    ];

    # --- npm Configuration ---
    # Global npm prefix to avoid permission issues; exact versions
    # by default to prevent accidental minor/patch bumps.
    file.".npmrc".text = ''
      prefix=${config.home.homeDirectory}/.npm-global
      save-exact=true
      save-prefix=
    '';

    # --- Cleanup ---
    # Remove stale GTK 2.0 config files that conflict with home-manager.
    activation = {
      cleanGtkConfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
        rm -f ${config.home.homeDirectory}/.gtkrc-2.0
        rm -f ${config.home.homeDirectory}/.gtkrc-2.0.backup
      '';
    };
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
  # Extends shared git.nix with SSH commit signing via Bitwarden SSH
  # agent and SmartGit submodule settings.

  programs = {
    git = {
      settings = {
        gpg.format = "ssh";
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
    # Base shell and CLI tools are imported from packages/shell.nix and
    # packages/cli-tools.nix. Below are nico-specific extensions.

    # Custom starship prompt symbols
    starship.settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };

    btop.settings.theme_background = false;

    # Desktop-specific CLI tools
    bat.enable = true;
    ripgrep.enable = true;
    konsole.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };

  # --- XDG User Directories ---
  # Force English names for standard user directories (Documents, Downloads, etc.)
  # even though the system locale is German. This ensures consistency with
  # the impermanence configuration and prevents localized folder creation.
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
    desktop = "$HOME/Desktop";
    publicShare = "$HOME/Public";
    templates = "$HOME/Templates";
  };
}
