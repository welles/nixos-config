# Settings modules/stacks needs but does not declare itself yet. They move
# into the module when it is reworked.
{lib, ...}: {
  sops.secrets =
    {
      # Token of the Cloudflare DDNS updates for the stacks' domains
      "cloudflare-ddns-token".mode = "0444";
    }
    # Secrets of the stack claude_remote_manager, mounted into the container
    # as files. Its entrypoint requires them readable by the API user (UID
    # 1000 in the image) and not by the session user (UID 1001).
    // lib.genAttrs (map (name: "claude_remote_manager/${name}") [
      "github-app-key"
      "github-webhook-secret"
      "ntfy-token"
    ]) (_: {
      uid = 1000;
      gid = 0;
      mode = "0400";
      restartUnits = ["docker-compose-claude_remote_manager.service"];
    });

  # Data directory of the stack notes, owned by the image's user (APP_UID of
  # the .NET images); Docker would create a missing one owned by root
  systemd.tmpfiles.rules = ["d /mnt/bucket/notes/data 0750 1654 1654 -"];

  networking.firewall = {
    allowedTCPPorts = [50051]; # Windows RDP (Docker, stack "windows")
    allowedUDPPorts = [50051];
  };
}
