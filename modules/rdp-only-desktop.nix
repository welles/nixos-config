# No local login screen: the desktop is only used over RDP (xrdp.nix), and a
# greeter would only render on a console nobody looks at. NixOS would fall
# back to LightDM, and graphical.target wants the display manager whatever
# services.xserver.autorun says, so its unit goes away; the console gets the
# text login on tty1 that NixOS reserves for the display manager otherwise.
_: {
  systemd = {
    services.display-manager.enable = false;
    targets.getty.wants = ["autovt@tty1.service"];
  };
}
