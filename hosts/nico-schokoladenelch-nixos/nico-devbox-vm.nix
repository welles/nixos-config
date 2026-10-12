# Development Desktop VM (libvirt) for nico-devbox-nixos
#
# Runs the NixOS host nico-devbox-nixos (hosts/nico-devbox-nixos) as a
# libvirt/KVM guest, in parallel to the microvm devbox (devbox.nix). The
# server only provides the virtual hardware; the guest's system, Nix store
# and data live on its own disk and are deployed separately.
#
#   - Disk: sparse zvol bucket/vms/nico-devbox-nixos (volmode=dev, so the
#     server never scans the guest's partitions or ZFS pool), handed to the
#     guest as virtio disk with serial "nico-devbox-nixos"
#   - Network: libvirt network "nico-devbox" (bridge virbr-devbox,
#     192.168.201.0/24) in "open" mode: libvirt only provides the bridge
#     and DHCP/DNS (dnsmasq, forwarding to the server's resolvers), NAT and
#     port forwards come from NixOS. The guest always gets 192.168.201.10.
#     It reaches the internet, the LAN, the Docker networks and the server
#     itself (e.g. SSH); from the LAN, SSH reaches it via host port 2223 and
#     RDP via host port 3390, Guacamole uses 192.168.201.10:3389 directly.
#   - Domain and network are defined from the XML below on every start of
#     nico-devbox-vm.service (and whenever it changes); changes to the
#     domain take effect on the next restart of the VM.
#   - Consoles: `virsh console nico-devbox-nixos` (serial) or virt-manager
#     with the connection qemu+ssh://schokoladenelch@<server>/system (SPICE,
#     only listening on localhost, tunnelled through SSH)
#   - Installation: an ISO at /var/lib/libvirt/images/nixos-installer.iso
#     is attached as optional CD-ROM and boots while the disk is still
#     empty; see hosts/nico-devbox-nixos/default.nix.
{
  config,
  pkgs,
  persistRoot,
  user,
  ...
}: let
  name = "nico-devbox-nixos";
  zvol = "bucket/vms/${name}";
  # Same size as in disk-configuration.nix
  zvolSize = "256G";
  bridge = "virbr-devbox";
  network = "nico-devbox";
  hostAddress = "192.168.201.1";
  vmAddress = "192.168.201.10";
  vmMac = "52:54:00:c9:00:0a";
  lanSubnet = "10.0.0.0/24";
  sshPort = 2223;
  rdpPort = 3390;
  installerIso = "/var/lib/libvirt/images/nixos-installer.iso";
  virsh = "${config.virtualisation.libvirtd.package}/bin/virsh";

  networkXml = pkgs.writeText "${network}.xml" ''
    <network>
      <name>${network}</name>
      <forward mode='open'/>
      <bridge name='${bridge}' stp='off'/>
      <ip address='${hostAddress}' netmask='255.255.255.0'>
        <dhcp>
          <range start='192.168.201.100' end='192.168.201.200'/>
          <host mac='${vmMac}' name='${name}' ip='${vmAddress}'/>
        </dhcp>
      </ip>
    </network>
  '';

  domainXml = pkgs.writeText "${name}.xml" ''
    <domain type='kvm'>
      <name>${name}</name>
      <uuid>dfbb1886-3174-4fc4-9eb9-2c2a41061745</uuid>
      <memory unit='GiB'>16</memory>
      <vcpu>6</vcpu>
      <os firmware='efi'>
        <type arch='x86_64' machine='q35'>hvm</type>
        <!-- systemd-boot is unsigned -->
        <firmware>
          <feature enabled='no' name='secure-boot'/>
        </firmware>
      </os>
      <features>
        <acpi/>
        <apic/>
      </features>
      <cpu mode='host-passthrough'/>
      <clock offset='utc'/>
      <on_poweroff>destroy</on_poweroff>
      <on_reboot>restart</on_reboot>
      <on_crash>destroy</on_crash>
      <devices>
        <emulator>/run/libvirt/nix-emulators/qemu-system-x86_64</emulator>
        <disk type='block' device='disk'>
          <driver name='qemu' type='raw' cache='none' io='native' discard='unmap'/>
          <source dev='/dev/zvol/${zvol}'/>
          <target dev='vda' bus='virtio'/>
          <serial>${name}</serial>
          <boot order='1'/>
        </disk>
        <disk type='file' device='cdrom'>
          <driver name='qemu' type='raw'/>
          <source file='${installerIso}' startupPolicy='optional'/>
          <target dev='sda' bus='sata'/>
          <readonly/>
          <boot order='2'/>
        </disk>
        <interface type='network'>
          <source network='${network}'/>
          <mac address='${vmMac}'/>
          <model type='virtio'/>
        </interface>
        <serial type='pty'>
          <target port='0'/>
        </serial>
        <console type='pty'>
          <target type='serial' port='0'/>
        </console>
        <channel type='unix'>
          <target type='virtio' name='org.qemu.guest_agent.0'/>
        </channel>
        <channel type='spicevmc'>
          <target type='virtio' name='com.redhat.spice.0'/>
        </channel>
        <graphics type='spice' autoport='yes'>
          <listen type='address' address='127.0.0.1'/>
        </graphics>
        <video>
          <model type='virtio' heads='1'/>
        </video>
        <input type='tablet' bus='usb'/>
        <memballoon model='virtio' freePageReporting='on'/>
        <rng model='virtio'>
          <backend model='random'>/dev/urandom</backend>
        </rng>
      </devices>
    </domain>
  '';
