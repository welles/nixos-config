# Tools for editing this flake's sops secrets on the host.
{
  imports = [
    ../modules/packages/sops.nix
    ../modules/packages/ssh-to-age.nix
    ../modules/scripts/sops-edit
    ../modules/sops-env.nix
  ];
}
