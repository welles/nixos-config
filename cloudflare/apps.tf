# The apps published through the Cloudflare Tunnel of the home server. Every
# entry of `local.apps` gets a route in the tunnel, the DNS record pointing at
# the tunnel and a Cloudflare Access application in front of it.

locals {
  account_id = "db8195291393053498a467a4bb121326"
  team_name  = "nicowelles"

  # Tunnel "Schokoladenelch". The tunnel itself and its token are not managed
  # here, only its routes.
  tunnel_id = "fc4393b6-548b-4382-8d11-a4f3eb673089"

  zone_ids = {
    "welles.app" = "3916ab52aa0fc88684379017fd7088ee"
  }

  # Objects that stay in the Zero Trust dashboard and are only referenced
  google_idp_id              = "4f8aea74-5fa8-40c7-83ad-c0fdec6c41d9"
  google_email_group_id      = "235f2d58-c25a-4b8a-a04a-84dd2fdb245c"
  symfonium_service_token_id = "e63e7ef2-9d66-47c1-bc45-02c549b7c067"

  # hostname:                 public hostname, in the zone `zone`
  # service:                  where the server's cloudflared sends the requests
  # session_duration:         how long a login to the app lasts
  # policies:                 Access policies (keys of local.policy_ids), in
  #                           order of precedence
  # disable_chunked_encoding: for origins that cannot take chunked requests
  apps = {
    guacamole = {
      hostname                 = "guacamole.welles.app"
      zone                     = "welles.app"
      service                  = "http://localhost:50110"
      session_duration         = "24h"
      policies                 = ["google_email"]
      disable_chunked_encoding = true
    }
    music-manager = {
      hostname                 = "music-manager.welles.app"
      zone                     = "welles.app"
      service                  = "http://localhost:50200"
      session_duration         = "12h"
      policies                 = ["google_email", "symfonium"]
      disable_chunked_encoding = null
    }
  }

  policy_ids = {
    google_email = cloudflare_zero_trust_access_policy.google_email.id
    symfonium    = cloudflare_zero_trust_access_policy.symfonium.id
  }
}

# Login with Google, for the addresses in the group "Google E-Mail"
resource "cloudflare_zero_trust_access_policy" "google_email" {
  account_id       = local.account_id
  name             = "Google E-Mail"
  decision         = "allow"
  session_duration = "24h"

  include = [{
    group = { id = local.google_email_group_id }
  }]

  require = [{
    login_method = { id = local.google_idp_id }
  }]
}

# Symfonium cannot log in interactively and sends a service token instead
resource "cloudflare_zero_trust_access_policy" "symfonium" {
  account_id = local.account_id
  name       = "Symfonium Service Token"
  decision   = "non_identity"

  include = [{
    service_token = { token_id = local.symfonium_service_token_id }
  }]

  # Empty, but the dashboard created the policy with it
  connection_rules = { rdp = {} }
}

resource "cloudflare_zero_trust_access_application" "app" {
  for_each = local.apps

  account_id = local.account_id
  name       = each.value.hostname
  type       = "self_hosted"
  domain     = each.value.hostname

  destinations = [{
    type = "public"
    uri  = each.value.hostname
  }]

  allowed_idps              = [local.google_idp_id]
  auto_redirect_to_identity = true
  session_duration          = each.value.session_duration
  app_launcher_visible      = false

  enable_binding_cookie      = true
  http_only_cookie_attribute = true
  same_site_cookie_attribute = "lax"
  options_preflight_bypass   = false

  policies = [
    for index, policy in each.value.policies : {
      id         = local.policy_ids[policy]
      precedence = index + 1
    }
  ]
}

resource "cloudflare_dns_record" "app" {
  for_each = local.apps

  zone_id = local.zone_ids[each.value.zone]
  name    = each.value.hostname
  type    = "CNAME"
  content = "${local.tunnel_id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "schokoladenelch" {
  account_id = local.account_id
  tunnel_id  = local.tunnel_id

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
