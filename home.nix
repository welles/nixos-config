{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nico";
  home.homeDirectory = "/home/nico";

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "Nico welles";
      user.email = "nico@welles.email";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
    };
  };

  programs.kitty = {
    enable = true;
    themeFile = "OneHalfDark";
    settings = {
      font_size = 12;
      confirm_os_window_close = 0;
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
