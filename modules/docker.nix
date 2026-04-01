# Docker Configuration
#
# Enables the Docker daemon. Add the relevant user to the "docker"
# group in the host's user definition for unprivileged socket access.
{...}: {
  virtualisation.docker.enable = true;
}
