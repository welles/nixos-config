{sshSigningKey, ...}: {
  home-manager.sharedModules = [
    {
      programs.git = {
        settings.gpg.format = "ssh";
        signing = {
          key = sshSigningKey;
          signByDefault = true;
        };
      };
    }
  ];
}
