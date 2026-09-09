{pkgs, ...}: {
  environment.systemPackages = [pkgs.kdePackages.konsole];
  fonts.packages = [pkgs.nerd-fonts.fira-code];

  home-manager.sharedModules = [
    ({
      config,
      lib,
      ...
    }: {
      home.sessionVariables.TERMINAL = "konsole";

      programs.konsole = {
        enable = true;
        profiles.default = {
          name = "Default";
          font = {
            name = "FiraCode Nerd Font";
            size = 11;
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
