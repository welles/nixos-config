{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.kdiff3];

  # Match this repo's standard UI/fixed-width fonts (see fira-sans.nix,
  # fira-code-nerd-font.nix) so they're available even on hosts that don't
  # otherwise install them, since kdiff3rc below references them by name.
  fonts.packages = [pkgs.fira-sans pkgs.nerd-fonts.fira-code];

  home-manager.sharedModules = [
    {
      programs.git.settings = {
        diff.tool = "kdiff3";
        merge.tool = "kdiff3";
      };

      # KDiff3's diff/merge panes and fonts are set via its own fixed
      # preferences (independent of the Qt style/palette that themes the
      # window chrome and menus), defaulting to a white background and the
      # system font. Set a dark-friendly palette and this repo's standard
      # fonts here instead.
      xdg.configFile."kdiff3rc".text = lib.generators.toINI {} {
        "KDiff3 Options" = {
          FgColor = "220,220,220";
          BgColor = "35,38,41";
          DiffBgColor = "60,64,67";
          ColorA = "100,160,255";
          ColorB = "130,220,130";
          ColorC = "220,130,220";
          ColorForConflict = "255,110,110";
          CurrentRangeBgColor = "90,90,40";
          CurrentRangeDiffBgColor = "120,120,50";
          MissingFileColor = "220,220,220";
          ApplicationFont = "Fira Sans,10";
          Font = "FiraCode Nerd Font,10";
        };
      };
    }
  ];
}
