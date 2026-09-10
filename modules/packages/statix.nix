{pkgs, ...}: {
  environment.systemPackages = [pkgs.statix];
}
