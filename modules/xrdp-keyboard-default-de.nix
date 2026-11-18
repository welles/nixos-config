# German keyboard layout for RDP clients that report US or no layout
# (xrdp.nix)
#
# xrdp sets the session's keyboard layout from the layout the RDP client
# reports, and falls back to US for a layout it doesn't know. Cloudflare's
# browser-based RDP reports none at all (0x00000000, see
# ~/.xorgxrdp.<display>.log), so the desktop typed as US. This maps both no
# layout and the US layout to the German one; clients that report German
# (mstsc, FreeRDP on a German system) get it as before. A real US keyboard
# over RDP then types German.
{
  xrdpConfDirCommands = ''
    substituteInPlace $out/xrdp_keyboard.ini \
      --replace-fail $'\nrdp_layout_us=0x00000409\n' $'\nrdp_layout_us=0x00000409\nrdp_layout_none=0x00000000\n' \
      --replace-fail $'\nrdp_layout_us=us\n' $'\nrdp_layout_us=de\nrdp_layout_none=de\n'
  '';

  imports = [./xrdp.nix];
}
