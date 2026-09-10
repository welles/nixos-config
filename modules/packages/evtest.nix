{pkgs, ...}: {
  environment.systemPackages = [pkgs.evtest];
}
