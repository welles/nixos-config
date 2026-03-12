# Shared PipeWire Audio Configuration
#
# Enables PipeWire as the audio server with ALSA and PulseAudio
# compatibility layers, including 32-bit support for gaming.
# Enables rtkit for real-time audio scheduling priority.
{...}: {
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;
}
