{pkgs, ...}: {
  environment.systemPackages = [pkgs.kubeseal];
}
