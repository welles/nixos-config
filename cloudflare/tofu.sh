#!/usr/bin/env bash
# Runs tofu in this directory with the secrets of secrets.yaml in its
# environment.
#
# Usage: ./tofu.sh <tofu arguments>
#
# The age key file may only be readable by root; it is then read once via
# sudo and handed to sops through SOPS_AGE_KEY (as sops-edit does).
set -euo pipefail

cd "$(dirname "$0")"

if [[ -n ${SOPS_AGE_KEY_FILE:-} && ! -r $SOPS_AGE_KEY_FILE ]]; then
	SOPS_AGE_KEY="$(sudo cat "$SOPS_AGE_KEY_FILE")"
	export SOPS_AGE_KEY
fi

exec sops exec-env secrets.yaml "tofu $(printf '%q ' "$@")"
