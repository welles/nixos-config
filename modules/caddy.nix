# Caddy HTTPS reverse proxy on ports 80 and 443 (TCP, and UDP for HTTP/3).
# Certificates are requested for `acmeEmail` and kept in /var/lib/caddy.
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

  networking.firewall = {
    allowedTCPPorts = [
      80 # HTTP
      443 # HTTPS
    ];
    allowedUDPPorts = [
      443 # HTTP/3
    ];
  };

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = ["/var/lib/caddy"];
  };
}
