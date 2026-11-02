# Plasma UI and fixed-width fonts (Fira Sans, FiraCode Nerd Font).
_: {
  imports = [
    ./packages/fira-sans.nix
    ./packages/nerd-fonts-fira-code.nix
  ];

  home-manager.sharedModules = [
    {
      programs.plasma.fonts = {
        general = {
          family = "Fira Sans";
          pointSize = 10;
        };
        small = {
          family = "Fira Sans";
          pointSize = 10;
        };
        toolbar = {
          family = "Fira Sans";
          pointSize = 10;
        };
        menu = {
          family = "Fira Sans";
          pointSize = 10;
        };
        windowTitle = {
          family = "Fira Sans";
          pointSize = 10;
        };
        fixedWidth = {
          family = "FiraCode Nerd Font";
          pointSize = 10;
        };
      };
    }
  ];
}
