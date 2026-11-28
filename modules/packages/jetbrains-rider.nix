{pkgs, ...}: {
  imports = [../jetbrains-state.nix];

  environment.systemPackages = [pkgs.jetbrains.rider];

  # nixpkgs marks Rider insecure because of CVE-2026-111497 in the bundled
  # .NET runtime (https://github.com/NixOS/nixpkgs/issues/590447). On Linux
  # nixpkgs replaces that runtime with dotnetCorePackages.sdk_10_0-source
  # (runtime 10.0.15, fixed since 10.0.14), so the CVE does not apply here.
  # Pinned to the exact version so a new Rider release is re-checked.
  nixpkgs.config.permittedInsecurePackages = ["rider-2026.2.4"];
}
