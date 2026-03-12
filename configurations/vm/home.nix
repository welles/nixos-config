# VM Home Manager Configuration
#
# Minimal setup — imports the shared shell module for Zsh + fastfetch.
{...}: {
  imports = [
    ../../modules/home/shell.nix
  ];

  home.keyboard = null;
}
