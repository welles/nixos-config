# root password from the sops secret root-password (a hash, as for
# hashedPasswordFile). The host provides the value in its sops file.
{config, ...}: {
  sops.secrets."root-password".neededForUsers = true;

  users.users.root.hashedPasswordFile = config.sops.secrets."root-password".path;
}
