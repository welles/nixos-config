{
  userDescription,
  userEmail,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = userDescription;
      user.email = userEmail;
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
    };
  };
}
