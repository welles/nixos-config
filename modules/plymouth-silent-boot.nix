# Silent Boot with Plymouth
#
# Boots straight into a Plymouth splash ("rings" theme) without the GRUB menu
# (timeout 0) and without kernel, systemd or udev messages, for hosts used by
# people who shouldn't see any of that.
#
# Uses GRUB on EFI; hold Shift (or press Esc) during boot for the menu.
{pkgs, ...}: {
  boot = {
    loader = {
      timeout = 0;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };
    kernelParams = [
      "splash"
      "quiet"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    initrd.verbose = false;
    consoleLogLevel = 0;
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = ["rings"];
        })
      ];
    };
  };
}
