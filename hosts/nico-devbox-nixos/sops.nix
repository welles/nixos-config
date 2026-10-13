# Secrets for the user account. secrets.yaml is encrypted with the same
# master key as the other hosts; the age key is placed at
# /persist/var/lib/sops-nix/key.txt during the installation (default.nix).
_: {
  sops.secrets."user-password" = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };
}
