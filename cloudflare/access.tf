# Who may log in to the apps: the identity provider, the group of allowed
# addresses and the service token for clients that cannot log in.

variable "access_emails" {
  description = "Addresses that may log in to the apps (TF_VAR_access_emails in secrets.yaml)"
  type        = list(string)
  sensitive   = true
}

variable "google_client_id" {
  description = "OAuth client ID of the Google login (TF_VAR_google_client_id in secrets.yaml)"
  type        = string
  sensitive   = true
}

resource "cloudflare_zero_trust_access_identity_provider" "google" {
  account_id = local.account_id
  name       = "Google"
  type       = "google"

  config = {
    client_id    = var.google_client_id
    pkce_enabled = true
  }

  # Cloudflare never returns the client secret, so it is not kept here. Check
  # that the Google login still works after any change to this resource.
  lifecycle {
    ignore_changes = [config.client_secret]
  }
}

resource "cloudflare_zero_trust_access_group" "google_email" {
  account_id = local.account_id
  name       = "Google E-Mail"

  include = [
    for email in var.access_emails : {
      email = { email = email }
    }
  ]
}

# The service token Symfonium sends instead of a login. It is not managed
# here: the provider cannot import it without sending an update, and its
# secret, which only Symfonium has, must not be put at risk for that.
locals {
  symfonium_service_token_id = "e63e7ef2-9d66-47c1-bc45-02c549b7c067"
}
