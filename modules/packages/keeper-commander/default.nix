{pkgs, ...}: {
  environment.systemPackages = [(pkgs.python3Packages.callPackage ./keepercommander.nix {})];
}
