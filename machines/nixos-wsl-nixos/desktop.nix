{pkgs, lib, ...}: {
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xrdp = {
    enable = true;
    defaultWindowManager = "${pkgs.kdePackages.plasma-workspace}/bin/startplasma-x11";
    openFirewall = true;
  };

  # Override xrdp-sesman PAM: the default `login` chain pulls in modules (pam_loginuid etc.) that fail under the WSL kernel
  security.pam.services.xrdp-sesman.text = lib.mkForce ''
    auth     required    pam_unix.so nodelay
    account  required    pam_unix.so
    password required    pam_unix.so
    session  required    pam_unix.so
  '';
}
