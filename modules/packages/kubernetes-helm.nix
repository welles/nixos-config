{pkgs, ...}: {
  environment.systemPackages = [pkgs.kubernetes-helm];
}
