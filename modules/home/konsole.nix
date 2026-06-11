_: {
  home.sessionVariables.TERMINAL = "konsole";

  programs.konsole = {
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
}
