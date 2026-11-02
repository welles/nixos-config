# Kernel console on the first serial port (115200 baud) in addition to the
# screen, e.g. for `virsh console <domain>` when neither SSH nor RDP work.
_: {
  boot.kernelParams = [
    "console=ttyS0,115200"
    "console=tty0"
  ];
}
