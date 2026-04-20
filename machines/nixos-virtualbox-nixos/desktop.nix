# XFCE Desktop Environment
#
# Lightweight desktop for VirtualBox development VM.
# Auto-login enabled since this is a non-production VM.
# XFCE configuration regenerates from defaults on each boot (declarative).
{user, ...}: {
  services = {
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.xfce.enable = true;
    };

    displayManager.autoLogin = {
      enable = true;
      inherit user;
    };
  };
}
