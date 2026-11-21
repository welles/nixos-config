# Trusted subnets
#
# Accepts all incoming traffic from the IPv4 subnets in `trustedSubnets`
# (e.g. the LAN or Docker's internal networks), whatever ports are open, and
# keeps fail2ban (when enabled) from banning hosts in them.
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

  # Repeated SSH logins from the LAN (e.g. an agent offering several keys)
  # would otherwise lock out the admin's own machines.
  services.fail2ban.ignoreIP = trustedSubnets;
}
