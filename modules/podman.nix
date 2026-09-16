# Shared Podman Configuration
#
# Enables the Podman container engine (rootless-capable, daemonless)
# alongside Docker, without the docker-compat CLI/socket alias — that
# alias would conflict with a real Docker daemon on the same host.
{
  lib,
  user,
  persistRoot ? null,
  ...
}: {
  virtualisation.podman.enable = true;
  users.users.${user}.extraGroups = ["podman"];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = ["/var/lib/containers"];
  };
}
