# Audio Configuration
#
# Enables PipeWire as the audio server with ALSA and PulseAudio
# compatibility layers (including 32-bit support for gaming).
# Includes a low-latency profile to reduce audio delay.
{...}: {
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.min-quantum" = 1024;
    };
  };

  security.rtkit.enable = true;
}
