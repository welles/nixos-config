{sshSigningKey, ...}: {
  programs.git = {
    settings.gpg.format = "ssh";
    signing = {
      key = sshSigningKey;
      signByDefault = true;
    };
  };
}
