# OpenSSH Server
#
# sshd with key-only logins for the user (`sshAuthorizedKeys`), no root
# login, port 22 open in the firewall. Hosts add their own settings on top
# (e.g. Macs).
#
# Persists the generated SSH host keys so machines with ephemeral root
# filesystems don't regenerate them (and their fingerprints) on every
# boot.
{
  lib,
  user,
  persistRoot ? null,
  sshAuthorizedKeys ? (builtins.throw "openssh.nix: set `_module.args.sshAuthorizedKeys` to the public keys allowed to log in"),
  ...
}: {
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.${user}.openssh.authorizedKeys.keys = sshAuthorizedKeys;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.files = [
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
  };
}
