# The user's login password as plaintext sops secret user-password (the host
# sets its sopsFile, unless it is in the default one), for modules that need
# the password itself, like kwallet-sops-unlock.nix. The hash for
# /etc/shadow is computed from it on every activation, before the users are
# set up, so login, sudo and keyrings always share one password.
#
# Replaces `passwordConfig = {hashedPasswordFile = ...;}` in the host: pass
# `passwordConfig = {};`. If the hash can't be computed, the activation fails
# loudly and the user is left without a password (locked) until it works.
{
  config,
  pkgs,
  user,
  ...
}: let
  hashFile = "/run/secrets-for-users/user-password-hash";
in {
  sops.secrets."user-password".neededForUsers = true;

  system.activationScripts.userPasswordHash = {
    deps = ["setupSecretsForUsers"];
    text = ''
      (
        umask 077
        ${pkgs.mkpasswd}/bin/mkpasswd --method=yescrypt --stdin \
          < ${config.sops.secrets."user-password".path} > ${hashFile}.tmp
        mv ${hashFile}.tmp ${hashFile}
      ) || echo "user-password-plaintext: failed to hash the password of ${user}" >&2
    '';
  };
  system.activationScripts.users.deps = ["userPasswordHash"];

  users.users.${user}.hashedPasswordFile = hashFile;
}
