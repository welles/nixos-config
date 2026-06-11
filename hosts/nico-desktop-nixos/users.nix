{
  pkgs,
  config,
  ...
}: {
  programs.zsh.enable = true;

  users.users.nico = {
    isNormalUser = true;
    home = "/home/nico";
    shell = pkgs.zsh;
    hashedPasswordFile = config.sops.secrets."user-password".path;
    extraGroups = ["wheel" "networkmanager"];
  };
}
