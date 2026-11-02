# Plasma logs out, restarts and shuts down without asking for confirmation.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.session.general.askForConfirmationOnLogout = false;
    }
  ];
}
