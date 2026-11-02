# The user's login password from the sops secret user-password, stored as a
# hash (as for hashedPasswordFile). The host provides the value in its sops
# file and passes `passwordConfig = {};`. For a plaintext password that other
# modules can use too, see user-password-plaintext.nix instead.
{
  config,
  user,
  ...
}: {
  sops.secrets."user-password".neededForUsers = true;

  users.users.${user}.hashedPasswordFile = config.sops.secrets."user-password".path;
}
