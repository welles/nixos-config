{pkgs, ...}: {
  home.username = "eltern";
  home.homeDirectory = "/home/eltern";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
