# Shared CLI Tools (Home Manager)
#
# Common command-line utilities used across desktop and server profiles:
# eza (ls replacement with git integration), fzf (fuzzy finder),
# yazi (terminal file manager), btop (system monitor), and starship
# (cross-shell prompt).
_: {
  programs = {
    starship.enable = true;

    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "yy";
      settings.manager.show_hidden = true;
    };

    btop.enable = true;
  };
}
