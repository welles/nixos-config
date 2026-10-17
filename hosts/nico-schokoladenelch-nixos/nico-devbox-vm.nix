# Development Desktop VM (libvirt) for nico-devbox-nixos
#
# Runs the NixOS host nico-devbox-nixos (hosts/nico-devbox-nixos) as a
# libvirt/KVM guest. The server only provides the virtual hardware; the
# guest's system, Nix store and data live on its own disk and are deployed
# separately.
#
#   - Disk: sparse zvol bucket/vms/nico-devbox-nixos (volmode=dev, so the
#     server never scans the guest's partitions or ZFS pool), handed to the
#     guest as virtio disk with serial "nico-devbox-nixos"
#   - Storage: the tank datasets listed in
#     hosts/nico-devbox-nixos/tank-shares.nix are passed through over
#     virtiofs (tag tank-<name>, permissions 1:1); the guest mounts them in
#     hosts/nico-devbox-nixos/tank-mounts.nix. virtiofs needs the guest's
#     memory to be shareable (memoryBacking below).
#   - Network: bridged into the LAN through br0 (networking.nix), so the
#     guest is a normal device for the router: it gets its address via DHCP
#     from the Fritzbox (fix it there by the MAC address below), registers
#     its hostname there and reaches the server like any other machine.
#   - The domain is defined from the XML below on every start of
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
  lib,
  pkgs,
  persistRoot,
  user,
  ...
}: let
  name = "nico-devbox-nixos";
  zvol = "bucket/vms/${name}";
  # Same size as in disk-configuration.nix
  zvolSize = "256G";
  # LAN bridge of the server (networking.nix)
  bridge = "br0";
  vmMac = "52:54:00:c9:00:0a";
  installerIso = "/var/lib/libvirt/images/nixos-installer.iso";
  tankShares = import ../nico-devbox-nixos/tank-shares.nix;
  virsh = "${config.virtualisation.libvirtd.package}/bin/virsh";

  domainXml = pkgs.writeText "${name}.xml" ''
    <domain type='kvm'>
      <name>${name}</name>
      <uuid>dfbb1886-3174-4fc4-9eb9-2c2a41061745</uuid>
      <memory unit='GiB'>16</memory>
      <memoryBacking>
        <source type='memfd'/>
        <access mode='shared'/>
      </memoryBacking>
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
        ${lib.concatMapStrings (share: ''
        <filesystem type='mount' accessmode='passthrough'>
          <driver type='virtiofs'/>
          <source dir='/mnt/tank/${share}'/>
          <target dir='tank-${share}'/>
        </filesystem>
      '')
      tankShares}
        <interface type='bridge'>
          <source bridge='${bridge}'/>
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
    qemu = {
      runAsRoot = false;
      # virtiofsd for the <filesystem> devices of the domain
      vhostUserPackages = [pkgs.virtiofsd];
    };
    # Guests are started through their autostart flag only, and shut down
    # (instead of suspended to disk) when the server goes down
    onBoot = "ignore";
    onShutdown = "shutdown";
  };

  # virsh and virt-manager (qemu+ssh://) without root
  users.users.${user}.extraGroups = ["libvirtd"];

  environment.persistence.${persistRoot} = {
    # NVRAM (EFI variables) of the guest and libvirt's own state
    directories = ["/var/lib/libvirt"];
    # systemd's host key for encrypted credentials: libvirtd loads its
    # secrets-encryption-key (in /var/lib/libvirt/secrets) with
    # LoadCredentialEncrypted, which fails once the key it was encrypted
    # with is gone. Must exist on the persist dataset before it is first
    # bound here, impermanence links missing files only.
    files = ["/var/lib/systemd/credential.secret"];
  };

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

        ${virsh} define ${domainXml}
        ${virsh} autostart ${name}
        if ! ${virsh} list --name | grep -qx ${name}; then
          ${virsh} start ${name}
        fi
      '';
    };

    # Docker loads br_netfilter, so bridged traffic between the LAN and the
    # VM passes iptables' FORWARD chain, whose policy Docker sets to DROP.
    # DOCKER-USER is Docker's hook for custom rules.
    nico-devbox-docker-forward = {
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
  };

  # libvirt's tap devices of bridged guests
  networking.networkmanager.unmanaged = ["interface-name:vnet*"];
}
