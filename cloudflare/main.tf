# Cloudflare account configuration: the tunnel's routes, their DNS records and
# the Cloudflare Access applications in front of them.
#
# Run OpenTofu through ./tofu.sh, which takes the secrets from secrets.yaml:
#
#   ./tofu.sh plan
#   ./tofu.sh apply
#
# The state (terraform.tfstate) is encrypted and committed together with the
# configuration, so commit it after every apply.

terraform {
  required_version = ">= 1.10"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }

  # State and plan files hold secrets in plain text otherwise
  encryption {
    key_provider "pbkdf2" "passphrase" {
      passphrase = var.state_passphrase
    }

    method "aes_gcm" "passphrase" {
      keys = key_provider.pbkdf2.passphrase
    }

    state {
      method   = method.aes_gcm.passphrase
      enforced = true
    }

    plan {
      method   = method.aes_gcm.passphrase
      enforced = true
    }
  }
}

variable "state_passphrase" {
  description = "Passphrase the state is encrypted with (TF_VAR_state_passphrase in secrets.yaml)"
  type        = string
  sensitive   = true
}

# The API token is CLOUDFLARE_API_TOKEN in secrets.yaml
provider "cloudflare" {}
