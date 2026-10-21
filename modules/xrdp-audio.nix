# Sound over RDP. Needs PulseAudio, the xrdp module doesn't support PipeWire
# yet.
_: {
  imports = [./xrdp.nix];

  services = {
    xrdp.audio.enable = true;
    pulseaudio.enable = true;
    pipewire.enable = false;
  };
}
