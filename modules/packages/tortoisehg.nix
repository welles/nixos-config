{pkgs, ...}: {
  environment.systemPackages = [
    # tortoisehg shells out to `hg` for most operations, and pulls in its own
    # plain Mercurial dependency rather than the hg-evolve/topic-enabled one
    # from hg.nix. Without this, the `hg` it spawns can't load the
    # `evolve`/`topic`/`mercurial_keyring` extensions enabled in hgrc.
    #
    # `mercurial.withExtensions` (used in hg.nix) can't be used here: it
    # produces a plain bin/ symlink forest rather than a proper importable
    # Python package, which breaks tortoisehg's own build (it needs to
    # `import mercurial` while compiling its i18n files). Instead, add
    # the extensions directly to Mercurial's own propagated dependencies so it
    # stays a normal buildPythonApplication package.
    ((pkgs.tortoisehg.override {
        mercurial = pkgs.mercurial.overridePythonAttrs (old: {
          propagatedBuildInputs =
            (old.propagatedBuildInputs or [])
            ++ [
              pkgs.python3Packages.hg-evolve
              (pkgs.python3Packages.callPackage ./mercurial-keyring/mercurial-keyring.nix {})
            ];
        });
      })
      .overridePythonAttrs (old: {
        # The output console (and the other command output logs) hardcode
        # light colors that `[thg-color]` below can't override: the
        # background of echoed command lines (the `control` label, which is
        # skipped by the override since it has no `.` in its name), the
        # prompt line background, and the text flash on invalid input. Its
        # caret also keeps Scintilla's default black, which is invisible on
        # a dark background. Swap in dark-friendly colors and make the caret
        # follow the (palette-derived) text color.
        postPatch =
          (old.postPatch or "")
          + ''
            substituteInPlace tortoisehg/hgqt/qtlib.py \
              --replace-fail "'control': 'black bold #dddddd_background'" \
                             "'control': '#dcdcdc bold #3c4043_background'"
            substituteInPlace tortoisehg/hgqt/docklog.py \
              --replace-fail "QColor('#e8f3fe')" "QColor('#1f3048')" \
              --replace-fail "def flash(self, color='brown')" \
                             "def flash(self, color='#ffc88a')"
            substituteInPlace tortoisehg/hgqt/cmdui.py \
              --replace-fail "self.setMarginWidth(1, 0)" \
                             "self.setMarginWidth(1, 0); self.setCaretForegroundColor(self.color())"
          '';
      }))
  ];

  # Match this repo's standard fixed-width font (see fira-code-nerd-font.nix)
  # so it's available even on hosts that don't otherwise install it, since
  # the hgrc settings below reference it by name.
  fonts.packages = [pkgs.nerd-fonts.fira-code];

  home-manager.sharedModules = [
    {
      # TortoiseHg follows the Qt palette for its text views, but its
      # revision badges (branch, tag, bookmark, ...), file status colors and
      # console messages use fixed light colors meant for a white background.
      # Override them with dark-friendly ones (matching kdiff3.nix) in
      # `[thg-color]`, which only TortoiseHg reads, so `hg`'s own terminal
      # colors stay untouched. The foreground color must come before the
      # `_background` one, since TortoiseHg takes the first color it finds as
      # the text color. This only takes effect where hg.nix enables
      # `programs.mercurial`.
      programs.mercurial.extraConfig = {
        tortoisehg = {
          fontcomment = "FiraCode Nerd Font,10";
          fontdiff = "FiraCode Nerd Font,10";
          fonteditor = "FiraCode Nerd Font,10";
          fontlog = "FiraCode Nerd Font,10";
          fontoutputlog = "FiraCode Nerd Font,10";
        };
        thg-color = {
          "log.branch" = "#a6e3a1 #1f3a24_background";
          "log.patch" = "#9cc9ff #1f3048_background";
          "log.unapplied_patch" = "#c8c8c8 #3a3d40_background";
          "log.tag" = "#f0e08a #45401c_background";
          "log.bookmark" = "#8ab4ff #45401c_background";
          "log.curbookmark" = "#ffd580 #5a4414_background";
          "log.modified" = "#ffc88a #4a3418_background";
          "log.added" = "#a6e3a1 #1f3a24_background";
          "log.removed" = "#ff9a9a #4a2020_background";
          "log.warning" = "#ff9a9a #4a2020_background";
          "log.topic" = "#b8f5cc bold #1d5a36_background";
          "topic.active" = "#b8f5cc bold #1d5a36_background";
          "ui.error" = "#ff8080 bold #4a2020_background";
          "ui.warning" = "#f0e08a bold #45401c_background";
          "status.clean" = "#dcdcdc";
          "status.modified" = "#64a0ff bold";
          "status.added" = "#82dc82 bold";
          "status.removed" = "#ff6e6e bold";
          "status.deleted" = "#50d0d0 bold underline";
          "status.unknown" = "#dc82dc bold underline";
          "status.ignored" = "#a0a0a0 bold";
          "resolve.resolved" = "#82dc82";
          "resolve.unresolved" = "#ff6e6e";
          "diff.inserted" = "#82dc82";
          "diff.deleted" = "#ff6e6e";
          "diff.hunk" = "#dc82dc";
        };
      };
    }
  ];
}
