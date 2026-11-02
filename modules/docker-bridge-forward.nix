# Bridged traffic past Docker's FORWARD policy
#
# Docker loads br_netfilter, so traffic between the LAN and bridged VMs on
# the LAN bridge (networkmanager-lan-bridge.nix) passes iptables' FORWARD
# chain, whose policy Docker sets to DROP. DOCKER-USER is Docker's hook for
# custom rules.
{
  pkgs,
  lanBridge,
  ...
}: let
  bridge = lanBridge.name;
in {
  imports = [
    ./docker.nix
    ./networkmanager-lan-bridge.nix
  ];

  systemd.services.docker-bridge-forward = {
    description = "Allow bridged traffic on ${bridge} past Docker's FORWARD policy";
    wantedBy = ["docker.service"];
    after = ["docker.service"];
    partOf = ["docker.service"];
    path = [pkgs.iptables];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      iptables -C DOCKER-USER -i ${bridge} -o ${bridge} -j ACCEPT 2>/dev/null \
        || iptables -I DOCKER-USER -i ${bridge} -o ${bridge} -j ACCEPT
    '';
    preStop = ''
      iptables -D DOCKER-USER -i ${bridge} -o ${bridge} -j ACCEPT || true
    '';
  };
}
