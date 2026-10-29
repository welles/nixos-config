# GitHub access over SSH for services, without 1Password: the key
# github-ssh-key from sops, readable by the primary user, and GitHub's host
# key. The host provides the key's value (its default sops file, or it sets
# the secret's sopsFile).
{user, ...}: {
  sops.secrets."github-ssh-key" = {
    owner = user;
    mode = "0400";
  };

  programs.ssh.knownHosts.github = {
    hostNames = ["github.com"];
    publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
  };
}
