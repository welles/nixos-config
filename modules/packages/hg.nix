{
  userDescription,
  userEmail,
  pkgs,
  ...
}: {
  home-manager.sharedModules = [
    {
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
  ];
}
