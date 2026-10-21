# NixOS on WSL2
{
  inputs,
  user,
  ...
}: {
  imports = [inputs.nixos-wsl.nixosModules.default];

  wsl = {
    enable = true;
    defaultUser = user;
    interop.includePath = false;
  };

  environment.sessionVariables.DONT_PROMPT_WSL_INSTALL = "true";

  # Keep the user's systemd instance and its services running between WSL
  # sessions; without lingering, WSL ended the user session.
  users.users.${user}.linger = true;

  # WSL manages the network, and there is no Bluetooth; desktops such as
  # Cinnamon would turn these on
  networking.networkmanager.enable = false;
  hardware.bluetooth.enable = false;

  # Windows' own RDP server already listens on 3389 (see xrdp.nix)
  services.xrdp.port = 3390;
}
