# Datasets of the server's "tank" pool that are shared with the VM over
# virtiofs. Used by both sides:
#   - hosts/nico-schokoladenelch-nixos/nico-devbox-vm.nix (the server
#     exports them from /mnt/tank/<name> with the virtiofs tag tank-<name>)
#   - hosts/nico-devbox-nixos/tank-mounts.nix (the guest mounts them under
#     /mnt/tank/<name>)
["movies" "shows" "downloads" "music" "audiobooks" "podcasts"]
