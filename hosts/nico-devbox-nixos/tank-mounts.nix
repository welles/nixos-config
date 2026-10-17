# Server storage over virtiofs
#
# The server (hosts/nico-schokoladenelch-nixos/nico-devbox-vm.nix) passes
# the datasets listed in tank-shares.nix through to the VM as virtiofs
# devices; here they are mounted at the same paths as on the server.
# Permissions are passed through 1:1 (the user is UID 1000 on both sides).
# nofail: a missing share (VM started without it, or an older domain
# definition) must not drop the VM into emergency mode.
{lib, ...}: {
  fileSystems = lib.genAttrs (map (name: "/mnt/tank/${name}") (import ./tank-shares.nix)) (path: {
    device = "tank-${baseNameOf path}";
    fsType = "virtiofs";
    options = ["nofail"];
  });
}
