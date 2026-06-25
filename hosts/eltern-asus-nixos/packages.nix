{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox
    jellyfin-desktop
    google-chrome
  ];
}
