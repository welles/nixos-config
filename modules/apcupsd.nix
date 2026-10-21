# Clean shutdown on UPS power loss (USB-connected APC UPS)
_: {
  services.apcupsd = {
    enable = true;
    configText = ''
      UPSTYPE usb
      UPSCABLE usb
      DEVICE
      NISIP 127.0.0.1

      # Deaktiviert den festen Zeit-Timer (0 = aus)
      TIMEOUT 0

      # Fährt herunter, wenn der Akku unter 25% fällt...
      BATTERYLEVEL 25

      # ...oder nur noch für 5 Minuten Restlaufzeit reicht
      MINUTES 5
    '';
  };
}
