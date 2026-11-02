# Trusted subnets
#
# Accepts all incoming traffic from the IPv4 subnets in `trustedSubnets`
# (e.g. the LAN or Docker's internal networks), whatever ports are open.
# Uses an nftables rule, so it brings nftables.nix along.
{
  lib,
  trustedSubnets,
  ...
}: {
  imports = [./nftables.nix];

  networking.firewall.extraInputRules =
    lib.concatMapStrings (subnet: ''
      ip saddr ${subnet} accept
    '')
    trustedSubnets;
}
