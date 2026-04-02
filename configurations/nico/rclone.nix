# Rclone Nextcloud Mount
#
# Mounts the private Nextcloud folder from nextcloud.welles.app at ~/Nextcloud
# using rclone's WebDAV backend with full VFS caching (virtual files).
# Password is read at runtime from a sops-managed secret.
{
  config,
  pkgs,
  user,
  ...
}: let
  mountPoint = "/home/${user}/Nextcloud";
  nextcloudUsernameFile = config.sops.secrets."nextcloud-username".path;
  nextcloudPasswordFile = config.sops.secrets."nextcloud-password".path;
in {
  sops.secrets."nextcloud-username" = {
    sopsFile = ./secrets.yaml;
    owner = user;
    mode = "0400";
  };

  sops.secrets."nextcloud-password" = {
    sopsFile = ./secrets.yaml;
    owner = user;
    mode = "0400";
  };

  environment.systemPackages = [pkgs.rclone];

  systemd.services."rclone-nextcloud" = {
    description = "Rclone Nextcloud WebDAV mount";
    after = ["network-online.target"];
    wants = ["network-online.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "notify";
      User = user;
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${mountPoint}";
      ExecStart = "${pkgs.writeShellScript "rclone-nextcloud-start" ''
        nc_user=$(cat ${nextcloudUsernameFile})
        obscured_pass=$(${pkgs.rclone}/bin/rclone obscure "$(cat ${nextcloudPasswordFile})")
        exec ${pkgs.rclone}/bin/rclone mount \
          ":webdav,url=https://nextcloud.welles.app/remote.php/dav/files/$nc_user/,vendor=nextcloud,user=$nc_user,pass=$obscured_pass" \
          ${mountPoint} \
          --vfs-cache-mode full \
          --vfs-cache-max-age 24h \
          --dir-cache-time 5m \
          --transfers 8 \
          --no-update-modtime
      ''}";
      ExecStop = "-${pkgs.fuse3}/bin/fusermount3 -u ${mountPoint}";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
