# Desktop over RDP
#
# xrdp starts a desktop session (`xrdpSession`) per RDP login on port 3389.
# A user can't be logged in locally and over RDP at the same time, so don't
# combine this with autologin.nix. Sound over RDP: xrdp-audio.nix.
#
# The TLS certificate lives in /var/lib/xrdp instead of /etc/xrdp and is
# persisted on impermanence hosts, so RDP clients keep trusting it.
{
  lib,
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

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = ["/var/lib/xrdp"];
  };
}
