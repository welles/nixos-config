{
  user,
  userDescription,
  ...
}: {
  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = userDescription;
    extraGroups = ["wheel" "libvirtd"];
  };
}
