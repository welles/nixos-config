# Edit a sops-encrypted file with the host's age key.
#
# Usage: sops-edit <file> [sops edit options]
#
# The age key file is only readable by root, so it is read once via
# sudo and handed to sops through SOPS_AGE_KEY. sops itself keeps
# running as the calling user, so the edited file keeps its owner.
set -euo pipefail

if [ $# -lt 1 ]; then
	echo "Usage: sops-edit <file> [sops edit options]" >&2
	exit 1
fi

if [ -r "$key_file" ]; then
	age_key="$(cat "$key_file")"
else
	age_key="$(sudo cat "$key_file")"
fi

SOPS_AGE_KEY="$age_key" exec sops edit "$@"
