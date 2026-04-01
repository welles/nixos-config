# Schokoladenelch Home Manager Configuration
#
# Server user environment. Imports shared shell, CLI tools, and Git
# modules. Extends Git with a safe directory for the stacks repo,
# and stores Zsh history on the persistent ZFS dataset so it
# survives the ephemeral root rollback.
{config, ...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/cli-tools.nix
    ../../modules/home/git.nix
  ];

  # Allow git operations in the stacks directory owned by root
  programs.git.settings.safe.directory = "/mnt/bucket/stacks";

  # Store Zsh history on the persistent dataset
  programs.zsh.history.path = "${config.home.homeDirectory}/.local/share/zsh/history";
}
