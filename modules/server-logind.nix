# logind settings for a server
_: {
  services.logind.settings.Login = {
    # Keep user processes alive after logout (for tmux sessions)
    KillUserProcesses = false;
    # Shut down on power button press (allows clean shutdown of an
    # unresponsive server)
    HandlePowerKey = "poweroff";
  };
}
