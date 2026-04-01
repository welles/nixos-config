# Shared Docker Configuration
#
# Enables the Docker daemon and adds the system user to the docker
# group for unprivileged socket access.
{user, ...}: {
  virtualisation.docker.enable = true;
  users.users.${user}.extraGroups = ["docker"];
}
