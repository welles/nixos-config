# Caddy HTTPS reverse proxy. Certificates are requested for `acmeEmail` and
# kept in /var/lib/caddy.
{
  lib,
  persistRoot,
  acmeEmail,
  ...
}: {
  services.caddy = {
    enable = true;
    email = acmeEmail;
  };

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = ["/var/lib/caddy"];
  };
}
