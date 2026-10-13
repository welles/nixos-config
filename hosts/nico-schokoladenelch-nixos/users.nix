{
  config,
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
    };

    groups.cloudflared = {};
  };
}
