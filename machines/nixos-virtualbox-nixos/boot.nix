# ZFS Boot Configuration
#
# On every boot, the ZFS root dataset (zroot/root) is rolled back to its
# blank snapshot, achieving "erase your darlings" impermanence.
{pkgs, ...}: {
  boot = {
    initrd = {
      supportedFilesystems = ["zfs"];
      systemd.services.rollback-root = {
        description = "Rollback ZFS root dataset to a blank snapshot";
        wantedBy = ["initrd.target"];
        after = ["zfs-import-zroot.service"];
        before = ["sysroot.mount"];
        path = [pkgs.zfs];
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = ''
          echo ""
          echo -e "\e[1;97;44m======================================================\e[0m"
          echo -e "\e[1;97;44m===           ZFS IMPERMANENCE ROLLBACK            ===\e[0m"
          echo -e "\e[1;97;44m======================================================\e[0m"
          echo ""
          if zfs rollback -r zroot/root@blank; then
            echo -e "    \e[1;30;42m  [ OK ]  \e[0m  \e[1;32mzroot/root rolled back to @blank\e[0m"
          else
            echo -e "    \e[1;97;41m  [FAIL]  \e[0m  \e[1;31mno blank snapshot found for zroot/root\e[0m"
          fi
          echo ""
        '';
      };
    };

    supportedFilesystems = ["zfs"];
    zfs = {
      forceImportAll = true;
      devNodes = "/dev/disk/by-id";
    };

    loader = {
      systemd-boot.enable = true;
      # VirtualBox EFI NVRAM is limited; disabling this prevents bootctl from
      # failing to write boot entries, which would leave the system unbootable.
      efi.canTouchEfiVariables = false;
    };
  };

  # ZFS requires a unique hostId per machine
  networking.hostId = "1a2b3c4d";
}
