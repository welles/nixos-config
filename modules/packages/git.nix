{
  userDescription ? (builtins.throw "git.nix: set `_module.args.userDescription` to the user display name"),
  userEmail ? (builtins.throw "git.nix: set `_module.args.userEmail` to the user email"),
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
