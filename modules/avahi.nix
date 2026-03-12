# Shared Avahi / mDNS Configuration
#
# Enables Avahi for mDNS/DNS-SD network discovery. Used for automatic
# printer discovery, Chromecast detection, and .local hostname
# resolution. Opens the firewall for mDNS traffic.
{...}: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
