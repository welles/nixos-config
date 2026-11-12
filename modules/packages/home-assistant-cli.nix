{pkgs, ...}: {
  environment.systemPackages = [pkgs.home-assistant-cli];
}
