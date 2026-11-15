# Objects that existed before they were managed here. The blocks do nothing
# once an object is in the state; they stay so that a lost state can be
# rebuilt with a single apply.

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
    guacamole     = "e96b11b0-c3b5-494e-9cc8-65f0a43b83b9"
    music-manager = "bdf367e1-037a-441e-9816-ce2e7d0ac210"
  }
  to = cloudflare_zero_trust_access_application.app[each.key]
  id = "accounts/${local.account_id}/${each.value}"
}

import {
  for_each = {
    guacamole     = "a6ff73620cbc58f2100b84f8568cade7"
    music-manager = "0fd4cca3df6a876397fba335274c2ca2"
  }
  to = cloudflare_dns_record.app[each.key]
  id = "${local.zone_ids[local.apps[each.key].zone]}/${each.value}"
}

import {
  to = cloudflare_zero_trust_tunnel_cloudflared_config.schokoladenelch
  id = "${local.account_id}/${local.tunnel_id}"
}
