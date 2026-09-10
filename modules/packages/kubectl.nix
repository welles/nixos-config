{pkgs, ...}: {
  environment.systemPackages = [pkgs.kubectl];
}
