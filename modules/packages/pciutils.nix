{pkgs, ...}: {
  environment.systemPackages = [pkgs.pciutils];
}
