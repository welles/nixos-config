{config, ...}: {
  users.users.nico = {
    isNormalUser = true;
    home = "/home/nico";
    hashedPasswordFile = config.sops.secrets."user-password".path;
    extraGroups = ["wheel" "networkmanager"];
  };
}
