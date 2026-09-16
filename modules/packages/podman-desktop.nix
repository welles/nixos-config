{
  lib,
  pkgs,
  user,
  persistRoot ? null,
  ...
}: {
  environment.systemPackages = [pkgs.podman-desktop];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [
      ".config/containers/podman-desktop"
      ".local/share/containers/podman-desktop"
    ];
  };
}
