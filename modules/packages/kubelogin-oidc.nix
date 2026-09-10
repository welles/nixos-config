{pkgs, ...}: {
  environment.systemPackages = [pkgs.kubelogin-oidc];
}
