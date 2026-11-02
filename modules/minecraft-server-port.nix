# Opens the Minecraft server port, for a server run from a working copy
# (e.g. a NeoForge development server).
_: {
  networking.firewall.allowedTCPPorts = [25565];
}
