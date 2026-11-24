# Control center
#
# A web page to keep this server and its libvirt VMs (`libvirtVms`) up to
# date and to restart them: status (NixOS generation and commit, pending
# reboot, failed units, ZFS, UPS, Docker), nixos-diff, nh switch and nh boot
# with their live log, reboot and power off of the server, start, shut down,
# reboot and force off of the VMs.
#
#   - control-center.service (server.py, index.html): unprivileged web server
#     on 127.0.0.1:${port}, published by the Cloudflare Tunnel behind
#     Cloudflare Access (cloudflare/apps.tf). It checks Access's JWT itself
#     against `controlCenterAccess` (teamDomain; audience: the application's
#     AUD tag, `./tofu.sh output access_audiences`). While the audience is
#     null, the web server refuses every request.
#   - control-center-helper.service (helper.py): runs as root behind the
#     socket /run/control-center-helper.sock, which only the web server may
#     use, and accepts only the fixed commands above: `nixos-control`
#     (modules/nixos-control) on the server directly, in the VMs through the
#     QEMU guest agent, and virsh for the VMs themselves. A VM therefore
#     needs modules/nixos-control and the guest agent (services.qemuGuest).
{
  config,
  lib,
  pkgs,
  libvirtVms,
  controlCenterAccess,
  ...
}: let
  port = 50250;
  socket = "/run/control-center-helper.sock";
  vms = builtins.toJSON (lib.attrNames libvirtVms);

  helper = pkgs.writers.writePython3Bin "control-center-helper" {
    flakeIgnore = ["E501"];
  } (builtins.readFile ./helper.py);

  server = pkgs.writers.writePython3Bin "control-center" {
    libraries = [pkgs.python3Packages.pyjwt pkgs.python3Packages.cryptography];
    flakeIgnore = ["E501"];
  } (builtins.readFile ./server.py);
in {
  imports = [
    # The server's own diff, switch and boot units
    ../nixos-control
  ];

  users = {
    users.control-center = {
      isSystemUser = true;
      group = "control-center";
    };
    groups.control-center = {};
  };

  systemd.sockets.control-center-helper = {
    description = "Socket of the control center's privileged helper";
    wantedBy = ["sockets.target"];
    listenStreams = [socket];
    socketConfig = {
      SocketUser = "root";
      SocketGroup = "control-center";
      SocketMode = "0660";
    };
  };

  systemd.services = {
    control-center-helper = {
      description = "Privileged helper of the control center";
      requires = ["control-center-helper.socket"];
      after = ["control-center-helper.socket" "libvirtd.service"];
      path = [config.virtualisation.libvirtd.package pkgs.systemd];
      environment.CONTROL_CENTER_VMS = vms;
      serviceConfig = {
        ExecStart = lib.getExe helper;
        Restart = "on-failure";
      };
    };

    control-center = {
      description = "Control center web server";
      wantedBy = ["multi-user.target"];
      wants = ["network-online.target"];
      after = ["network-online.target" "control-center-helper.socket"];
      environment = {
        CONTROL_CENTER_PORT = toString port;
        SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
        CONTROL_CENTER_HELPER_SOCKET = socket;
        CONTROL_CENTER_INDEX = "${./index.html}";
        CONTROL_CENTER_VMS = vms;
        CONTROL_CENTER_ACCESS_TEAM_DOMAIN = controlCenterAccess.teamDomain;
        CONTROL_CENTER_ACCESS_AUDIENCE =
          if controlCenterAccess.audience == null
          then ""
          else controlCenterAccess.audience;
      };
      serviceConfig = {
        ExecStart = lib.getExe server;
        User = "control-center";
        Group = "control-center";
        Restart = "always";
        RestartSec = "5s";
        # Needs nothing but the network and the helper's socket
        CapabilityBoundingSet = "";
        LockPersonality = true;
        NoNewPrivileges = true;
        PrivateDevices = true;
        PrivateTmp = true;
        ProtectClock = true;
        ProtectControlGroups = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectSystem = "strict";
        RestrictAddressFamilies = ["AF_UNIX" "AF_INET" "AF_INET6"];
        RestrictNamespaces = true;
        RestrictRealtime = true;
        SystemCallArchitectures = "native";
        SystemCallFilter = ["@system-service" "~@privileged"];
      };
    };
  };
}
