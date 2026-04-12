# Shared CLI Tools (Home Manager)
#
# Common command-line utilities used across desktop and server profiles:
# eza (ls replacement with git integration), fzf (fuzzy finder),
# yazi (terminal file manager), btop (system monitor), and starship
# (cross-shell prompt).
{...}: {
  programs.starship.enable = true;

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings.manager.show_hidden = true;
  };

  programs.btop.enable = true;
}
