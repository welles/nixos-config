{pkgs, ...}: {
  environment.systemPackages = [pkgs.kdiff3];

  home-manager.sharedModules = [
    {
      programs.git.settings = {
        diff.tool = "kdiff3";
        merge.tool = "kdiff3";
      };
    }
  ];
}
