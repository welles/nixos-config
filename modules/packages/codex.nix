{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: let
  # codex 0.167.0 links against system libraries the nixpkgs package does not
  # provide yet, so the build fails in zstd-sys. Fixed upstream in
  # NixOS/nixpkgs@16b463698a; drop this override once nixos-unstable has it.
  codex = pkgs.codex.overrideAttrs (old: {
    buildInputs =
      (old.buildInputs or [])
      ++ [
        pkgs.aws-lc
        pkgs.oniguruma
        pkgs.sqlite
        pkgs.zstd
      ];
  });
in {
  environment.systemPackages = [codex];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".codex"];
  };
}
