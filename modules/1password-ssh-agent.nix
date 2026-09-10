{
  lib,
  onePasswordVaults,
  ...
}: {
  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/.1password/agent.sock";
  };

  programs.ssh.extraConfig = ''
    Host *
      IdentityAgent ~/.1password/agent.sock
  '';

  home.file.".config/1Password/ssh/agent.toml".text =
    lib.concatMapStringsSep "\n" (vault: ''
      [[ssh-keys]]
      vault = "${vault}"
    '')
    onePasswordVaults;
}
