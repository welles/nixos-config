# Networking
#
# NetworkManager with DHCP; libvirt's network on the server always hands
# out 192.168.201.10 (fixed lease by MAC address). SSH for administration
# and deployments (`nixos-rebuild --target-host`), key only.
{user, ...}: {
  systemd.services.NetworkManager-wait-online.enable = false;

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
