# ModemManager drives mobile broadband modems, NetworkManager connects through
# them. The provider database lets NetworkManager suggest the APN.
{pkgs, ...}: {
  imports = [./networkmanager.nix];

  networking.modemmanager.enable = true;

  environment.systemPackages = [pkgs.mobile-broadband-provider-info];
}
