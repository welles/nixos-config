# Shared Docker Configuration
#
# Enables the Docker daemon and adds the system user to the docker
# group for unprivileged socket access.
{
  lib,
  user,
  persistRoot ? null,
  ...
}: {
  virtualisation.docker.enable = true;
  users.users.${user}.extraGroups = ["docker"];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = ["/var/lib/docker"];
  };
}
