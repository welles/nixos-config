# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    nl7w03h94xb534ln4n72kq1kvrphya61s_flake_nix["`**flake.nix**

_l7w03h94xb534ln4n72kq1kvrphya61s_`"]
    nhkbs0pazyvy2i421qspvb19vbv1w549j_module_nix["`**module.nix**

_hkbs0pazyvy2i421qspvb19vbv1w549j_`"]
    nhkbs0pazyvy2i421qspvb19vbv1w549j_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_hkbs0pazyvy2i421qspvb19vbv1w549j_`"]
    nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops["`**modules/sops**

_j8ipwxkax4l2hz7j9hwqx2f6h9xa150x_`"]
    nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops_templates["`**modules/sops/templates**

_j8ipwxkax4l2hz7j9hwqx2f6h9xa150x_`"]
    nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_j8ipwxkax4l2hz7j9hwqx2f6h9xa150x_`"]
    n25yqaplj03nf557p3w0q30f7wh85nvql_nixos["`**nixos**

_25yqaplj03nf557p3w0q30f7wh85nvql_`"]
    n25yqaplj03nf557p3w0q30f7wh85nvql_nixos_common_nix["`**nixos/common.nix**

_25yqaplj03nf557p3w0q30f7wh85nvql_`"]
    nvkhbna27ky8l0bbgv7yk0x926crz4560_global_nix["`**global.nix**

_vkhbna27ky8l0bbgv7yk0x926crz4560_`"]
    nvkhbna27ky8l0bbgv7yk0x926crz4560_configurations_eltern["`**configurations/eltern**

_vkhbna27ky8l0bbgv7yk0x926crz4560_`"]
    nvkhbna27ky8l0bbgv7yk0x926crz4560_modules_networkmanager_nix["`**modules/networkmanager.nix**

_vkhbna27ky8l0bbgv7yk0x926crz4560_`"]
    nvkhbna27ky8l0bbgv7yk0x926crz4560_modules_avahi_nix["`**modules/avahi.nix**

_vkhbna27ky8l0bbgv7yk0x926crz4560_`"]
    nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_vkhbna27ky8l0bbgv7yk0x926crz4560_`"]
    nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_vkhbna27ky8l0bbgv7yk0x926crz4560_`"]
    nl7w03h94xb534ln4n72kq1kvrphya61s_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_l7w03h94xb534ln4n72kq1kvrphya61s_`"]
    nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_vkhbna27ky8l0bbgv7yk0x926crz4560_`"]
    nl7w03h94xb534ln4n72kq1kvrphya61s_flake_nix --> nhkbs0pazyvy2i421qspvb19vbv1w549j_module_nix
    nl7w03h94xb534ln4n72kq1kvrphya61s_flake_nix --> nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops
    nl7w03h94xb534ln4n72kq1kvrphya61s_flake_nix --> n25yqaplj03nf557p3w0q30f7wh85nvql_nixos
    nl7w03h94xb534ln4n72kq1kvrphya61s_flake_nix --> nvkhbna27ky8l0bbgv7yk0x926crz4560_global_nix
    nl7w03h94xb534ln4n72kq1kvrphya61s_flake_nix --> nvkhbna27ky8l0bbgv7yk0x926crz4560_configurations_eltern
    nl7w03h94xb534ln4n72kq1kvrphya61s_flake_nix --> nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos
    nhkbs0pazyvy2i421qspvb19vbv1w549j_module_nix --> nhkbs0pazyvy2i421qspvb19vbv1w549j_lib_make_disk_image_nix
    nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops --> nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops_templates
    nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops --> nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops_secrets_for_users
    n25yqaplj03nf557p3w0q30f7wh85nvql_nixos --> n25yqaplj03nf557p3w0q30f7wh85nvql_nixos_common_nix
    nvkhbna27ky8l0bbgv7yk0x926crz4560_configurations_eltern --> nvkhbna27ky8l0bbgv7yk0x926crz4560_modules_networkmanager_nix
    nvkhbna27ky8l0bbgv7yk0x926crz4560_configurations_eltern --> nvkhbna27ky8l0bbgv7yk0x926crz4560_modules_avahi_nix
    nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos --> nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos_hardware_configuration_nix
    nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos --> nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos_disk_configuration_nix
    nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos_hardware_configuration_nix --> nl7w03h94xb534ln4n72kq1kvrphya61s_nixos_modules_installer_scan_not_detected_nix
    style nl7w03h94xb534ln4n72kq1kvrphya61s_flake_nix fill:#ddb2e5,color:#000000
    style nhkbs0pazyvy2i421qspvb19vbv1w549j_module_nix fill:#b2e5e0,color:#000000
    style nhkbs0pazyvy2i421qspvb19vbv1w549j_lib_make_disk_image_nix fill:#b2e5e0,color:#000000
    style nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops fill:#b2b4e5,color:#000000
    style nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops_templates fill:#b2b4e5,color:#000000
    style nj8ipwxkax4l2hz7j9hwqx2f6h9xa150x_modules_sops_secrets_for_users fill:#b2b4e5,color:#000000
    style n25yqaplj03nf557p3w0q30f7wh85nvql_nixos fill:#e5b2b5,color:#000000
    style n25yqaplj03nf557p3w0q30f7wh85nvql_nixos_common_nix fill:#e5b2b5,color:#000000
    style nvkhbna27ky8l0bbgv7yk0x926crz4560_global_nix fill:#e5bdb2,color:#000000
    style nvkhbna27ky8l0bbgv7yk0x926crz4560_configurations_eltern fill:#e5bdb2,color:#000000
    style nvkhbna27ky8l0bbgv7yk0x926crz4560_modules_networkmanager_nix fill:#e5bdb2,color:#000000
    style nvkhbna27ky8l0bbgv7yk0x926crz4560_modules_avahi_nix fill:#e5bdb2,color:#000000
    style nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos fill:#e5bdb2,color:#000000
    style nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos_hardware_configuration_nix fill:#e5bdb2,color:#000000
    style nl7w03h94xb534ln4n72kq1kvrphya61s_nixos_modules_installer_scan_not_detected_nix fill:#ddb2e5,color:#000000
    style nvkhbna27ky8l0bbgv7yk0x926crz4560_machines_eltern_asus_nixos_disk_configuration_nix fill:#e5bdb2,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_flake_nix["`**flake.nix**

_jpkhnjjj181dqs5cy8kfh4k3hvlqkycj_`"]
    n9g7s1ahmrrn7zw9s525ghyjifhnik39f_module_nix["`**module.nix**

_9g7s1ahmrrn7zw9s525ghyjifhnik39f_`"]
    n9g7s1ahmrrn7zw9s525ghyjifhnik39f_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_9g7s1ahmrrn7zw9s525ghyjifhnik39f_`"]
    n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops["`**modules/sops**

_62dkswlzr48v65a60lkj18pxzyw4vfw1_`"]
    n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops_templates["`**modules/sops/templates**

_62dkswlzr48v65a60lkj18pxzyw4vfw1_`"]
    n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_62dkswlzr48v65a60lkj18pxzyw4vfw1_`"]
    n8g1w8i8wvhj5nl1di8bv52cpxnpn805k_nixos["`**nixos**

_8g1w8i8wvhj5nl1di8bv52cpxnpn805k_`"]
    n8g1w8i8wvhj5nl1di8bv52cpxnpn805k_nixos_common_nix["`**nixos/common.nix**

_8g1w8i8wvhj5nl1di8bv52cpxnpn805k_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_global_nix["`**global.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch["`**configurations/schokoladenelch**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_docker_nix["`**modules/docker.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_networkmanager_nix["`**modules/networkmanager.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_tmux_nix["`**modules/tmux.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_check_mkv["`**modules/scripts/check-mkv**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_create_zfs_dataset["`**modules/scripts/create-zfs-dataset**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_stacks_default_nix["`**modules/stacks/default.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_jpkhnjjj181dqs5cy8kfh4k3hvlqkycj_`"]
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_s0n8hjzhgy244dkycf78g48wsd4rf23y_`"]
    njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_flake_nix --> n9g7s1ahmrrn7zw9s525ghyjifhnik39f_module_nix
    njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_flake_nix --> n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops
    njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_flake_nix --> n8g1w8i8wvhj5nl1di8bv52cpxnpn805k_nixos
    njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_flake_nix --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_global_nix
    njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_flake_nix --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch
    njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_flake_nix --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos
    n9g7s1ahmrrn7zw9s525ghyjifhnik39f_module_nix --> n9g7s1ahmrrn7zw9s525ghyjifhnik39f_lib_make_disk_image_nix
    n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops --> n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops_templates
    n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops --> n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops_secrets_for_users
    n8g1w8i8wvhj5nl1di8bv52cpxnpn805k_nixos --> n8g1w8i8wvhj5nl1di8bv52cpxnpn805k_nixos_common_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_docker_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_networkmanager_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_tmux_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_check_mkv
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_create_zfs_dataset
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_zfs_manual_snapshot
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_zfs_snapshot_diff
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_boot_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_networking_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_services_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_persistence_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_stacks_default_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos --> ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_nixos_modules_installer_scan_not_detected_nix
    style njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_flake_nix fill:#e5b2dc,color:#000000
    style n9g7s1ahmrrn7zw9s525ghyjifhnik39f_module_nix fill:#c6b2e5,color:#000000
    style n9g7s1ahmrrn7zw9s525ghyjifhnik39f_lib_make_disk_image_nix fill:#c6b2e5,color:#000000
    style n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops fill:#e5c4b2,color:#000000
    style n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops_templates fill:#e5c4b2,color:#000000
    style n62dkswlzr48v65a60lkj18pxzyw4vfw1_modules_sops_secrets_for_users fill:#e5c4b2,color:#000000
    style n8g1w8i8wvhj5nl1di8bv52cpxnpn805k_nixos fill:#e5b2b4,color:#000000
    style n8g1w8i8wvhj5nl1di8bv52cpxnpn805k_nixos_common_nix fill:#e5b2b4,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_global_nix fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_docker_nix fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_networkmanager_nix fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_tmux_nix fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_check_mkv fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_create_zfs_dataset fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_zfs_manual_snapshot fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_scripts_zfs_snapshot_diff fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_boot_nix fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_networking_nix fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_services_nix fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_configurations_schokoladenelch_persistence_nix fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_modules_stacks_default_nix fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos fill:#e5b2d1,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#e5b2d1,color:#000000
    style njpkhnjjj181dqs5cy8kfh4k3hvlqkycj_nixos_modules_installer_scan_not_detected_nix fill:#e5b2dc,color:#000000
    style ns0n8hjzhgy244dkycf78g48wsd4rf23y_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#e5b2d1,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    nngn4q8g6jf5y96g7w4035pfx63wnv3si_flake_nix["`**flake.nix**

_ngn4q8g6jf5y96g7w4035pfx63wnv3si_`"]
    nx0v6927pi5gi2b7bz2zirbagv2ykwjsw_module_nix["`**module.nix**

_x0v6927pi5gi2b7bz2zirbagv2ykwjsw_`"]
    nx0v6927pi5gi2b7bz2zirbagv2ykwjsw_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_x0v6927pi5gi2b7bz2zirbagv2ykwjsw_`"]
    nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops["`**modules/sops**

_nar0xpaaiz69c7nb6d3j87abycivmnrf_`"]
    nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops_templates["`**modules/sops/templates**

_nar0xpaaiz69c7nb6d3j87abycivmnrf_`"]
    nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_nar0xpaaiz69c7nb6d3j87abycivmnrf_`"]
    n3ryafmbpsblq3jylb1pk3x3pp7srjnzi_nixos["`**nixos**

_3ryafmbpsblq3jylb1pk3x3pp7srjnzi_`"]
    n3ryafmbpsblq3jylb1pk3x3pp7srjnzi_nixos_common_nix["`**nixos/common.nix**

_3ryafmbpsblq3jylb1pk3x3pp7srjnzi_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_global_nix["`**global.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico["`**configurations/nico**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_docker_nix["`**modules/docker.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_networkmanager_nix["`**modules/networkmanager.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_pipewire_nix["`**modules/pipewire.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_services_nix["`**configurations/nico/services.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_avahi_nix["`**modules/avahi.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_networking_nix["`**configurations/nico/networking.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nngn4q8g6jf5y96g7w4035pfx63wnv3si_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_ngn4q8g6jf5y96g7w4035pfx63wnv3si_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_eden_nix["`**modules/eden.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_nkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_`"]
    nngn4q8g6jf5y96g7w4035pfx63wnv3si_flake_nix --> nx0v6927pi5gi2b7bz2zirbagv2ykwjsw_module_nix
    nngn4q8g6jf5y96g7w4035pfx63wnv3si_flake_nix --> nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops
    nngn4q8g6jf5y96g7w4035pfx63wnv3si_flake_nix --> n3ryafmbpsblq3jylb1pk3x3pp7srjnzi_nixos
    nngn4q8g6jf5y96g7w4035pfx63wnv3si_flake_nix --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_global_nix
    nngn4q8g6jf5y96g7w4035pfx63wnv3si_flake_nix --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico
    nngn4q8g6jf5y96g7w4035pfx63wnv3si_flake_nix --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos
    nx0v6927pi5gi2b7bz2zirbagv2ykwjsw_module_nix --> nx0v6927pi5gi2b7bz2zirbagv2ykwjsw_lib_make_disk_image_nix
    nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops --> nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops_templates
    nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops --> nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops_secrets_for_users
    n3ryafmbpsblq3jylb1pk3x3pp7srjnzi_nixos --> n3ryafmbpsblq3jylb1pk3x3pp7srjnzi_nixos_common_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_docker_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_networkmanager_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_boot_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_desktop_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_audio_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_virtualisation_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_services_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_packages_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_rclone_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_networking_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_audio_nix --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_pipewire_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_services_nix --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_avahi_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos_hardware_configuration_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_eden_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos --> nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_xone_dongle_nix
    nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos_hardware_configuration_nix --> nngn4q8g6jf5y96g7w4035pfx63wnv3si_nixos_modules_installer_scan_not_detected_nix
    style nngn4q8g6jf5y96g7w4035pfx63wnv3si_flake_nix fill:#b5e5b2,color:#000000
    style nx0v6927pi5gi2b7bz2zirbagv2ykwjsw_module_nix fill:#e5ccb2,color:#000000
    style nx0v6927pi5gi2b7bz2zirbagv2ykwjsw_lib_make_disk_image_nix fill:#e5ccb2,color:#000000
    style nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops fill:#e2e5b2,color:#000000
    style nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops_templates fill:#e2e5b2,color:#000000
    style nnar0xpaaiz69c7nb6d3j87abycivmnrf_modules_sops_secrets_for_users fill:#e2e5b2,color:#000000
    style n3ryafmbpsblq3jylb1pk3x3pp7srjnzi_nixos fill:#b2e5c7,color:#000000
    style n3ryafmbpsblq3jylb1pk3x3pp7srjnzi_nixos_common_nix fill:#b2e5c7,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_global_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_docker_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_networkmanager_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_boot_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_desktop_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_audio_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_pipewire_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_virtualisation_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_services_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_avahi_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_packages_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_rclone_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_configurations_nico_networking_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#e5b2c0,color:#000000
    style nngn4q8g6jf5y96g7w4035pfx63wnv3si_nixos_modules_installer_scan_not_detected_nix fill:#b5e5b2,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_eden_nix fill:#e5b2c0,color:#000000
    style nnkl7cl8d0wz1rdx4jj4a6p8bbd10wk7g_modules_xone_dongle_nix fill:#e5b2c0,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    nxg5vdj82waixq6gxbq16bn7wv62s19aj_flake_nix["`**flake.nix**

_xg5vdj82waixq6gxbq16bn7wv62s19aj_`"]
    n59bmhr5yvcv7xh606faak3i1v93sl3x6_module_nix["`**module.nix**

_59bmhr5yvcv7xh606faak3i1v93sl3x6_`"]
    n59bmhr5yvcv7xh606faak3i1v93sl3x6_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_59bmhr5yvcv7xh606faak3i1v93sl3x6_`"]
    n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops["`**modules/sops**

_84m321cnpq2sqxqxgy78zx4nlq6q8k0z_`"]
    n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops_templates["`**modules/sops/templates**

_84m321cnpq2sqxqxgy78zx4nlq6q8k0z_`"]
    n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_84m321cnpq2sqxqxgy78zx4nlq6q8k0z_`"]
    nspsnfmbj9bcml3npjdb5ah1nsdpjmhdq_nixos["`**nixos**

_spsnfmbj9bcml3npjdb5ah1nsdpjmhdq_`"]
    nspsnfmbj9bcml3npjdb5ah1nsdpjmhdq_nixos_common_nix["`**nixos/common.nix**

_spsnfmbj9bcml3npjdb5ah1nsdpjmhdq_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_global_nix["`**global.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico["`**configurations/nico**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_docker_nix["`**modules/docker.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_networkmanager_nix["`**modules/networkmanager.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_pipewire_nix["`**modules/pipewire.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_services_nix["`**configurations/nico/services.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_avahi_nix["`**modules/avahi.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_networking_nix["`**configurations/nico/networking.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nxg5vdj82waixq6gxbq16bn7wv62s19aj_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_xg5vdj82waixq6gxbq16bn7wv62s19aj_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_disk_configuration_nix["`**machines/nico-thinkpad-nixos/disk-configuration.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_impermanence_nix["`**machines/nico-thinkpad-nixos/impermanence.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_njs5kf37rl451s1cca4kmv8zfi8qmfnk_`"]
    nxg5vdj82waixq6gxbq16bn7wv62s19aj_flake_nix --> n59bmhr5yvcv7xh606faak3i1v93sl3x6_module_nix
    nxg5vdj82waixq6gxbq16bn7wv62s19aj_flake_nix --> n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops
    nxg5vdj82waixq6gxbq16bn7wv62s19aj_flake_nix --> nspsnfmbj9bcml3npjdb5ah1nsdpjmhdq_nixos
    nxg5vdj82waixq6gxbq16bn7wv62s19aj_flake_nix --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_global_nix
    nxg5vdj82waixq6gxbq16bn7wv62s19aj_flake_nix --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico
    nxg5vdj82waixq6gxbq16bn7wv62s19aj_flake_nix --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos
    n59bmhr5yvcv7xh606faak3i1v93sl3x6_module_nix --> n59bmhr5yvcv7xh606faak3i1v93sl3x6_lib_make_disk_image_nix
    n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops --> n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops_templates
    n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops --> n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops_secrets_for_users
    nspsnfmbj9bcml3npjdb5ah1nsdpjmhdq_nixos --> nspsnfmbj9bcml3npjdb5ah1nsdpjmhdq_nixos_common_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_docker_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_networkmanager_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_boot_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_desktop_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_audio_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_virtualisation_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_services_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_packages_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_rclone_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_networking_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_audio_nix --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_pipewire_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_services_nix --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_avahi_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_hardware_configuration_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_disk_configuration_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_impermanence_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos --> nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_mobile_network_nix
    nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_hardware_configuration_nix --> nxg5vdj82waixq6gxbq16bn7wv62s19aj_nixos_modules_installer_scan_not_detected_nix
    style nxg5vdj82waixq6gxbq16bn7wv62s19aj_flake_nix fill:#b2e5cd,color:#000000
    style n59bmhr5yvcv7xh606faak3i1v93sl3x6_module_nix fill:#e5c4b2,color:#000000
    style n59bmhr5yvcv7xh606faak3i1v93sl3x6_lib_make_disk_image_nix fill:#e5c4b2,color:#000000
    style n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops fill:#b2c6e5,color:#000000
    style n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops_templates fill:#b2c6e5,color:#000000
    style n84m321cnpq2sqxqxgy78zx4nlq6q8k0z_modules_sops_secrets_for_users fill:#b2c6e5,color:#000000
    style nspsnfmbj9bcml3npjdb5ah1nsdpjmhdq_nixos fill:#c5e5b2,color:#000000
    style nspsnfmbj9bcml3npjdb5ah1nsdpjmhdq_nixos_common_nix fill:#c5e5b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_global_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_docker_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_networkmanager_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_boot_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_desktop_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_audio_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_pipewire_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_virtualisation_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_services_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_modules_avahi_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_packages_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_rclone_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_configurations_nico_networking_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#e5e3b2,color:#000000
    style nxg5vdj82waixq6gxbq16bn7wv62s19aj_nixos_modules_installer_scan_not_detected_nix fill:#b2e5cd,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_disk_configuration_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_impermanence_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#e5e3b2,color:#000000
    style nnjs5kf37rl451s1cca4kmv8zfi8qmfnk_machines_nico_thinkpad_nixos_mobile_network_nix fill:#e5e3b2,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    nzj0zq93kkh8rxsgldip84rlp1ivwf6ni_flake_nix["`**flake.nix**

_zj0zq93kkh8rxsgldip84rlp1ivwf6ni_`"]
    nds20qsja69i21bbfdy9nydgidhsnm7gq_module_nix["`**module.nix**

_ds20qsja69i21bbfdy9nydgidhsnm7gq_`"]
    nds20qsja69i21bbfdy9nydgidhsnm7gq_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_ds20qsja69i21bbfdy9nydgidhsnm7gq_`"]
    ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops["`**modules/sops**

_gyifr2nzdpwajzg81igjr7wng44yx1nx_`"]
    ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops_templates["`**modules/sops/templates**

_gyifr2nzdpwajzg81igjr7wng44yx1nx_`"]
    ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_gyifr2nzdpwajzg81igjr7wng44yx1nx_`"]
    n9w0gx1jbj50aidlzg29wn20azf26w2g7_nixos["`**nixos**

_9w0gx1jbj50aidlzg29wn20azf26w2g7_`"]
    n9w0gx1jbj50aidlzg29wn20azf26w2g7_nixos_common_nix["`**nixos/common.nix**

_9w0gx1jbj50aidlzg29wn20azf26w2g7_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_global_nix["`**global.nix**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_configurations_nixos["`**configurations/nixos**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_modules_docker_nix["`**modules/docker.nix**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_modules_headlamp_nix["`**modules/headlamp.nix**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_modules_tmux_nix["`**modules/tmux.nix**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_`"]
    nzj0zq93kkh8rxsgldip84rlp1ivwf6ni_flake_nix --> nds20qsja69i21bbfdy9nydgidhsnm7gq_module_nix
    nzj0zq93kkh8rxsgldip84rlp1ivwf6ni_flake_nix --> ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops
    nzj0zq93kkh8rxsgldip84rlp1ivwf6ni_flake_nix --> n9w0gx1jbj50aidlzg29wn20azf26w2g7_nixos
    nzj0zq93kkh8rxsgldip84rlp1ivwf6ni_flake_nix --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_global_nix
    nzj0zq93kkh8rxsgldip84rlp1ivwf6ni_flake_nix --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_configurations_nixos
    nzj0zq93kkh8rxsgldip84rlp1ivwf6ni_flake_nix --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos
    nds20qsja69i21bbfdy9nydgidhsnm7gq_module_nix --> nds20qsja69i21bbfdy9nydgidhsnm7gq_lib_make_disk_image_nix
    ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops --> ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops_templates
    ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops --> ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops_secrets_for_users
    n9w0gx1jbj50aidlzg29wn20azf26w2g7_nixos --> n9w0gx1jbj50aidlzg29wn20azf26w2g7_nixos_common_nix
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_configurations_nixos --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_modules_docker_nix
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_configurations_nixos --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_modules_headlamp_nix
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_configurations_nixos --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_modules_tmux_nix
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_disk_configuration_nix
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_boot_nix
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_desktop_nix
    n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos --> n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_persistence_nix
    style nzj0zq93kkh8rxsgldip84rlp1ivwf6ni_flake_nix fill:#bab2e5,color:#000000
    style nds20qsja69i21bbfdy9nydgidhsnm7gq_module_nix fill:#e5b4b2,color:#000000
    style nds20qsja69i21bbfdy9nydgidhsnm7gq_lib_make_disk_image_nix fill:#e5b4b2,color:#000000
    style ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops fill:#b2e5b3,color:#000000
    style ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops_templates fill:#b2e5b3,color:#000000
    style ngyifr2nzdpwajzg81igjr7wng44yx1nx_modules_sops_secrets_for_users fill:#b2e5b3,color:#000000
    style n9w0gx1jbj50aidlzg29wn20azf26w2g7_nixos fill:#e5dcb2,color:#000000
    style n9w0gx1jbj50aidlzg29wn20azf26w2g7_nixos_common_nix fill:#e5dcb2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_global_nix fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_configurations_nixos fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_modules_docker_nix fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_modules_headlamp_nix fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_modules_tmux_nix fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_boot_nix fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_desktop_nix fill:#dae5b2,color:#000000
    style n2p1qpmhwclwkqrl6vfbf0yh5q06gj22y_machines_nixos_virtualbox_nixos_persistence_nix fill:#dae5b2,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    nciwgqzsx31qj0jcf750d2ry5rvirvv2i_flake_nix["`**flake.nix**

_ciwgqzsx31qj0jcf750d2ry5rvirvv2i_`"]
    nggh7plj0gccv38rh79sx4cn3a5hbypwc_module_nix["`**module.nix**

_ggh7plj0gccv38rh79sx4cn3a5hbypwc_`"]
    nggh7plj0gccv38rh79sx4cn3a5hbypwc_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_ggh7plj0gccv38rh79sx4cn3a5hbypwc_`"]
    nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops["`**modules/sops**

_w6p1wzi8iz283gsm0va19k59bbah5jpg_`"]
    nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops_templates["`**modules/sops/templates**

_w6p1wzi8iz283gsm0va19k59bbah5jpg_`"]
    nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_w6p1wzi8iz283gsm0va19k59bbah5jpg_`"]
    nmkm3fvjxd0sw1pypq8j9bfqr6zpkbx08_nixos["`**nixos**

_mkm3fvjxd0sw1pypq8j9bfqr6zpkbx08_`"]
    nmkm3fvjxd0sw1pypq8j9bfqr6zpkbx08_nixos_common_nix["`**nixos/common.nix**

_mkm3fvjxd0sw1pypq8j9bfqr6zpkbx08_`"]
    nscswxv978a5jw2may1qymkfg3nfk8zdj_global_nix["`**global.nix**

_scswxv978a5jw2may1qymkfg3nfk8zdj_`"]
    nscswxv978a5jw2may1qymkfg3nfk8zdj_configurations_nixos["`**configurations/nixos**

_scswxv978a5jw2may1qymkfg3nfk8zdj_`"]
    nscswxv978a5jw2may1qymkfg3nfk8zdj_modules_docker_nix["`**modules/docker.nix**

_scswxv978a5jw2may1qymkfg3nfk8zdj_`"]
    nscswxv978a5jw2may1qymkfg3nfk8zdj_modules_headlamp_nix["`**modules/headlamp.nix**

_scswxv978a5jw2may1qymkfg3nfk8zdj_`"]
    nscswxv978a5jw2may1qymkfg3nfk8zdj_modules_tmux_nix["`**modules/tmux.nix**

_scswxv978a5jw2may1qymkfg3nfk8zdj_`"]
    nscswxv978a5jw2may1qymkfg3nfk8zdj_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_scswxv978a5jw2may1qymkfg3nfk8zdj_`"]
    nscswxv978a5jw2may1qymkfg3nfk8zdj_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_scswxv978a5jw2may1qymkfg3nfk8zdj_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules["`**modules**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_build_tarball_nix["`**modules/build-tarball.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_interop_nix["`**modules/interop.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_recovery_nix["`**modules/recovery.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd["`**modules/systemd**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd_native["`**modules/systemd/native**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_usbip_nix["`**modules/usbip.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_version_nix["`**modules/version.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_welcome_nix["`**modules/welcome.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_kngcl6jm72a45c9md6bz620kw1xfia6g_`"]
    nciwgqzsx31qj0jcf750d2ry5rvirvv2i_flake_nix --> nggh7plj0gccv38rh79sx4cn3a5hbypwc_module_nix
    nciwgqzsx31qj0jcf750d2ry5rvirvv2i_flake_nix --> nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops
    nciwgqzsx31qj0jcf750d2ry5rvirvv2i_flake_nix --> nmkm3fvjxd0sw1pypq8j9bfqr6zpkbx08_nixos
    nciwgqzsx31qj0jcf750d2ry5rvirvv2i_flake_nix --> nscswxv978a5jw2may1qymkfg3nfk8zdj_global_nix
    nciwgqzsx31qj0jcf750d2ry5rvirvv2i_flake_nix --> nscswxv978a5jw2may1qymkfg3nfk8zdj_configurations_nixos
    nciwgqzsx31qj0jcf750d2ry5rvirvv2i_flake_nix --> nscswxv978a5jw2may1qymkfg3nfk8zdj_machines_nixos_wsl_nixos
    nggh7plj0gccv38rh79sx4cn3a5hbypwc_module_nix --> nggh7plj0gccv38rh79sx4cn3a5hbypwc_lib_make_disk_image_nix
    nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops --> nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops_templates
    nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops --> nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops_secrets_for_users
    nmkm3fvjxd0sw1pypq8j9bfqr6zpkbx08_nixos --> nmkm3fvjxd0sw1pypq8j9bfqr6zpkbx08_nixos_common_nix
    nscswxv978a5jw2may1qymkfg3nfk8zdj_configurations_nixos --> nscswxv978a5jw2may1qymkfg3nfk8zdj_modules_docker_nix
    nscswxv978a5jw2may1qymkfg3nfk8zdj_configurations_nixos --> nscswxv978a5jw2may1qymkfg3nfk8zdj_modules_headlamp_nix
    nscswxv978a5jw2may1qymkfg3nfk8zdj_configurations_nixos --> nscswxv978a5jw2may1qymkfg3nfk8zdj_modules_tmux_nix
    nscswxv978a5jw2may1qymkfg3nfk8zdj_machines_nixos_wsl_nixos --> nscswxv978a5jw2may1qymkfg3nfk8zdj_machines_nixos_wsl_nixos_hardware_configuration_nix
    nscswxv978a5jw2may1qymkfg3nfk8zdj_machines_nixos_wsl_nixos --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_build_tarball_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_docker_desktop_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_interop_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_recovery_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_ssh_agent_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_usbip_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_version_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_welcome_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_wsl_conf_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_wsl_distro_nix
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd_native
    nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd_native --> nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd_native_wrap_shell_nix
    style nciwgqzsx31qj0jcf750d2ry5rvirvv2i_flake_nix fill:#d7b2e5,color:#000000
    style nggh7plj0gccv38rh79sx4cn3a5hbypwc_module_nix fill:#e5b7b2,color:#000000
    style nggh7plj0gccv38rh79sx4cn3a5hbypwc_lib_make_disk_image_nix fill:#e5b7b2,color:#000000
    style nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops fill:#c2b2e5,color:#000000
    style nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops_templates fill:#c2b2e5,color:#000000
    style nw6p1wzi8iz283gsm0va19k59bbah5jpg_modules_sops_secrets_for_users fill:#c2b2e5,color:#000000
    style nmkm3fvjxd0sw1pypq8j9bfqr6zpkbx08_nixos fill:#b2e5e1,color:#000000
    style nmkm3fvjxd0sw1pypq8j9bfqr6zpkbx08_nixos_common_nix fill:#b2e5e1,color:#000000
    style nscswxv978a5jw2may1qymkfg3nfk8zdj_global_nix fill:#b2c6e5,color:#000000
    style nscswxv978a5jw2may1qymkfg3nfk8zdj_configurations_nixos fill:#b2c6e5,color:#000000
    style nscswxv978a5jw2may1qymkfg3nfk8zdj_modules_docker_nix fill:#b2c6e5,color:#000000
    style nscswxv978a5jw2may1qymkfg3nfk8zdj_modules_headlamp_nix fill:#b2c6e5,color:#000000
    style nscswxv978a5jw2may1qymkfg3nfk8zdj_modules_tmux_nix fill:#b2c6e5,color:#000000
    style nscswxv978a5jw2may1qymkfg3nfk8zdj_machines_nixos_wsl_nixos fill:#b2c6e5,color:#000000
    style nscswxv978a5jw2may1qymkfg3nfk8zdj_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#b2c6e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_build_tarball_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_docker_desktop_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_interop_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_recovery_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_ssh_agent_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd_native fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_systemd_native_wrap_shell_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_usbip_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_version_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_welcome_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_wsl_conf_nix fill:#b2d7e5,color:#000000
    style nkngcl6jm72a45c9md6bz620kw1xfia6g_modules_wsl_distro_nix fill:#b2d7e5,color:#000000
```
