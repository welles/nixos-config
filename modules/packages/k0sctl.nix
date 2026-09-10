{pkgs, ...}: {
  environment.systemPackages = [pkgs.k0sctl];
}
