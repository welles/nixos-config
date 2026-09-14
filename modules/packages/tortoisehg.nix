{pkgs, ...}: {
  environment.systemPackages = [
    # tortoisehg shells out to `hg` for most operations, and pulls in its own
    # plain Mercurial dependency rather than the hg-evolve/topic-enabled one
    # from hg.nix. Without this, the `hg` it spawns can't load the
    # `evolve`/`topic` extensions enabled in hgrc.
    #
    # `mercurial.withExtensions` (used in hg.nix) can't be used here: it
    # produces a plain bin/ symlink forest rather than a proper importable
    # Python package, which breaks tortoisehg's own build (it needs to
    # `import mercurial` while compiling its i18n files). Instead, add
    # hg-evolve directly to Mercurial's own propagated dependencies so it
    # stays a normal buildPythonApplication package.
    (pkgs.tortoisehg.override {
      mercurial = pkgs.mercurial.overridePythonAttrs (old: {
        propagatedBuildInputs = (old.propagatedBuildInputs or []) ++ [pkgs.python3Packages.hg-evolve];
      });
    })
  ];
}
