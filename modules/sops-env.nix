{sopsAgeKeyFile, ...}: {
  home-manager.sharedModules = [
    {
      home.sessionVariables = {
        SOPS_EDITOR = "nano";
        SOPS_AGE_KEY_FILE = sopsAgeKeyFile;
      };
    }
  ];
}
