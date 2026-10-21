# Desktop over RDP
#
# xrdp starts a desktop session (`xrdpSession`) per RDP login on port 3389,
# with sound. Sound over RDP needs PulseAudio, the xrdp module doesn't
# support PipeWire yet. A user can't be logged in locally and over RDP at the
# same time, so don't combine this with autologin.nix.
#
# The TLS certificate lives in /var/lib/xrdp instead of /etc/xrdp and is
# persisted on impermanence hosts, so RDP clients keep trusting it.
{
  lib,
  persistRoot,
  xrdpSession,
  ...
}: {
  services = {
    xrdp = {
      enable = true;
      openFirewall = true;
      defaultWindowManager = xrdpSession;
      audio.enable = true;
      sslCert = "/var/lib/xrdp/cert.pem";
      sslKey = "/var/lib/xrdp/key.pem";
    };

    pulseaudio.enable = true;
    pipewire.enable = false;
  };

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = ["/var/lib/xrdp"];
  };
}
