# Records which commit of this repository a system was built from.
#
# `nixos-version --configuration-revision` shows the commit;
# /etc/nixos-configuration-revision holds "<commit> <commit time>" for
# scripts such as the server status display. Builds from a dirty work tree
# carry the commit with a "-dirty" suffix.
{inputs, ...}: let
  inherit (inputs) self;
  rev = self.rev or self.dirtyRev or null;
in {
  system.configurationRevision = rev;

  environment.etc."nixos-configuration-revision".text = ''
    ${
      if rev == null
      then "unknown"
      else rev
    } ${toString (self.lastModified or 0)}
  '';
}
