{pkgs, ...}: {
  environment.systemPackages = [pkgs.xfsprogs];
}
