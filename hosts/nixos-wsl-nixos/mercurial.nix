_: {
  home-manager.sharedModules = [
    {
      programs.mercurial.extraConfig.auth = {
        "mentz.prefix" = "https://source.mentz.net/repo/";
        "mentz.username" = "welles";
        "mentz.schemes" = "https";
      };
    }
  ];
}
