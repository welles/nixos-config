# VM Home Manager Configuration
#
# Minimal shell setup with Zsh, fastfetch, and Oh-my-zsh.
{pkgs, ...}: {
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

  programs.home-manager.enable = true;
  home.keyboard = null;
}
