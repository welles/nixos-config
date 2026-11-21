# Shared Docker Configuration
#
# Enables the Docker daemon and adds the system user to the docker
# group for unprivileged socket access. /var/lib/docker is persisted under
# `persistRoot`, unless the host mounts its own file system there (e.g. a
# ZFS dataset without snapshots).
{
  config,
  lib,
  user,
  persistRoot,
  ...
}: {
  virtualisation.docker.enable = true;
  users.users.${user}.extraGroups = ["docker"];

  environment.persistence = lib.mkIf (persistRoot != null && !(config.fileSystems ? "/var/lib/docker")) {
    ${persistRoot}.directories = ["/var/lib/docker"];
  };
}
