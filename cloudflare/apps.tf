# The apps published through the Cloudflare Tunnel of the home server. Every
# entry of `local.apps` gets a route in the tunnel, the DNS record pointing at
# the tunnel and a Cloudflare Access application in front of it. The tunnel
# and the login the apps share are in access.tf and tunnel.tf.

locals {
  account_id = "db8195291393053498a467a4bb121326"
  team_name  = "nicowelles"

  zone_ids = {
    "welles.app" = "3916ab52aa0fc88684379017fd7088ee"
  }

  # hostname:                 public hostname, in the zone `zone`
  # service:                  where the server's cloudflared sends the requests
  # session_duration:         how long a login to the app lasts
  # policies:                 Access policies (keys of local.policy_ids), in
  #                           order of precedence
  # disable_chunked_encoding: for origins that cannot take chunked requests
  # bypass_paths:             exact paths that reach the app without Access
  #                           (for callers that cannot log in and that the
  #                           app authenticates itself, e.g. webhooks)
  apps = {
    streamfab = {
      hostname                 = "streamfab.welles.app"
      zone                     = "welles.app"
      service                  = "http://localhost:50211"
      session_duration         = "24h"
      policies                 = ["google_email"]
      disable_chunked_encoding = null
      bypass_paths             = []
    }
    musicfab = {
      hostname                 = "musicfab.welles.app"
      zone                     = "welles.app"
      service                  = "http://localhost:50221"
      session_duration         = "24h"
      policies                 = ["google_email", "music_manager"]
      disable_chunked_encoding = null
      bypass_paths             = []
    }
    music-manager = {
      hostname                 = "music-manager.welles.app"
      zone                     = "welles.app"
      service                  = "http://localhost:50200"
      session_duration         = "12h"
      policies                 = ["google_email", "symfonium"]
      disable_chunked_encoding = null
      bypass_paths             = []
    }
    # Claude Remote Manager on the devbox VM (hosts/nico-devbox-nixos), which
    # the server reaches by its name in the LAN. A long session, as the
    # installed web app would otherwise end up at the login page every day;
    # hence its own policy, since a policy's session duration overrides the
    # application's. The GitHub App's webhook deliveries carry no login and
    # are authenticated by the app through their signature.
    claude-remote-manager = {
      hostname                 = "claude.welles.app"
      zone                     = "welles.app"
      service                  = "http://nico-devbox-nixos:8080"
      session_duration         = "720h"
      policies                 = ["google_email_long_session"]
      disable_chunked_encoding = null
      bypass_paths             = ["/api/github/webhook"]
    }
  }

  # One entry per path of local.apps' bypass_paths, keyed "<app><path>"
  bypass_paths = merge([
    for key, app in local.apps : {
      for path in app.bypass_paths : "${key}${path}" => {
        app  = key
        path = path
      }
    }
  ]...)

  policy_ids = {
    google_email              = cloudflare_zero_trust_access_policy.google_email.id
    google_email_long_session = cloudflare_zero_trust_access_policy.google_email_long_session.id
    symfonium                 = cloudflare_zero_trust_access_policy.symfonium.id
    music_manager             = cloudflare_zero_trust_access_policy.music_manager.id
  }
}

# Login with Google, for the addresses in the group "Google E-Mail"
resource "cloudflare_zero_trust_access_policy" "google_email" {
  account_id       = local.account_id
  name             = "Google E-Mail"
  decision         = "allow"
  session_duration = "24h"

  include = [{
    group = { id = cloudflare_zero_trust_access_group.google_email.id }
  }]

  require = [{
    login_method = { id = cloudflare_zero_trust_access_identity_provider.google.id }
  }]
}

# The same login, valid for 30 days
resource "cloudflare_zero_trust_access_policy" "google_email_long_session" {
  account_id       = local.account_id
  name             = "Google E-Mail (30 days)"
  decision         = "allow"
  session_duration = "720h"

  include = [{
    group = { id = cloudflare_zero_trust_access_group.google_email.id }
  }]

  require = [{
    login_method = { id = cloudflare_zero_trust_access_identity_provider.google.id }
  }]
}

# Lets everyone through, without a login; only for the bypass paths
resource "cloudflare_zero_trust_access_policy" "bypass" {
  account_id = local.account_id
  name       = "Bypass"
  decision   = "bypass"

  include = [{
    everyone = {}
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

# The Music Manager requests downloads from the MusicFab manager with its
# service token (access.tf)
resource "cloudflare_zero_trust_access_policy" "music_manager" {
  account_id = local.account_id
  name       = "Music Manager Service Token"
  decision   = "non_identity"

  include = [{
    service_token = { token_id = cloudflare_zero_trust_access_service_token.music_manager.id }
  }]
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

  allowed_idps              = [cloudflare_zero_trust_access_identity_provider.google.id]
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

# The bypass paths: an Access application of their own, scoped to the path,
# which takes precedence over the app's application for that path
resource "cloudflare_zero_trust_access_application" "bypass" {
  for_each = local.bypass_paths

  account_id = local.account_id
  name       = "${local.apps[each.value.app].hostname}${each.value.path}"
  type       = "self_hosted"
  domain     = "${local.apps[each.value.app].hostname}${each.value.path}"

  destinations = [{
    type = "public"
    uri  = "${local.apps[each.value.app].hostname}${each.value.path}"
  }]

  app_launcher_visible = false

  policies = [{
    id         = cloudflare_zero_trust_access_policy.bypass.id
    precedence = 1
  }]
}

# The Application Audience (AUD) tag of every app, for apps that check the
# Access token themselves (e.g. claudeRemoteManager.accessAudience of
# hosts/nico-devbox-nixos): ./tofu.sh output access_audiences
output "access_audiences" {
  value = {
    for key, app in cloudflare_zero_trust_access_application.app : key => app.aud
  }
}

resource "cloudflare_dns_record" "app" {
  for_each = local.apps

  zone_id = local.zone_ids[each.value.zone]
  name    = each.value.hostname
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.schokoladenelch.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}
