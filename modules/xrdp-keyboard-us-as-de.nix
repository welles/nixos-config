# German keyboard layout for RDP clients that report a US one (xrdp.nix)
#
# xrdp sets the session's keyboard layout from the layout the RDP client
# reports. Cloudflare's browser-based RDP always reports US, whatever the
# browser's keyboard, so the desktop typed as US. This maps the US layout to
# the German one; clients that report German (mstsc, FreeRDP on a German
# system) get it as before. A real US keyboard over RDP then types German.
{
  imports = [./xrdp.nix];

  xrdpConfDirCommands = ''
    substituteInPlace $out/xrdp_keyboard.ini \
      --replace-fail $'\nrdp_layout_us=us\n' $'\nrdp_layout_us=de\n'
  '';
}
