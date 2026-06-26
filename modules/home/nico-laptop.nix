{...}: {
  imports = [
    ./nico-laptop-plasma.nix
    ./shell.nix
    ./cli-tools.nix
    ./git.nix
    ./git-signing.nix
    ./npm.nix
    ./kde-theming.nix
    ./konsole.nix
    ./1password-ssh-agent.nix
    ./1password-autostart.nix
    ./sops-env.nix
    ./xdg-user-dirs.nix
    ./lazygit.nix
  ];
}
