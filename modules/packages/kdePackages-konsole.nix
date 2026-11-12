{
  config,
  pkgs,
  ...
}: let
  cinnamonEnabled = config.services.xserver.desktopManager.cinnamon.enable;
in {
  imports = [./nerd-fonts-fira-code.nix];

  environment.systemPackages = [pkgs.kdePackages.konsole];

  home-manager.sharedModules = [
    ({
      config,
      lib,
      ...
    }: {
      home.sessionVariables.TERMINAL = "konsole";

      # Cinnamon's built-in terminal shortcut launches its default terminal.
      dconf.settings = lib.mkIf cinnamonEnabled {
        "org/cinnamon/desktop/applications/terminal" = {
          exec = "${pkgs.kdePackages.konsole}/bin/konsole";
          exec-arg = "-e";
        };
        "org/cinnamon/desktop/keybindings/media-keys".terminal = ["<Primary><Alt>t"];
      };

      programs.konsole = {
        enable = true;
        profiles.default = {
          name = "Default";
          font = {
            name = "FiraCode Nerd Font";
            size = 10;
          };
          extraConfig = {
            Appearance.EnableLigatures = true;
            General.LocalTabTitleFormat = "%w";
          };
        };
        defaultProfile = "Default";
      };

      # `programs.konsole` delegates konsolerc management to plasma-manager.
      # On hosts without Home Manager's Plasma module (such as WSL), write the
      # default profile selection directly instead.
      xdg.configFile."konsolerc" = lib.mkIf (!config.programs.plasma.enable) {
        text = lib.generators.toINI {} {
          "Desktop Entry".DefaultProfile = "Default.profile";
        };
      };
    })
  ];
}
