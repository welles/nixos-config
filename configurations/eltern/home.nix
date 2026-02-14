{pkgs, ...}: {
  home.username = "eltern";
  home.homeDirectory = "/home/eltern";

  programs.home-manager.enable = true;
}
