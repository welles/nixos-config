# VM Home Manager Configuration
#
# Minimal setup — imports the shared shell module for Zsh + fastfetch.
{...}: {
  imports = [
    ../../packages/shell.nix
  ];

  home.keyboard = null;
}
