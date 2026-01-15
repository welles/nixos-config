{pkgs, ...}: {
  home.username = "vm";
  home.homeDirectory = "/home/vm";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
