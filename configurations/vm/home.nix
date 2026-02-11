{pkgs, ...}: {
  home.username = "vm";
  home.homeDirectory = "/home/vm";

  programs.fastfetch = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = "fastfetch";

    oh-my-zsh = {
      enable = true;
    };
  };

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  home.keyboard = null;
}
