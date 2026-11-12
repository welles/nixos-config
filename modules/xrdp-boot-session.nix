# Starts the primary user's xrdp desktop session at boot, so the desktop and
# its autostart programs are running before anyone connects over RDP. A later
# RDP login of the user takes over this session instead of starting a new one
# (sesman reconnects sessions of the same user and colour depth, and
# KillDisconnected stays off, so the session also outlives disconnects).
#
# The session logs in with the plaintext user-password from sops
# (user-password-plaintext.nix), like an RDP login would: PAM unlocks the GNOME
# keyring with it (xrdp.nix), so programs that keep logins there work without
# anyone typing the password after a reboot.
#
# sesman only reconnects a session if the colour depth matches, and RDP
# clients ask for different ones (FreeRDP and mstsc 32 bit, Guacamole 16 bit
# unless configured). Xorg sessions don't use the depth at all (xorgxrdp
# always runs at 24 bit), so xrdp reports 24 bit for every Xorg session
# (`xserverbpp`), and the boot session starts with it too.
#
# If the user logs out of the desktop, the next RDP login starts a new session
# as usual; the boot session comes back with the next boot.
{
  config,
  pkgs,
  user,
  ...
}: let
  cfg = config.services.xrdp;
  bpp = 24;
in {
  imports = [
    ./xrdp.nix
    ./user-password-plaintext.nix
  ];

  services.xrdp.package = pkgs.xrdp.overrideAttrs (old: {
    postInstall =
      old.postInstall
      + ''
        substituteInPlace $out/etc/xrdp/xrdp.ini \
          --replace-fail '[Xorg]' '[Xorg]
        xserverbpp=${toString bpp}'
      '';
  });

  systemd.services.xrdp-boot-session = {
    description = "Start the xrdp desktop session of ${user}";
    wantedBy = ["multi-user.target"];
    # The session's programs (Claude Desktop, …) expect a working network
    wants = ["network-online.target"];
    after = ["xrdp-sesman.service" "network-online.target"];
    requires = ["xrdp-sesman.service"];
    # A second run would only reconnect to the session; don't do that on
    # every rebuild
    restartIfChanged = false;
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      # sesman may not listen yet right after its unit started
      Restart = "on-failure";
      RestartSec = "5s";
    };
    script = ''
      exec ${cfg.package}/bin/xrdp-sesrun \
        -c ${cfg.confDir}/sesman.ini \
        -t Xorg -b ${toString bpp} -g 1920x1080 \
        -F 3 ${user} 3< ${config.sops.secrets."user-password".path}
    '';
  };
}
