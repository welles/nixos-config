# Shared Shell Configuration (NixOS + Home Manager)
#
# Enables ZSH system-wide, sets it as the login shell for the host user,
# and configures it for all home-manager users: Oh-my-zsh with
# autosuggestions, syntax highlighting, completion, and fastfetch
# greeting on new shells.
{
  lib,
  pkgs,
  user ? (builtins.throw "shell.nix: set `_module.args.user` to the shell username"),
  persistRoot ? null,
  ...
}: {
  programs.zsh.enable = true;

  users.users.${user}.shell = pkgs.zsh;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user} = {
      files = [".zsh_history"];
      directories = [".local/share/zsh"];
    };
  };

  home-manager.sharedModules = [
    {
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
  ];
}
