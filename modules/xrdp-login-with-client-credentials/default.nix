# xrdp logs in with the credentials the RDP client sent, even when the client
# doesn't request auto logon (xrdp.nix)
#
# xrdp only skips its own login screen if the client sets INFO_AUTOLOGON.
# Cloudflare's browser-based RDP asks for the user and password itself and
# sends them, but without that flag (it would pass them via NLA, which xrdp
# doesn't support), so the login screen asked for them a second time. With
# this patch xrdp logs in with any user and non-empty password the client
# sent. sesman checks the password with PAM as for every other login; a wrong
# one ends at the login screen as before.
{
  xrdpPatches = [./autologon-without-flag.patch];

  imports = [../xrdp.nix];
}
