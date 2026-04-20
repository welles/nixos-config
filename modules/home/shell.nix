# Shared Shell Configuration (Home Manager)
#
# Base Zsh setup shared across all user profiles: Oh-my-zsh with
# autosuggestions, syntax highlighting, completion, and fastfetch
# greeting on new shells.
_: {
  programs.fastfetch.enable = true;

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
}
