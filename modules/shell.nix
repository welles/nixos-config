# Shared Shell Configuration (NixOS + Home Manager)
#
# Enables ZSH system-wide, sets it as the login shell for the host user,
# and configures it for all home-manager users: Oh-my-zsh with
# autosuggestions, syntax highlighting, completion, and fastfetch
# greeting on new shells. Zsh history is stored under XDG state
# (.local/share/zsh) so it survives an impermanent root.
{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  programs.zsh.enable = true;

  users.users.${user}.shell = pkgs.zsh;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/zsh"];
  };

  home-manager.sharedModules = [
    ({config, ...}: {
      programs.fastfetch.enable = true;

      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        # Only greet a terminal. Apps such as Claude Desktop or VS Code run
        # `zsh -l -i -c env` with a pipe as stdout to read the login
        # environment; fastfetch there runs `plasmashell --version` (to show
        # the Plasma version), which aborts without a display connection
        # and pops up a crash report.
        initContent = ''
          [[ -t 1 ]] && fastfetch
        '';

        history.path = "${config.home.homeDirectory}/.local/share/zsh/history";

        oh-my-zsh = {
          enable = true;
        };
      };
    })
  ];
}
