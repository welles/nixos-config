{sopsAgeKeyFile, ...}: {
  home-manager.sharedModules = [
    {
      home.sessionVariables = {
        EDITOR = "code";
        SOPS_EDITOR = "nano";
        SOPS_AGE_KEY_FILE = sopsAgeKeyFile;
      };
    }
  ];
}
