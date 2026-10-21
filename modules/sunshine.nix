# Sunshine Game Streaming
#
# Streaming host for Moonlight clients. Not started automatically, start it
# with `systemctl --user start sunshine` when needed. capSysAdmin is needed
# for KMS screen capture under Wayland.
_: {
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };
}
