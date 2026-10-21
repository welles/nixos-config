{pkgs, ...}: {
  imports = [../jetbrains-state.nix];

  environment.systemPackages = [pkgs.jetbrains.idea];
}
