{pkgs, ...}: {
  environment.systemPackages = [pkgs.ssh-to-age];
}
