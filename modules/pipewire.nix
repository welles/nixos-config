# Shared PipeWire Audio Configuration
#
# Enables PipeWire as the audio server with ALSA and PulseAudio
# compatibility layers, including 32-bit support for gaming.
# Enables rtkit for real-time audio scheduling priority.
_: {
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.min-quantum" = 1024;
      };
    };
  };

  security.rtkit.enable = true;
}
