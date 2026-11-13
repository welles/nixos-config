# Fingerprint authentication with fprintd and libfprint's built-in drivers.
# Enroll fingers with `fprintd-enroll` (or System Settings → Users).
#
# NixOS puts pam_fprintd before pam_unix, so a login (SDDM substacks the login
# service) would wait for a finger even after a password was typed. There it
# comes after pam_unix instead: a typed password logs in right away, an empty
# one falls through to the fingerprint prompt. The lock screen keeps Plasma's
# own kde-fingerprint service, which accepts either in parallel.
{
  config,
  lib,
  persistRoot,
  ...
}: {
  services.fprintd.enable = true;

  security.pam.services.login.rules.auth.fprintd.order =
    config.security.pam.services.login.rules.auth.unix.order + 10;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = [
      {
        directory = "/var/lib/fprint";
        mode = "0700";
      }
    ];
  };
}
