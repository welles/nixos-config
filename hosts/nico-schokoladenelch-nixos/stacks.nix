# Settings modules/stacks needs but does not declare itself yet. They move
# into the module when it is reworked.
_: {
  # Token of the Cloudflare DDNS updates for the stacks' domains
  sops.secrets."cloudflare-ddns-token".mode = "0444";

  networking.firewall = {
    allowedTCPPorts = [50051]; # Windows RDP (Docker, stack "windows")
    allowedUDPPorts = [50051];
  };
}
