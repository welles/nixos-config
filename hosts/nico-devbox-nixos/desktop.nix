# Cinnamon Desktop over RDP
#
# xrdp starts a Cinnamon session per RDP login (port 3389). LightDM only
# serves the local SPICE console (virt-manager); without autologin, as a
# user can't be logged in locally and over RDP at the same time. Sound over
# RDP needs PulseAudio, the xrdp module doesn't support PipeWire yet.
{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.cinnamon.enable = true;
    };

    xrdp = {
      enable = true;
      openFirewall = true;
      # Software-rendering variant of Cinnamon, as there is no GPU in the VM
      # and xrdp's X server has no OpenGL acceleration anyway
      defaultWindowManager = "${pkgs.cinnamon}/bin/cinnamon-session-cinnamon2d";
      audio.enable = true;
      # Persisted (impermanence.nix) instead of /etc/xrdp on the ephemeral root
      sslCert = "/var/lib/xrdp/cert.pem";
      sslKey = "/var/lib/xrdp/key.pem";
    };

    pulseaudio.enable = true;
    pipewire.enable = false;
  };
}
