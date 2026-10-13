# Cinnamon Desktop over RDP
#
# xrdp starts a Cinnamon session per RDP login (port 3389). LightDM only
# serves the local SPICE console (virt-manager); without autologin, as a
# user can't be logged in locally and over RDP at the same time. Sound over
# RDP needs PulseAudio, the xrdp module doesn't support PipeWire yet.
#
# xrdp's own X server takes the keyboard layout from the RDP client, not from
# services.xserver.xkb (keyboard.nix), so the session sets it again before
# Cinnamon starts, independent of the client.
{
  config,
  pkgs,
  ...
}: let
  rdpSession = pkgs.writeShellScript "xrdp-cinnamon-session" ''
    ${pkgs.setxkbmap}/bin/setxkbmap ${config.services.xserver.xkb.layout}
    exec ${pkgs.cinnamon}/bin/cinnamon-session-cinnamon2d
  '';
in {
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
      defaultWindowManager = "${rdpSession}";
      audio.enable = true;
      # Persisted (impermanence.nix) instead of /etc/xrdp on the ephemeral root
      sslCert = "/var/lib/xrdp/cert.pem";
      sslKey = "/var/lib/xrdp/key.pem";
    };

    pulseaudio.enable = true;
    pipewire.enable = false;
  };

  environment.systemPackages = [pkgs.firefox];
}
