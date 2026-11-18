# Debug log of the xrdp daemon in the journal (xrdp.nix)
#
# nixpkgs sends xrdp's log to /dev/null. This writes it to the console at
# debug level instead, which systemd puts in the journal:
#
#   journalctl -u xrdp -b
#
# The debug level shows what the RDP client sent at the login (e.g. "Client
# requested auto logon."), not the password. Meant for troubleshooting, not
# to stay imported.
{
  xrdpConfDirCommands = ''
    substituteInPlace $out/xrdp.ini \
      --replace-fail '#EnableConsole=false' 'EnableConsole=true' \
      --replace-fail '#ConsoleLevel=INFO' 'ConsoleLevel=DEBUG' \
      --replace-fail 'LogLevel=INFO' 'LogLevel=DEBUG'
  '';

  imports = [./xrdp.nix];
}
