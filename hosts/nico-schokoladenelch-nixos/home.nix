# Schokoladenelch Home Manager Configuration
#
# Server user environment. Imports shared shell, CLI tools, and Git
# modules. Extends Git with a safe directory for the stacks repo.
_: {
  imports = [
    ../../modules/cli-tools.nix
    ../../modules/git.nix
  ];
}
