{
  userDescription ? (builtins.throw "hg.nix: set `_module.args.userDescription` to the user display name"),
  userEmail ? (builtins.throw "hg.nix: set `_module.args.userEmail` to the user email"),
  pkgs,
  ...
}: {
  programs.mercurial = {
    enable = true;
    package = pkgs.mercurial.withExtensions (pythonPackages: [
      pythonPackages.hg-evolve
    ]);
    userName = userDescription;
    inherit userEmail;
    extraConfig.extensions = {
      evolve = "";
      histedit = "";
      rebase = "";
      topic = "";
    };
  };
}
