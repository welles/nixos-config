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
  # Theming is managed via the Plasma Look and Feel settings in plasma.nix.
  # We explicitly set the color-scheme preference via dconf so that GTK
  # and portal-aware applications (like Firefox) correctly detect dark mode.

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  fonts.fontconfig.enable = true;

  home = {
    # --- Session Environment ---
    sessionVariables = {
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
      TERMINAL = "konsole";
      EDITOR = "code";
      SOPS_EDITOR = "nano";
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
  };

  # --- XDG User Directories ---
  # Force English names for standard user directories (Documents, Downloads, etc.)
  # even though the system locale is German. This ensures consistency with
  # the impermanence configuration and prevents localized folder creation.
  xdg = {
    userDirs = {
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

    # --- Autostart ---
    # Bitwarden starts at login for password/SSH agent access.
    configFile."autostart/bitwarden.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Bitwarden
      Comment=Bitwarden startup script
      Exec=${pkgs.bitwarden-desktop}/bin/bitwarden
      StartupNotify=false
      Terminal=false
    '';
  };
}
