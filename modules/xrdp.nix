# Desktop over RDP
#
# xrdp starts a desktop session (`xrdpSession`) per RDP login on port 3389.
# A user can't be logged in locally and over RDP at the same time, so don't
# combine this with autologin.nix. Sound over RDP: xrdp-audio.nix.
#
# The TLS certificate lives in /var/lib/xrdp instead of /etc/xrdp and is
# persisted on impermanence hosts, so RDP clients keep trusting it.
#
# The RDP login unlocks the GNOME keyring with the login password (and creates
# it with that password if it doesn't exist yet). A keyring created earlier
# with a different password has to be changed to the login password once
# (Seahorse) or deleted (~/.local/share/keyrings).
#
# Each RDP connection brings its own monitor, which the desktop registers with
# colord. polkit only allows that without a password in an active local
# session, which an RDP session isn't, so every connection asked for the
# password ("Legitimierung ist zur Erstellung eines farbverwalteten Geräts
# notwendig"). The user may manage colord devices and profiles without it.
{
  lib,
  user,
  persistRoot,
  xrdpSession,
  ...
}: {
  services.xrdp = {
    enable = true;
    openFirewall = true;
    defaultWindowManager = xrdpSession;
    sslCert = "/var/lib/xrdp/cert.pem";
    sslKey = "/var/lib/xrdp/key.pem";
  };

  security.pam.services.xrdp-sesman.enableGnomeKeyring = true;

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id.indexOf("org.freedesktop.color-manager.") == 0 &&
          subject.user == "${user}") {
        return polkit.Result.YES;
      }
    });
  '';

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = ["/var/lib/xrdp"];
  };
}
