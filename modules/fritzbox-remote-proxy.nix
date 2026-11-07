# Remote access to a FRITZ!Box through Caddy
#
# For a FRITZ!Box behind another router, e.g. as a DECT/Smart Home base.
# MyFRITZ then only knows the box's private WAN address, so the FRITZ! apps
# can't reach it from outside under its myfritz.net name. This module serves
# the box's HTTPS remote access ("Internetzugriff über HTTPS", Internet >
# Freigaben) under its own domain on port 443, with a certificate from
# Let's Encrypt, so apps only need the plain domain as network address.
#
# `fritzboxRemoteProxy.domain` is kept on this host's public IP by Cloudflare
# DDNS. `fritzboxRemoteProxy.upstream` is the box's address and HTTPS port
# ("host:port"). The router must let this host reach that port. The box's
# certificate is self-signed: Caddy trusts only `fritzboxRemoteProxy.certificate`
# (the box's certificate as PEM file) and checks it for the name `fritz.box`,
# which every FRITZ!Box certificate contains. If the box generates a new
# certificate (e.g. after a reset), the file must be replaced. The value of
# the secret cloudflare-ddns-token comes from the host's sops file.
{
  config,
  fritzboxRemoteProxy,
  ...
}: {
  imports = [./caddy.nix];

  services.caddy.virtualHosts.${fritzboxRemoteProxy.domain}.extraConfig = ''
    reverse_proxy https://${fritzboxRemoteProxy.upstream} {
      header_up Host {upstream_hostport}
      transport http {
        tls_server_name fritz.box
        tls_trust_pool file ${fritzboxRemoteProxy.certificate}
      }
    }
  '';

  sops.secrets."cloudflare-ddns-token" = {};

  services.cloudflare-dyndns = {
    enable = true;
    apiTokenFile = config.sops.secrets."cloudflare-ddns-token".path;
    domains = [fritzboxRemoteProxy.domain];
  };
}
