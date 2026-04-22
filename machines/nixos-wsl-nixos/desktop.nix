{pkgs, ...}: {
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;

    xrdp = {
      enable = true;
      defaultWindowManager = "${pkgs.kdePackages.plasma-workspace}/bin/startplasma-x11";
      openFirewall = true;
    };
  };
}
