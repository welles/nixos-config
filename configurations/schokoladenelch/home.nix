{
  pkgs,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "Nico Welles";
      user.email = "nico@welles.email";
      init.defaultBranch = "main";
      pull.rebase = true;
      safe.directory = "/mnt/bucket/stacks";
    };
  };

  programs.fastfetch.enable = true;

  programs.starship.enable = true;

  programs.btop.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.path = "${config.home.homeDirectory}/.local/share/zsh/history";

    initContent = "fastfetch";

    oh-my-zsh = {
      enable = true;
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

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

  programs.home-manager.enable = true;
}
