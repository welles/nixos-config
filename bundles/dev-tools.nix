# Tools every development machine gets, whatever the stack. The browsers
# are also what Playwright drives.
{
  imports = [
    ../modules/npm.nix
    ../modules/packages/firefox-devedition.nix
    ../modules/packages/google-chrome.nix
    ../modules/packages/lazygit.nix
    ../modules/packages/nodejs.nix
    ../modules/packages/vscode.nix
  ];
}
