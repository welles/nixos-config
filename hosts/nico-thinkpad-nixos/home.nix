{...}: {
  imports = [
    ../../modules/home/nico-laptop-plasma.nix
    ../../modules/home/shell.nix
    ../../modules/home/cli-tools.nix
    ../../modules/home/git.nix
    ../../modules/home/git-signing.nix
    ../../modules/home/npm.nix
    ../../modules/home/kde-theming.nix
    ../../modules/home/konsole.nix
    ../../modules/home/bitwarden-autostart.nix
    ../../modules/home/sops-env.nix
    ../../modules/home/xdg-user-dirs.nix
    ../../modules/home/lazygit.nix
  ];
}
