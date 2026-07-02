{
  lib,
  user,
  persistRoot ? null,
  ...
}: {
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [user];
  };

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".config/1Password"];
  };
}
