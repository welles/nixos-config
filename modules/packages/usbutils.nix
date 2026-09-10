{pkgs, ...}: {
  environment.systemPackages = [pkgs.usbutils];
}
