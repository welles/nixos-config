# The devbox's desktop in the browser through KasmVNC
# (modules/kasmvnc-xrdp-mirror.nix) at devbox.welles.app.
#
# KasmVNC has no login of its own and listens on the devbox's localhost
# only, so it is published by a tunnel of the devbox itself rather than the
# server's: its cloudflared (modules/cloudflared.nix on the devbox) is the
# only way in, and rejects requests that did not pass Access. The devbox
# needs the tunnel's token as its sops secret cloudflare-tunnel-token:
#
#   ./tofu.sh output -raw devbox_tunnel_token
#
# The tunnel also publishes the apps of apps.tf with `tunnel = "devbox"`.

locals {
  devbox_vnc = {
    hostname = "devbox.welles.app"
    zone     = "welles.app"
    service  = "http://localhost:6901"
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "devbox" {
  account_id = local.account_id
  name       = "Devbox"
  config_src = "cloudflare"

  # A new tunnel has a new token, and the devbox is unreachable here until
  # it has it
  lifecycle {
    prevent_destroy = true
  }
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "devbox" {
  account_id = local.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.devbox.id
}

output "devbox_tunnel_token" {
  value     = data.cloudflare_zero_trust_tunnel_cloudflared_token.devbox.token
  sensitive = true
}

resource "cloudflare_zero_trust_access_application" "devbox_vnc" {
  account_id = local.account_id
  name       = local.devbox_vnc.hostname
  type       = "self_hosted"
  domain     = local.devbox_vnc.hostname

  destinations = [{
    type = "public"
    uri  = local.devbox_vnc.hostname
  }]

  allowed_idps              = [cloudflare_zero_trust_access_identity_provider.google.id]
  auto_redirect_to_identity = true
  session_duration          = "24h"
  app_launcher_visible      = false

  enable_binding_cookie      = true
  http_only_cookie_attribute = true
  same_site_cookie_attribute = "lax"
  options_preflight_bypass   = false

  policies = [{
    id         = cloudflare_zero_trust_access_policy.google_email.id
    precedence = 1
  }]
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "devbox" {
  account_id = local.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.devbox.id

  config = {
    ingress = concat(local.app_ingress.devbox, [
      {
        hostname = local.devbox_vnc.hostname
        service  = local.devbox_vnc.service
        origin_request = {
          # cloudflared itself rejects requests that did not pass Access
          access = {
            aud_tag   = [cloudflare_zero_trust_access_application.devbox_vnc.aud]
            required  = true
            team_name = local.team_name
          }
        }
      },
      { service = "http_status:404" },
    ])
  }
}

resource "cloudflare_dns_record" "devbox_vnc" {
  zone_id = local.zone_ids[local.devbox_vnc.zone]
  name    = local.devbox_vnc.hostname
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.devbox.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

# First created as an entry of local.apps (apps.tf), on the server's tunnel
moved {
  from = cloudflare_zero_trust_access_application.app["devbox-vnc"]
  to   = cloudflare_zero_trust_access_application.devbox_vnc
}

moved {
  from = cloudflare_dns_record.app["devbox-vnc"]
  to   = cloudflare_dns_record.devbox_vnc
}
