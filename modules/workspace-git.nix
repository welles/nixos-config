# Git in ~/workspace without 1Password
#
# Claude sessions work in the repositories under ~/workspace (persisted on
# impermanence hosts) while nobody is at the machine, where a locked
# 1Password or one asking for approval would block every push. There, Git
# reaches GitHub with the SSH key github-ssh-key from sops
# (modules/github-ssh-key.nix) through core.sshCommand, bypassing the agent.
# Commits there are not signed, as the signing key lives in 1Password.
{
  config,
  user,
  ...
}: {
  imports = [./github-ssh-key.nix ./workspace-state.nix];

  home-manager.users.${user}.programs.git.includes = [
    {
      condition = "gitdir:/home/${user}/workspace/";
      contents = {
        core.sshCommand = "ssh -i ${config.sops.secrets."github-ssh-key".path} -o IdentitiesOnly=yes -o IdentityAgent=none";
        commit.gpgSign = false;
        tag.gpgSign = false;
      };
    }
  ];
}
