# Disable sudo's first-use lecture. Its "already lectured" marker lives in
# /var/db/sudo/lectured, which would be wiped on every boot with an
# impermanent root.
_: {
  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';
}
