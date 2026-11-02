# Public MENTZ Root CA from divang.devops/devops:
# argocd/trust-manager/mentz-ca-bundle.yaml
# NixOS also exposes these anchors through p11-kit to NSS-based browsers.
{
  security.pki.certificateFiles = [./mentz-root-ca.crt];
}
