{user, ...}: {
  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "Nico";
    extraGroups = ["wheel" "libvirtd"];
  };
}
