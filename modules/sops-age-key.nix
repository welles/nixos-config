# sops-nix decrypts with the age key at `sopsAgeKeyFile` only, not with the
# SSH host keys.
{sopsAgeKeyFile, ...}: {
  sops.age = {
    keyFile = sopsAgeKeyFile;
    sshKeyPaths = [];
  };
}
