# Voice chain for the microphone, loaded as EasyEffects input preset on start:
# high-pass -> noise suppression -> compressor -> EQ -> limiter.
#
# Keys follow the preset JSON of EasyEffects 8 (`src/*_preset.cpp`); keys left
# out fall back to the plugin defaults. Applications should not process the
# signal a second time: disable noise suppression and automatic gain control
# in Discord, Steam and the browser.
let
  # The source pipeline is stereo; both channels get the same bands.
  eqBands = {
    # Less boominess / "mud".
    band0 = {
      type = "Bell";
      frequency = 300.0;
      gain = -2.0;
      q = 1.0;
    };
    # Presence, intelligibility.
    band1 = {
      type = "Bell";
      frequency = 4000.0;
      gain = 2.0;
      q = 1.0;
    };
  };
in {
  imports = [./packages/easyeffects.nix];

  home-manager.sharedModules = [
    {
      services.easyeffects = {
        preset.input = "voice-mic";

        extraPresets.voice-mic.input = {
          blocklist = [];
          plugins_order = [
            "filter#0"
            "deepfilternet#0"
            "compressor#0"
            "equalizer#0"
            "limiter#0"
          ];

          # Removes rumble, desk bumps and fan hum below the voice range.
          "filter#0" = {
            type = "High-pass";
            frequency = 80.0;
            slope = "x2"; # 24 dB/oct
          };

          # One noise suppressor only; stacking several (RNNoise, Speex,
          # DeepFilterNet) multiplies their artifacts. Limiting the
          # attenuation to 40 dB (default: unlimited) keeps the voice natural.
          "deepfilternet#0" = {
            attenuation-limit = 40.0;
          };

          # Even loudness without the pumping of an automatic gain control.
          "compressor#0" = {
            mode = "Downward";
            threshold = -20.0;
            ratio = 3.0;
            attack = 10.0;
            release = 120.0;
            makeup = 4.0;
          };

          "equalizer#0" = {
            mode = "IIR";
            num-bands = 2;
            split-channels = false;
            left = eqBands;
            right = eqBands;
          };

          # Catches peaks (laughing, shouting) before they clip.
          "limiter#0" = {
            threshold = -1.0;
          };
        };
      };
    }
  ];
}
