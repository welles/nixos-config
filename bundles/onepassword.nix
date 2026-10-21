# 1Password with its SSH agent, which also signs Git commits.
{
  imports = [
    ../modules/1password-autostart.nix
    ../modules/1password-ssh-agent.nix
    ../modules/git-signing.nix
    ../modules/packages/_1password-gui.nix
  ];
}
