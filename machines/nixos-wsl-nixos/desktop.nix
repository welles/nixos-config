{pkgs, ...}: {
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xrdp = {
    enable = true;
    defaultWindowManager = "${pkgs.kdePackages.plasma-workspace}/bin/startplasma-x11";
    openFirewall = true;
  };
}
