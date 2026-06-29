{...}: {
  imports = [../../modules/removable-media.nix];

  services.displayManager.autoLogin = {
    enable = true;
    user = "nico";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
