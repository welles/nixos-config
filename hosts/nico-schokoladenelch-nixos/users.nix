{config, ...}: {
  users.users.root.hashedPasswordFile = config.sops.secrets."root-password".path;
}
