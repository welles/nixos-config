# nixos-wsl-nixos Machine Configuration
#
# Machine config for NixOS running inside Windows WSL2.
# Uses NixOS-WSL for proper WSL2 integration. Networking is handled
# by the WSL2 host so NetworkManager is not enabled here.
{
  inputs,
  user,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./desktop.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl = {
    enable = true;
    defaultUser = user;
    interop.includePath = false;
    ssh-agent.enable = true;
  };
}
