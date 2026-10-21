{
  lib,
  user,
  persistRoot,
  onePasswordVaults,
  ...
}: {
  # known_hosts and keys outside 1Password live in ~/.ssh.
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".ssh"];
  };

  home-manager.sharedModules = [
    {
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
  ];
}
