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
      (pythonPackages.callPackage ./mercurial-keyring/mercurial-keyring.nix {})
    ]);
    userName = userDescription;
    inherit userEmail;
    extraConfig.extensions = {
      absorb = "";
      evolve = "";
      histedit = "";
      mercurial_keyring = "";
      mq = "";
      purge = "";
      rebase = "";
      shelve = "";
      strip = "";
      topic = "";
    };
  };
}
