_: {
  home-manager.sharedModules = [
    {
      programs.eza = {
        enable = true;
        enableZshIntegration = true;
        icons = "auto";
        git = true;
      };
    }
  ];
}
