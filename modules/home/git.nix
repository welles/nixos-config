# Shared Git Configuration (Home Manager)
#
# Base Git settings used by all profiles: user identity, LFS support,
# rebase-on-pull, and "main" as default branch. Individual profiles
# can extend this with extra settings (e.g. SSH signing, safe dirs).
_: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "Nico Welles";
      user.email = "nico@welles.email";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
