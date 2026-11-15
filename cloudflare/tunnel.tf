# The Cloudflare Tunnel of the home server. The server runs cloudflared with
# the tunnel's token (modules/cloudflared.nix); the routes come from the apps
# in apps.tf.

resource "cloudflare_zero_trust_tunnel_cloudflared" "schokoladenelch" {
  account_id = local.account_id
  name       = "Schokoladenelch"
  config_src = "cloudflare"

  # A new tunnel has a new token, and the server is offline until it has it
  lifecycle {
    prevent_destroy = true
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "schokoladenelch" {
  account_id = local.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.schokoladenelch.id

  config = {
    ingress = concat(
      [
        for key, app in local.apps : {
          hostname = app.hostname
          service  = app.service
          origin_request = {
            # cloudflared itself rejects requests that did not pass the app's
            # Access policies
            access = {
              aud_tag   = [cloudflare_zero_trust_access_application.app[key].aud]
              required  = true
              team_name = local.team_name
            }
            disable_chunked_encoding = app.disable_chunked_encoding
          }
        }
      ],
      [{ service = "http_status:404" }],
    )
  }
}
