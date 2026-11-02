# Plasma never locks the screen on its own; locking stays possible by hand.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.kscreenlocker.autoLock = false;
    }
  ];
}
