# LAN bridge
#
# Turns the LAN port `lanBridge.interface` into a port of the bridge
# `lanBridge.name`, which holds the machine's address (DHCP and SLAAC) and
# connects bridged VMs (libvirt-vm.nix) directly to the LAN. The bridge uses
# the MAC address of the LAN port (`lanBridge.macAddress`), so the router
# keeps assigning the same address and port forwards keep working.
{lanBridge, ...}: {
  imports = [./networkmanager.nix];

  networking.networkmanager.ensureProfiles.profiles = {
    ${lanBridge.name} = {
      connection = {
        id = lanBridge.name;
        type = "bridge";
        interface-name = lanBridge.name;
        autoconnect-slaves = 1;
      };
      ethernet.cloned-mac-address = lanBridge.macAddress;
      bridge.stp = false;
      ipv4.method = "auto";
      ipv6.method = "auto";
    };
    "${lanBridge.name}-${lanBridge.interface}" = {
      connection = {
        id = "${lanBridge.name}-${lanBridge.interface}";
        type = "ethernet";
        interface-name = lanBridge.interface;
        master = lanBridge.name;
        slave-type = "bridge";
      };
    };
  };
}
