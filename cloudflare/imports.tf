# Objects that existed before they were managed here. The blocks do nothing
# once an object is in the state; they stay so that a lost state can be
# rebuilt with a single apply.

locals {
  tunnel_id = "fc4393b6-548b-4382-8d11-a4f3eb673089"
}

import {
  to = cloudflare_zero_trust_access_policy.google_email
  id = "${local.account_id}/6ec4ba9e-33f5-4501-88c4-154ecc2f5212"
}

import {
  to = cloudflare_zero_trust_access_policy.symfonium
  id = "${local.account_id}/ad0eb4d7-c75f-4c39-8ab0-302b7a2396c6"
}

import {
  for_each = {
    music-manager = "bdf367e1-037a-441e-9816-ce2e7d0ac210"
  }
  to = cloudflare_zero_trust_access_application.app[each.key]
  id = "accounts/${local.account_id}/${each.value}"
}

import {
  for_each = {
    music-manager = "0fd4cca3df6a876397fba335274c2ca2"
  }
  to = cloudflare_dns_record.app[each.key]
  id = "${local.zone_ids[local.apps[each.key].zone]}/${each.value}"
}

import {
  to = cloudflare_zero_trust_tunnel_cloudflared_config.schokoladenelch
  id = "${local.account_id}/${local.tunnel_id}"
}

import {
  to = cloudflare_zero_trust_tunnel_cloudflared.schokoladenelch
  id = "${local.account_id}/${local.tunnel_id}"
}

import {
  to = cloudflare_zero_trust_access_identity_provider.google
  id = "accounts/${local.account_id}/4f8aea74-5fa8-40c7-83ad-c0fdec6c41d9"
}

import {
  to = cloudflare_zero_trust_access_group.google_email
  id = "accounts/${local.account_id}/235f2d58-c25a-4b8a-a04a-84dd2fdb245c"
}
