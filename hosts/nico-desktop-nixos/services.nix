{...}: {
  imports = [
    ../../modules/removable-media.nix
    ../../modules/autologin.nix
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
