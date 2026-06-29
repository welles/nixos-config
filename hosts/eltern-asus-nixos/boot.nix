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
