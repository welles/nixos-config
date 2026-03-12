# Audio Configuration
#
# Imports the shared PipeWire module and adds a low-latency profile
# to reduce audio delay for desktop use.
{...}: {
  imports = [
    ../../hardware/pipewire.nix
  ];

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.min-quantum" = 1024;
    };
  };
}