in {
  virtualisation.libvirtd = {
    enable = true;
    qemu.runAsRoot = false;
    # Guests are started through their autostart flag only, and shut down
    # (instead of suspended to disk) when the server goes down
    onBoot = "ignore";
    onShutdown = "shutdown";
  };

  # virsh and virt-manager (qemu+ssh://) without root
  users.users.${user}.extraGroups = ["libvirtd"];

  # NVRAM (EFI variables) of the guest and libvirt's own state
  environment.persistence.${persistRoot}.directories = ["/var/lib/libvirt"];

  systemd.services = {
    nico-devbox-vm = {
      description = "Define and start the libvirt VM ${name}";
      wantedBy = ["multi-user.target"];
      requires = ["libvirtd.service"];
      after = ["libvirtd.service" "zfs.target"];
      path = [pkgs.zfs pkgs.systemd];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        if ! zfs list ${zvol} >/dev/null 2>&1; then
          zfs create -p -s -V ${zvolSize} -o volmode=dev -o com.sun:auto-snapshot=false ${zvol}
          udevadm settle
        fi

        ${virsh} net-define ${networkXml}
        ${virsh} net-autostart ${network}
        if ! ${virsh} net-list --name | grep -qx ${network}; then
          ${virsh} net-start ${network}
        fi

        ${virsh} define ${domainXml}
        ${virsh} autostart ${name}
        if ! ${virsh} list --name | grep -qx ${name}; then
          ${virsh} start ${name}
        fi
      '';
    };

    # Docker sets the iptables FORWARD policy to DROP, which would also
    # block the VM's traffic. DOCKER-USER is Docker's hook for custom rules.
    nico-devbox-docker-forward = {
      description = "Allow forwarding for the VM ${name} past Docker's FORWARD policy";
      wantedBy = ["docker.service"];
      after = ["docker.service"];
      partOf = ["docker.service"];
      path = [pkgs.iptables];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        for dir in -i -o; do
          iptables -C DOCKER-USER "$dir" ${bridge} -j ACCEPT 2>/dev/null \
            || iptables -I DOCKER-USER "$dir" ${bridge} -j ACCEPT
        done
      '';
      preStop = ''
        for dir in -i -o; do
          iptables -D DOCKER-USER "$dir" ${bridge} -j ACCEPT || true
        done
      '';
    };
  };

  networking = {
    nat = {
      enable = true;
      internalInterfaces = [bridge];
    };

    networkmanager.unmanaged = ["interface-name:${bridge}" "interface-name:vnet*"];

    # DHCP/DNS of libvirt's dnsmasq, and the VM may reach all services of
    # the server (Docker stacks, Caddy, SSH)
    firewall.trustedInterfaces = [bridge];

    # SSH and RDP from the LAN to the VM through host ports 2223 and 3390
    nftables.tables.nico-devbox-forward = {
      family = "inet";
      content = ''
        chain prerouting {
          type nat hook prerouting priority dstnat; policy accept;
          ip saddr ${lanSubnet} fib daddr type local tcp dport ${toString sshPort} dnat ip to ${vmAddress}:22
          ip saddr ${lanSubnet} fib daddr type local tcp dport ${toString rdpPort} dnat ip to ${vmAddress}:3389
        }
      '';
    };
  };
}
