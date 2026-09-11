{
  userDescription ? (builtins.throw "hg.nix: set `_module.args.userDescription` to the user display name"),
  userEmail ? (builtins.throw "hg.nix: set `_module.args.userEmail` to the user email"),
  ...
}: {
  programs.mercurial = {
    enable = true;
    userName = userDescription;
    userEmail = userEmail;
  };
}
