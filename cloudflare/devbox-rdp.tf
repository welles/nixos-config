# The desktop of the devbox VM (hosts/nico-devbox-nixos) in the browser:
# Cloudflare's browser-based RDP connects through the home server's tunnel to
# xrdp on the devbox. After the login with Google, the browser shows an RDP
# login, which takes the devbox user and its password.
#
#   ./tofu.sh output -raw devbox_rdp_url
#
# Cloudflare documents this for Windows only; xrdp works as it offers the
# TLS security layer. There is no audio in the browser.

locals {
  devbox_rdp = {
    hostname = "devbox.welles.app"
    zone     = "welles.app"
    # The devbox's address in the LAN, fixed in the UniFi router
    target_hostname = "nico-devbox-nixos"
    ip              = "10.0.5.6"
    port            = 3389
  }
}

data "cloudflare_zero_trust_tunnel_cloudflared_virtual_networks" "default" {
  account_id         = local.account_id
  is_default_network = true
}

locals {
  default_vnet_id = one(data.cloudflare_zero_trust_tunnel_cloudflared_virtual_networks.default.result).id
}

# The tunnel's cloudflared on the server reaches only the devbox, nothing
# else in the LAN
resource "cloudflare_zero_trust_tunnel_cloudflared_route" "devbox" {
  account_id = local.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.schokoladenelch.id
  network    = "${local.devbox_rdp.ip}/32"
  comment    = "Devbox VM, browser-based RDP"
}

resource "cloudflare_zero_trust_access_infrastructure_target" "devbox" {
  account_id = local.account_id
  hostname   = local.devbox_rdp.target_hostname

  ip = {
    ipv4 = {
      ip_addr            = local.devbox_rdp.ip
      virtual_network_id = local.default_vnet_id
    }
  }
}

# The Google login, with text and files over the clipboard in both
# directions (new policies allow neither)
resource "cloudflare_zero_trust_access_policy" "google_email_rdp" {
  account_id       = local.account_id
  name             = "Google E-Mail (RDP)"
  decision         = "allow"
  session_duration = "24h"

  include = [{
    group = { id = cloudflare_zero_trust_access_group.google_email.id }
  }]

  require = [{
    login_method = { id = cloudflare_zero_trust_access_identity_provider.google.id }
  }]

  connection_rules = {
    rdp = {
      allowed_clipboard_local_to_remote_formats = ["text", "file"]
      allowed_clipboard_remote_to_local_formats = ["text", "file"]
    }
  }
}

resource "cloudflare_zero_trust_access_application" "devbox_rdp" {
  account_id = local.account_id
  name       = local.devbox_rdp.hostname
  type       = "rdp"
  domain     = local.devbox_rdp.hostname

  destinations = [{
    type = "public"
    uri  = local.devbox_rdp.hostname
  }]

  target_criteria = [{
    port     = local.devbox_rdp.port
    protocol = "RDP"
    target_attributes = {
      hostname = [local.devbox_rdp.target_hostname]
    }
  }]

  allowed_idps              = [cloudflare_zero_trust_access_identity_provider.google.id]
  auto_redirect_to_identity = true
  session_duration          = "24h"
  app_launcher_visible      = false

  policies = [{
    id         = cloudflare_zero_trust_access_policy.google_email_rdp.id
    precedence = 1
  }]

  depends_on = [cloudflare_zero_trust_access_infrastructure_target.devbox]
}

# Only needs to exist; Cloudflare's RDP proxy answers on the hostname, not
# the tunnel
resource "cloudflare_dns_record" "devbox_rdp" {
  zone_id = local.zone_ids[local.devbox_rdp.zone]
  name    = local.devbox_rdp.hostname
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.schokoladenelch.id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

output "devbox_rdp_url" {
  value = "https://${local.devbox_rdp.hostname}/rdp/${local.default_vnet_id}/${local.devbox_rdp.ip}/${local.devbox_rdp.port}"
}

# devbox.welles.app itself only shows an error, as the RDP application needs
# the target in the path; redirect it to the devbox's URL. Redirects run
# before Access, so this exact path skips nothing.
resource "cloudflare_ruleset" "redirects" {
  zone_id = local.zone_ids[local.devbox_rdp.zone]
  name    = "Redirects"
  kind    = "zone"
  phase   = "http_request_dynamic_redirect"

  rules = [{
    description = "devbox.welles.app to the devbox's RDP target"
    expression  = "(http.host eq \"${local.devbox_rdp.hostname}\" and http.request.uri.path eq \"/\")"
    action      = "redirect"
    action_parameters = {
      from_value = {
        status_code           = 302
        preserve_query_string = false
        target_url = {
          value = "https://${local.devbox_rdp.hostname}/rdp/${local.default_vnet_id}/${local.devbox_rdp.ip}/${local.devbox_rdp.port}"
        }
      }
    }
  }]
}
