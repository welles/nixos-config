# libvirt VMs on ZFS zvols
#
# Runs the guests in `libvirtVms` as libvirt/KVM domains. The host only
# provides the virtual hardware; each guest's system and data live on its
# own disk and are deployed separately. Per guest (`libvirtVms.<name>`:
# uuid, macAddress, memoryGiB, vcpus, diskSize, virtiofsShares):
#
#   - Disk: sparse zvol <pool>/vms/<name> (volmode=dev, so the host never
#     scans the guest's partitions or ZFS pool), handed to the guest as
#     virtio disk with serial <name>
#   - Storage: `virtiofsShares` maps virtiofs tags to host directories,
#     passed through with permissions 1:1 (the guest mounts them, see
#     virtiofs-mounts.nix). virtiofs needs the guest's memory to be
#     shareable (memoryBacking below).
#   - Network: bridged into the LAN through the LAN bridge
#     (networkmanager-lan-bridge.nix), so the guest is a normal device for
#     the router: it gets its address via DHCP (fix it there by the MAC
#     address), registers its hostname and reaches the host like any other
#     machine.
#   - The domain is defined from the XML below on every start of
#     libvirt-vm-<name>.service (and whenever it changes), which then starts
#     the VM itself. libvirt's autostart flag stays off: it would start the
#     VM with the previously persisted definition before this service runs,
#     so a reboot would not pick up changes to the domain. Changes to the
#     domain take effect on the next start of the VM; while it is running, a
#     `virsh shutdown` and `virsh start` are needed.
#   - Consoles: `virsh console <name>` (serial) or virt-manager with the
#     connection qemu+ssh://<user>@<host>/system (SPICE, only listening on
#     localhost, tunnelled through SSH)
#   - Installation: an ISO at /var/lib/libvirt/images/nixos-installer.iso
#     is attached as optional CD-ROM and boots while the disk is still
#     empty.
{
  config,
  lib,
  pkgs,
  pool,
  lanBridge,
  libvirtVms,
  ...
}: let
  installerIso = "/var/lib/libvirt/images/nixos-installer.iso";
  virsh = "${config.virtualisation.libvirtd.package}/bin/virsh";

  # One virtiofs device per entry of virtiofsShares (tag = directory)
  filesystems = vm:
    lib.concatStrings (lib.mapAttrsToList (tag: dir: ''
        <filesystem type='mount' accessmode='passthrough'>
          <driver type='virtiofs'/>
          <source dir='${dir}'/>
          <target dir='${tag}'/>
        </filesystem>
      '')
      vm.virtiofsShares);

  domainXml = name: vm:
    pkgs.writeText "${name}.xml" ''
      <domain type='kvm'>
        <name>${name}</name>
        <uuid>${vm.uuid}</uuid>
        <memory unit='GiB'>${toString vm.memoryGiB}</memory>
        <memoryBacking>
          <source type='memfd'/>
          <access mode='shared'/>
        </memoryBacking>
        <vcpu>${toString vm.vcpus}</vcpu>
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
            <source dev='/dev/zvol/${pool}/vms/${name}'/>
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
        ${filesystems vm}
          <interface type='bridge'>
            <source bridge='${lanBridge.name}'/>
            <mac address='${vm.macAddress}'/>
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

  vmService = name: vm: let
    zvol = "${pool}/vms/${name}";
  in {
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
        zfs create -p -s -V ${vm.diskSize} -o volmode=dev -o com.sun:auto-snapshot=false ${zvol}
        udevadm settle
      fi

      ${virsh} define ${domainXml name vm}
      ${virsh} autostart --disable ${name}
      if ! ${virsh} list --name | grep -qx ${name}; then
        ${virsh} start ${name}
      fi
    '';
  };
in {
  imports = [
    ./libvirtd.nix
    ./networkmanager-lan-bridge.nix
  ];

  systemd.services = lib.mapAttrs' (name: vm: lib.nameValuePair "libvirt-vm-${name}" (vmService name vm)) libvirtVms;
}
