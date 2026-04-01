# Nico's Home Manager Configuration
#
# User-level configuration shared across all of Nico's desktop machines.
# Covers theming, Git signing, shell extensions, session environment,
# autostart entries, and npm settings.
{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./plasma.nix
    ./shell.nix
    ./cli-tools.nix
    ./git.nix
    ./npm-packages.nix
  ];

  # --- Appearance & Theming ---
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
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  # --- Git ---
  programs.git = {
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

  # --- Shell ---
  programs.starship.settings = {
    add_newline = false;
    character = {
      success_symbol = "[➜](bold green)";
      error_symbol = "[➜](bold red)";
    };
  };

  programs.btop.settings.theme_background = false;
  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.konsole.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # --- Session Environment ---
  home.sessionVariables = {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
    TERMINAL = "konsole";
    EDITOR = "code";
    SOPS_EDITOR = "nano";
    NIXOS_OZONE_WL = "1";
  };

  home.sessionPath = ["${config.home.homeDirectory}/.npm-global/bin"];

  # --- Autostart ---
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

  # --- npm ---
  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm-global
    save-exact=true
    save-prefix=
  '';

  # --- Cleanup ---
  home.activation.cleanGtkConfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ${config.home.homeDirectory}/.gtkrc-2.0
    rm -f ${config.home.homeDirectory}/.gtkrc-2.0.backup
  '';
}
