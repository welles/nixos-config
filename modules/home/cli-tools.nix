# Shared CLI Tools (Home Manager)
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

    btop.enable = true;
  };
}
