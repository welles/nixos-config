{pkgs, ...}: {
  programs.zsh.enable = true;

  users.users.nico = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "Nico";
    extraGroups = ["wheel" "libvirtd"];
    shell = pkgs.zsh;
  };
}
