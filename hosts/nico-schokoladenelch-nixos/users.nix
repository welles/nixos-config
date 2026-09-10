{
  config,
  user,
  ...
}: {
  users = {
    users = {
      root = {
        hashedPasswordFile = config.sops.secrets."root-password".path;
      };

      cloudflared = {
        group = "cloudflared";
        isSystemUser = true;
      };

      ${user}.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
      ];
    };

    groups.cloudflared = {};
  };
}
