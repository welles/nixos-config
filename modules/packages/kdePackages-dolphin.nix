{pkgs, ...}: {
  environment.systemPackages = [pkgs.kdePackages.dolphin];
}
