# Networking
#
# NetworkManager with DHCP from the Fritzbox (the VM is bridged into the
# LAN on the server, see nico-devbox-vm.nix there). SSH for administration
# and deployments (`nixos-rebuild --target-host`), key only.
#
# Unlike on the desktops, NetworkManager-wait-online stays enabled: the
# Claude services (claude-workspace-clone.service and the sessions) start at
# boot and need a working network, including DNS, once network-online.target
# is reached.
{user, ...}: {
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Same key as for the server (1Password SSH agent)
  users.users.${user}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
  ];
}
