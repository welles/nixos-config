{user, ...}: {
  imports = [../../modules/removable-media.nix];

  services.displayManager.autoLogin = {
    enable = true;
    inherit user;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
