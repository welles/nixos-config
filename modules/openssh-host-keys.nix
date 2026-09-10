# Shared SSH Host Key Persistence
#
# Persists the generated SSH host keys so machines with ephemeral root
# filesystems don't regenerate them (and their fingerprints) on every
# boot. Does not enable or configure sshd itself - that stays with
# each host's own service definition.
{
  lib,
  persistRoot ? null,
  ...
}: {
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.files = [
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
  };
}
