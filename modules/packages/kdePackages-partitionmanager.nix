{pkgs, ...}: {
  environment.systemPackages = [pkgs.kdePackages.partitionmanager];
}
