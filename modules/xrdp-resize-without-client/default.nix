# Programs in an xrdp session may resize its screen while no RDP client is
# connected (xrdp.nix)
#
# xorgxrdp only changes the screen size for the RDP client and refuses
# RandR requests from programs, so KasmVNC's kasmxproxy couldn't fit the
# session to the browser window (kasmvnc-xrdp-mirror.nix). With this patch
# it allows them while no RDP client is connected, and sets its single
# output to the new size; a connected RDP client still keeps its size, and
# a later RDP login sets the screen to the client's size as before.
{
  xorgxrdpOverrides = [
    (old: {
      patches = (old.patches or []) ++ [./resize-without-client.patch];
    })
  ];

  imports = [../xrdp.nix];
}
