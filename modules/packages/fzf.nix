_: {
  home-manager.sharedModules = [
    {
      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
      };
    }
  ];
}
