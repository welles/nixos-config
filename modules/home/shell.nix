# Shared Shell Configuration (NixOS + Home Manager)
#
# Enables ZSH system-wide, sets it as the login shell for the host user,
# and configures it for all home-manager users: Oh-my-zsh with
# autosuggestions, syntax highlighting, completion, and fastfetch
# greeting on new shells.
{
  pkgs,
  user ? (builtins.throw "shell.nix: set `_module.args.user` to the shell username"),
  ...
}: {
  programs.zsh.enable = true;

  users.users.${user}.shell = pkgs.zsh;

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
