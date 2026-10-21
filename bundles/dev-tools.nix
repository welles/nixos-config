# Tools every development machine gets, whatever the stack.
{
  imports = [
    ../modules/npm.nix
    ../modules/packages/lazygit.nix
    ../modules/packages/nodejs.nix
    ../modules/packages/vscode.nix
  ];
}
