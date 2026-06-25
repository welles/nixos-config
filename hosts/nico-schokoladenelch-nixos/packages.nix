{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bottom
    ctop
    httm
    iotop
    lazydocker
    lazygit
    smartmontools
    sops
    ssh-to-age
    systemctl-tui
  ];
}
