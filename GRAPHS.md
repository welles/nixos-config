# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    nk23fazz0b15rvdavjppp24737g26azi1_flake_nix["`**flake.nix**

_k23fazz0b15rvdavjppp24737g26azi1_`"]
    nqwkwyvw5h69rsjwclbvp0ph88r42fiy2_module_nix["`**module.nix**

_qwkwyvw5h69rsjwclbvp0ph88r42fiy2_`"]
    nqwkwyvw5h69rsjwclbvp0ph88r42fiy2_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_qwkwyvw5h69rsjwclbvp0ph88r42fiy2_`"]
    nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops["`**modules/sops**

_yij90filaxfyqw79g0779w0nwrad2hff_`"]
    nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops_templates["`**modules/sops/templates**

_yij90filaxfyqw79g0779w0nwrad2hff_`"]
    nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_yij90filaxfyqw79g0779w0nwrad2hff_`"]
    ns5pnak810ifm4aihf9ycnay6ghrxzwg6_nixos["`**nixos**

_s5pnak810ifm4aihf9ycnay6ghrxzwg6_`"]
    ns5pnak810ifm4aihf9ycnay6ghrxzwg6_nixos_common_nix["`**nixos/common.nix**

_s5pnak810ifm4aihf9ycnay6ghrxzwg6_`"]
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_global_nix["`**global.nix**

_j52v8wj7cmdjhchjrrydzd5v2iwp9azj_`"]
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_configurations_eltern["`**configurations/eltern**

_j52v8wj7cmdjhchjrrydzd5v2iwp9azj_`"]
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_modules_networkmanager_nix["`**modules/networkmanager.nix**

_j52v8wj7cmdjhchjrrydzd5v2iwp9azj_`"]
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_modules_avahi_nix["`**modules/avahi.nix**

_j52v8wj7cmdjhchjrrydzd5v2iwp9azj_`"]
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_j52v8wj7cmdjhchjrrydzd5v2iwp9azj_`"]
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_j52v8wj7cmdjhchjrrydzd5v2iwp9azj_`"]
    nk23fazz0b15rvdavjppp24737g26azi1_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_k23fazz0b15rvdavjppp24737g26azi1_`"]
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_j52v8wj7cmdjhchjrrydzd5v2iwp9azj_`"]
    nk23fazz0b15rvdavjppp24737g26azi1_flake_nix --> nqwkwyvw5h69rsjwclbvp0ph88r42fiy2_module_nix
    nk23fazz0b15rvdavjppp24737g26azi1_flake_nix --> nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops
    nk23fazz0b15rvdavjppp24737g26azi1_flake_nix --> ns5pnak810ifm4aihf9ycnay6ghrxzwg6_nixos
    nk23fazz0b15rvdavjppp24737g26azi1_flake_nix --> nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_global_nix
    nk23fazz0b15rvdavjppp24737g26azi1_flake_nix --> nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_configurations_eltern
    nk23fazz0b15rvdavjppp24737g26azi1_flake_nix --> nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos
    nqwkwyvw5h69rsjwclbvp0ph88r42fiy2_module_nix --> nqwkwyvw5h69rsjwclbvp0ph88r42fiy2_lib_make_disk_image_nix
    nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops --> nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops_templates
    nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops --> nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops_secrets_for_users
    ns5pnak810ifm4aihf9ycnay6ghrxzwg6_nixos --> ns5pnak810ifm4aihf9ycnay6ghrxzwg6_nixos_common_nix
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_configurations_eltern --> nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_modules_networkmanager_nix
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_configurations_eltern --> nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_modules_avahi_nix
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos --> nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos_hardware_configuration_nix
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos --> nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos_disk_configuration_nix
    nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos_hardware_configuration_nix --> nk23fazz0b15rvdavjppp24737g26azi1_nixos_modules_installer_scan_not_detected_nix
    style nk23fazz0b15rvdavjppp24737g26azi1_flake_nix fill:#b2cae5,color:#000000
    style nqwkwyvw5h69rsjwclbvp0ph88r42fiy2_module_nix fill:#dde5b2,color:#000000
    style nqwkwyvw5h69rsjwclbvp0ph88r42fiy2_lib_make_disk_image_nix fill:#dde5b2,color:#000000
    style nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops fill:#b2e5b8,color:#000000
    style nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops_templates fill:#b2e5b8,color:#000000
    style nyij90filaxfyqw79g0779w0nwrad2hff_modules_sops_secrets_for_users fill:#b2e5b8,color:#000000
    style ns5pnak810ifm4aihf9ycnay6ghrxzwg6_nixos fill:#bdb2e5,color:#000000
    style ns5pnak810ifm4aihf9ycnay6ghrxzwg6_nixos_common_nix fill:#bdb2e5,color:#000000
    style nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_global_nix fill:#b2c4e5,color:#000000
    style nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_configurations_eltern fill:#b2c4e5,color:#000000
    style nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_modules_networkmanager_nix fill:#b2c4e5,color:#000000
    style nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_modules_avahi_nix fill:#b2c4e5,color:#000000
    style nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos fill:#b2c4e5,color:#000000
    style nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos_hardware_configuration_nix fill:#b2c4e5,color:#000000
    style nk23fazz0b15rvdavjppp24737g26azi1_nixos_modules_installer_scan_not_detected_nix fill:#b2cae5,color:#000000
    style nj52v8wj7cmdjhchjrrydzd5v2iwp9azj_machines_eltern_asus_nixos_disk_configuration_nix fill:#b2c4e5,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_flake_nix["`**flake.nix**

_d9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_`"]
    nhikaxk1yy8s8q27mwiacdp5m95s45qs6_module_nix["`**module.nix**

_hikaxk1yy8s8q27mwiacdp5m95s45qs6_`"]
    nhikaxk1yy8s8q27mwiacdp5m95s45qs6_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_hikaxk1yy8s8q27mwiacdp5m95s45qs6_`"]
    ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops["`**modules/sops**

_dfs4xdzmgan96rg78dcg905qncb5zxz1_`"]
    ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops_templates["`**modules/sops/templates**

_dfs4xdzmgan96rg78dcg905qncb5zxz1_`"]
    ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_dfs4xdzmgan96rg78dcg905qncb5zxz1_`"]
    nasl9jpm9a2vdgyrvf0x3qbmsswd23yy2_nixos["`**nixos**

_asl9jpm9a2vdgyrvf0x3qbmsswd23yy2_`"]
    nasl9jpm9a2vdgyrvf0x3qbmsswd23yy2_nixos_common_nix["`**nixos/common.nix**

_asl9jpm9a2vdgyrvf0x3qbmsswd23yy2_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_global_nix["`**global.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch["`**configurations/schokoladenelch**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_docker_nix["`**modules/docker.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_networkmanager_nix["`**modules/networkmanager.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_tmux_nix["`**modules/tmux.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_check_mkv["`**modules/scripts/check-mkv**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_create_zfs_dataset["`**modules/scripts/create-zfs-dataset**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_stacks_default_nix["`**modules/stacks/default.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_d9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_`"]
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_y9q6zz6adwvv1cv8a0jgqh8hwjw37z22_`"]
    nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_flake_nix --> nhikaxk1yy8s8q27mwiacdp5m95s45qs6_module_nix
    nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_flake_nix --> ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops
    nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_flake_nix --> nasl9jpm9a2vdgyrvf0x3qbmsswd23yy2_nixos
    nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_flake_nix --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_global_nix
    nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_flake_nix --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch
    nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_flake_nix --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos
    nhikaxk1yy8s8q27mwiacdp5m95s45qs6_module_nix --> nhikaxk1yy8s8q27mwiacdp5m95s45qs6_lib_make_disk_image_nix
    ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops --> ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops_templates
    ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops --> ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops_secrets_for_users
    nasl9jpm9a2vdgyrvf0x3qbmsswd23yy2_nixos --> nasl9jpm9a2vdgyrvf0x3qbmsswd23yy2_nixos_common_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_docker_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_networkmanager_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_tmux_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_check_mkv
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_create_zfs_dataset
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_zfs_manual_snapshot
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_zfs_snapshot_diff
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_boot_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_networking_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_services_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_persistence_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_stacks_default_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos --> ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_nixos_modules_installer_scan_not_detected_nix
    style nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_flake_nix fill:#c0e5b2,color:#000000
    style nhikaxk1yy8s8q27mwiacdp5m95s45qs6_module_nix fill:#e5b2c6,color:#000000
    style nhikaxk1yy8s8q27mwiacdp5m95s45qs6_lib_make_disk_image_nix fill:#e5b2c6,color:#000000
    style ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops fill:#b2cce5,color:#000000
    style ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops_templates fill:#b2cce5,color:#000000
    style ndfs4xdzmgan96rg78dcg905qncb5zxz1_modules_sops_secrets_for_users fill:#b2cce5,color:#000000
    style nasl9jpm9a2vdgyrvf0x3qbmsswd23yy2_nixos fill:#e5b2c3,color:#000000
    style nasl9jpm9a2vdgyrvf0x3qbmsswd23yy2_nixos_common_nix fill:#e5b2c3,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_global_nix fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_docker_nix fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_networkmanager_nix fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_tmux_nix fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_check_mkv fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_create_zfs_dataset fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_zfs_manual_snapshot fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_scripts_zfs_snapshot_diff fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_boot_nix fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_networking_nix fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_services_nix fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_configurations_schokoladenelch_persistence_nix fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_modules_stacks_default_nix fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos fill:#e5b2d1,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#e5b2d1,color:#000000
    style nd9p0y2dr6x3l7y6wkq38j9y1cy6dbvd6_nixos_modules_installer_scan_not_detected_nix fill:#c0e5b2,color:#000000
    style ny9q6zz6adwvv1cv8a0jgqh8hwjw37z22_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#e5b2d1,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_flake_nix["`**flake.nix**

_b2lmh2lg7iqf2rngvr6cq4mpv9l272bf_`"]
    np5fgyvjc43azx89s2ns8czvvxcvvix16_module_nix["`**module.nix**

_p5fgyvjc43azx89s2ns8czvvxcvvix16_`"]
    np5fgyvjc43azx89s2ns8czvvxcvvix16_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_p5fgyvjc43azx89s2ns8czvvxcvvix16_`"]
    n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops["`**modules/sops**

_4bsk1v4n9xhyclj8i2w35gh80yicr5l4_`"]
    n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops_templates["`**modules/sops/templates**

_4bsk1v4n9xhyclj8i2w35gh80yicr5l4_`"]
    n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_4bsk1v4n9xhyclj8i2w35gh80yicr5l4_`"]
    na5rm2abzxjcg6srflckqvh763rn0bzpx_nixos["`**nixos**

_a5rm2abzxjcg6srflckqvh763rn0bzpx_`"]
    na5rm2abzxjcg6srflckqvh763rn0bzpx_nixos_common_nix["`**nixos/common.nix**

_a5rm2abzxjcg6srflckqvh763rn0bzpx_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_global_nix["`**global.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico["`**configurations/nico**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_docker_nix["`**modules/docker.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_networkmanager_nix["`**modules/networkmanager.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_pipewire_nix["`**modules/pipewire.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_services_nix["`**configurations/nico/services.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_avahi_nix["`**modules/avahi.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_networking_nix["`**configurations/nico/networking.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_b2lmh2lg7iqf2rngvr6cq4mpv9l272bf_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_eden_nix["`**modules/eden.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_3cmhd07whwd0i71yxwl7707i7dgq4qdj_`"]
    nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_flake_nix --> np5fgyvjc43azx89s2ns8czvvxcvvix16_module_nix
    nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_flake_nix --> n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops
    nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_flake_nix --> na5rm2abzxjcg6srflckqvh763rn0bzpx_nixos
    nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_flake_nix --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_global_nix
    nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_flake_nix --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico
    nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_flake_nix --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos
    np5fgyvjc43azx89s2ns8czvvxcvvix16_module_nix --> np5fgyvjc43azx89s2ns8czvvxcvvix16_lib_make_disk_image_nix
    n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops --> n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops_templates
    n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops --> n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops_secrets_for_users
    na5rm2abzxjcg6srflckqvh763rn0bzpx_nixos --> na5rm2abzxjcg6srflckqvh763rn0bzpx_nixos_common_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_docker_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_networkmanager_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_boot_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_desktop_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_audio_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_virtualisation_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_services_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_packages_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_rclone_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_networking_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_audio_nix --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_pipewire_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_services_nix --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_avahi_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos_hardware_configuration_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_eden_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos --> n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_xone_dongle_nix
    n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos_hardware_configuration_nix --> nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_nixos_modules_installer_scan_not_detected_nix
    style nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_flake_nix fill:#b9b2e5,color:#000000
    style np5fgyvjc43azx89s2ns8czvvxcvvix16_module_nix fill:#dfe5b2,color:#000000
    style np5fgyvjc43azx89s2ns8czvvxcvvix16_lib_make_disk_image_nix fill:#dfe5b2,color:#000000
    style n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops fill:#e5b2b2,color:#000000
    style n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops_templates fill:#e5b2b2,color:#000000
    style n4bsk1v4n9xhyclj8i2w35gh80yicr5l4_modules_sops_secrets_for_users fill:#e5b2b2,color:#000000
    style na5rm2abzxjcg6srflckqvh763rn0bzpx_nixos fill:#b8e5b2,color:#000000
    style na5rm2abzxjcg6srflckqvh763rn0bzpx_nixos_common_nix fill:#b8e5b2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_global_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_docker_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_networkmanager_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_boot_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_desktop_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_audio_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_pipewire_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_virtualisation_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_services_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_avahi_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_packages_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_rclone_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_configurations_nico_networking_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#e5dcb2,color:#000000
    style nb2lmh2lg7iqf2rngvr6cq4mpv9l272bf_nixos_modules_installer_scan_not_detected_nix fill:#b9b2e5,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_eden_nix fill:#e5dcb2,color:#000000
    style n3cmhd07whwd0i71yxwl7707i7dgq4qdj_modules_xone_dongle_nix fill:#e5dcb2,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_flake_nix["`**flake.nix**

_yndmv527vjiz9kp6fmk7ha5v62fi5cd1_`"]
    ng4lb05kx1ay5jq1gr49sg9ybr5sak7g1_module_nix["`**module.nix**

_g4lb05kx1ay5jq1gr49sg9ybr5sak7g1_`"]
    ng4lb05kx1ay5jq1gr49sg9ybr5sak7g1_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_g4lb05kx1ay5jq1gr49sg9ybr5sak7g1_`"]
    nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops["`**modules/sops**

_mhzrxp1n8mmk20icm7ypx96rrgbkf69r_`"]
    nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops_templates["`**modules/sops/templates**

_mhzrxp1n8mmk20icm7ypx96rrgbkf69r_`"]
    nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_mhzrxp1n8mmk20icm7ypx96rrgbkf69r_`"]
    nsim5ss967zlpbid9zlp3znmnwk9wf8kj_nixos["`**nixos**

_sim5ss967zlpbid9zlp3znmnwk9wf8kj_`"]
    nsim5ss967zlpbid9zlp3znmnwk9wf8kj_nixos_common_nix["`**nixos/common.nix**

_sim5ss967zlpbid9zlp3znmnwk9wf8kj_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_global_nix["`**global.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico["`**configurations/nico**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_modules_docker_nix["`**modules/docker.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_modules_networkmanager_nix["`**modules/networkmanager.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_modules_pipewire_nix["`**modules/pipewire.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_services_nix["`**configurations/nico/services.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_modules_avahi_nix["`**modules/avahi.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_networking_nix["`**configurations/nico/networking.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_yndmv527vjiz9kp6fmk7ha5v62fi5cd1_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_disk_configuration_nix["`**machines/nico-thinkpad-nixos/disk-configuration.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_impermanence_nix["`**machines/nico-thinkpad-nixos/impermanence.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_8w7c7d8sqf428226ccbs259m4ralfja4_`"]
    nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_flake_nix --> ng4lb05kx1ay5jq1gr49sg9ybr5sak7g1_module_nix
    nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_flake_nix --> nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops
    nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_flake_nix --> nsim5ss967zlpbid9zlp3znmnwk9wf8kj_nixos
    nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_flake_nix --> n8w7c7d8sqf428226ccbs259m4ralfja4_global_nix
    nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_flake_nix --> n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico
    nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_flake_nix --> n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos
    ng4lb05kx1ay5jq1gr49sg9ybr5sak7g1_module_nix --> ng4lb05kx1ay5jq1gr49sg9ybr5sak7g1_lib_make_disk_image_nix
    nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops --> nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops_templates
    nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops --> nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops_secrets_for_users
    nsim5ss967zlpbid9zlp3znmnwk9wf8kj_nixos --> nsim5ss967zlpbid9zlp3znmnwk9wf8kj_nixos_common_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_modules_docker_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_modules_networkmanager_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_boot_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_desktop_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_audio_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_virtualisation_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_services_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_packages_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_rclone_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico --> n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_networking_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_audio_nix --> n8w7c7d8sqf428226ccbs259m4ralfja4_modules_pipewire_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_services_nix --> n8w7c7d8sqf428226ccbs259m4ralfja4_modules_avahi_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos --> n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_hardware_configuration_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos --> n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_disk_configuration_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos --> n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_impermanence_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos --> n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos --> n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_mobile_network_nix
    n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_hardware_configuration_nix --> nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_nixos_modules_installer_scan_not_detected_nix
    style nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_flake_nix fill:#ccb2e5,color:#000000
    style ng4lb05kx1ay5jq1gr49sg9ybr5sak7g1_module_nix fill:#b2e5bc,color:#000000
    style ng4lb05kx1ay5jq1gr49sg9ybr5sak7g1_lib_make_disk_image_nix fill:#b2e5bc,color:#000000
    style nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops fill:#b2e5c7,color:#000000
    style nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops_templates fill:#b2e5c7,color:#000000
    style nmhzrxp1n8mmk20icm7ypx96rrgbkf69r_modules_sops_secrets_for_users fill:#b2e5c7,color:#000000
    style nsim5ss967zlpbid9zlp3znmnwk9wf8kj_nixos fill:#e5b2d4,color:#000000
    style nsim5ss967zlpbid9zlp3znmnwk9wf8kj_nixos_common_nix fill:#e5b2d4,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_global_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_modules_docker_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_modules_networkmanager_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_boot_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_desktop_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_audio_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_modules_pipewire_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_virtualisation_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_services_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_modules_avahi_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_packages_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_rclone_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_configurations_nico_networking_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#b2d0e5,color:#000000
    style nyndmv527vjiz9kp6fmk7ha5v62fi5cd1_nixos_modules_installer_scan_not_detected_nix fill:#ccb2e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_disk_configuration_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_impermanence_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#b2d0e5,color:#000000
    style n8w7c7d8sqf428226ccbs259m4ralfja4_machines_nico_thinkpad_nixos_mobile_network_nix fill:#b2d0e5,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    nl615vd910vkqyzpi1zkvm6sa6biza00p_flake_nix["`**flake.nix**

_l615vd910vkqyzpi1zkvm6sa6biza00p_`"]
    nnxwld5fzvmcrvkzd5g18h18j9jwhvwc9_module_nix["`**module.nix**

_nxwld5fzvmcrvkzd5g18h18j9jwhvwc9_`"]
    nnxwld5fzvmcrvkzd5g18h18j9jwhvwc9_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_nxwld5fzvmcrvkzd5g18h18j9jwhvwc9_`"]
    nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops["`**modules/sops**

_mirafdc7fvs145980qp76jn6hnlgnzgb_`"]
    nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops_templates["`**modules/sops/templates**

_mirafdc7fvs145980qp76jn6hnlgnzgb_`"]
    nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_mirafdc7fvs145980qp76jn6hnlgnzgb_`"]
    ng4iiz9ncfym45mzwqkv1j3h6fdrrqhhz_nixos["`**nixos**

_g4iiz9ncfym45mzwqkv1j3h6fdrrqhhz_`"]
    ng4iiz9ncfym45mzwqkv1j3h6fdrrqhhz_nixos_common_nix["`**nixos/common.nix**

_g4iiz9ncfym45mzwqkv1j3h6fdrrqhhz_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_global_nix["`**global.nix**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_configurations_nixos["`**configurations/nixos**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_modules_docker_nix["`**modules/docker.nix**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_modules_headlamp_nix["`**modules/headlamp.nix**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_modules_tmux_nix["`**modules/tmux.nix**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_xh44dcir0j1ap02jc7wqk5k42c6744fl_`"]
    nl615vd910vkqyzpi1zkvm6sa6biza00p_flake_nix --> nnxwld5fzvmcrvkzd5g18h18j9jwhvwc9_module_nix
    nl615vd910vkqyzpi1zkvm6sa6biza00p_flake_nix --> nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops
    nl615vd910vkqyzpi1zkvm6sa6biza00p_flake_nix --> ng4iiz9ncfym45mzwqkv1j3h6fdrrqhhz_nixos
    nl615vd910vkqyzpi1zkvm6sa6biza00p_flake_nix --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_global_nix
    nl615vd910vkqyzpi1zkvm6sa6biza00p_flake_nix --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_configurations_nixos
    nl615vd910vkqyzpi1zkvm6sa6biza00p_flake_nix --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos
    nnxwld5fzvmcrvkzd5g18h18j9jwhvwc9_module_nix --> nnxwld5fzvmcrvkzd5g18h18j9jwhvwc9_lib_make_disk_image_nix
    nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops --> nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops_templates
    nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops --> nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops_secrets_for_users
    ng4iiz9ncfym45mzwqkv1j3h6fdrrqhhz_nixos --> ng4iiz9ncfym45mzwqkv1j3h6fdrrqhhz_nixos_common_nix
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_configurations_nixos --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_modules_docker_nix
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_configurations_nixos --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_modules_headlamp_nix
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_configurations_nixos --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_modules_tmux_nix
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_disk_configuration_nix
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_boot_nix
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_desktop_nix
    nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos --> nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_persistence_nix
    style nl615vd910vkqyzpi1zkvm6sa6biza00p_flake_nix fill:#c0e5b2,color:#000000
    style nnxwld5fzvmcrvkzd5g18h18j9jwhvwc9_module_nix fill:#e5ccb2,color:#000000
    style nnxwld5fzvmcrvkzd5g18h18j9jwhvwc9_lib_make_disk_image_nix fill:#e5ccb2,color:#000000
    style nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops fill:#e5b2d6,color:#000000
    style nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops_templates fill:#e5b2d6,color:#000000
    style nmirafdc7fvs145980qp76jn6hnlgnzgb_modules_sops_secrets_for_users fill:#e5b2d6,color:#000000
    style ng4iiz9ncfym45mzwqkv1j3h6fdrrqhhz_nixos fill:#b3b2e5,color:#000000
    style ng4iiz9ncfym45mzwqkv1j3h6fdrrqhhz_nixos_common_nix fill:#b3b2e5,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_global_nix fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_configurations_nixos fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_modules_docker_nix fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_modules_headlamp_nix fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_modules_tmux_nix fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_boot_nix fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_desktop_nix fill:#b2e5cf,color:#000000
    style nxh44dcir0j1ap02jc7wqk5k42c6744fl_machines_nixos_virtualbox_nixos_persistence_nix fill:#b2e5cf,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    n1vn6nbf6aj7hvg2qjkf2yzbc73gvb7nk_flake_nix["`**flake.nix**

_1vn6nbf6aj7hvg2qjkf2yzbc73gvb7nk_`"]
    nc9hil0vpjd28k4vc2zmdvm2kigvpl43n_module_nix["`**module.nix**

_c9hil0vpjd28k4vc2zmdvm2kigvpl43n_`"]
    nc9hil0vpjd28k4vc2zmdvm2kigvpl43n_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_c9hil0vpjd28k4vc2zmdvm2kigvpl43n_`"]
    n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops["`**modules/sops**

_6dj4wb847p15xfmsv6pkki81fca6wxlz_`"]
    n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops_templates["`**modules/sops/templates**

_6dj4wb847p15xfmsv6pkki81fca6wxlz_`"]
    n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_6dj4wb847p15xfmsv6pkki81fca6wxlz_`"]
    nd1ng06fsddgx1aqjq5nx47bqk0m44nwa_nixos["`**nixos**

_d1ng06fsddgx1aqjq5nx47bqk0m44nwa_`"]
    nd1ng06fsddgx1aqjq5nx47bqk0m44nwa_nixos_common_nix["`**nixos/common.nix**

_d1ng06fsddgx1aqjq5nx47bqk0m44nwa_`"]
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_global_nix["`**global.nix**

_ybavkngjg2kqzqcswbfjwb5rsm4vy1aj_`"]
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_configurations_nixos["`**configurations/nixos**

_ybavkngjg2kqzqcswbfjwb5rsm4vy1aj_`"]
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_modules_docker_nix["`**modules/docker.nix**

_ybavkngjg2kqzqcswbfjwb5rsm4vy1aj_`"]
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_modules_headlamp_nix["`**modules/headlamp.nix**

_ybavkngjg2kqzqcswbfjwb5rsm4vy1aj_`"]
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_modules_tmux_nix["`**modules/tmux.nix**

_ybavkngjg2kqzqcswbfjwb5rsm4vy1aj_`"]
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_ybavkngjg2kqzqcswbfjwb5rsm4vy1aj_`"]
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_ybavkngjg2kqzqcswbfjwb5rsm4vy1aj_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules["`**modules**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_build_tarball_nix["`**modules/build-tarball.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_interop_nix["`**modules/interop.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_recovery_nix["`**modules/recovery.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd["`**modules/systemd**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd_native["`**modules/systemd/native**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_usbip_nix["`**modules/usbip.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_version_nix["`**modules/version.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_welcome_nix["`**modules/welcome.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_8syshy0bx8bz5zna7yzr7syp1qczxgvx_`"]
    n1vn6nbf6aj7hvg2qjkf2yzbc73gvb7nk_flake_nix --> nc9hil0vpjd28k4vc2zmdvm2kigvpl43n_module_nix
    n1vn6nbf6aj7hvg2qjkf2yzbc73gvb7nk_flake_nix --> n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops
    n1vn6nbf6aj7hvg2qjkf2yzbc73gvb7nk_flake_nix --> nd1ng06fsddgx1aqjq5nx47bqk0m44nwa_nixos
    n1vn6nbf6aj7hvg2qjkf2yzbc73gvb7nk_flake_nix --> nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_global_nix
    n1vn6nbf6aj7hvg2qjkf2yzbc73gvb7nk_flake_nix --> nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_configurations_nixos
    n1vn6nbf6aj7hvg2qjkf2yzbc73gvb7nk_flake_nix --> nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_machines_nixos_wsl_nixos
    nc9hil0vpjd28k4vc2zmdvm2kigvpl43n_module_nix --> nc9hil0vpjd28k4vc2zmdvm2kigvpl43n_lib_make_disk_image_nix
    n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops --> n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops_templates
    n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops --> n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops_secrets_for_users
    nd1ng06fsddgx1aqjq5nx47bqk0m44nwa_nixos --> nd1ng06fsddgx1aqjq5nx47bqk0m44nwa_nixos_common_nix
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_configurations_nixos --> nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_modules_docker_nix
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_configurations_nixos --> nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_modules_headlamp_nix
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_configurations_nixos --> nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_modules_tmux_nix
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_machines_nixos_wsl_nixos --> nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_machines_nixos_wsl_nixos_hardware_configuration_nix
    nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_machines_nixos_wsl_nixos --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_build_tarball_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_docker_desktop_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_interop_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_recovery_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_ssh_agent_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_usbip_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_version_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_welcome_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_wsl_conf_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_wsl_distro_nix
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd_native
    n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd_native --> n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd_native_wrap_shell_nix
    style n1vn6nbf6aj7hvg2qjkf2yzbc73gvb7nk_flake_nix fill:#b2c0e5,color:#000000
    style nc9hil0vpjd28k4vc2zmdvm2kigvpl43n_module_nix fill:#e5ddb2,color:#000000
    style nc9hil0vpjd28k4vc2zmdvm2kigvpl43n_lib_make_disk_image_nix fill:#e5ddb2,color:#000000
    style n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops fill:#e2e5b2,color:#000000
    style n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops_templates fill:#e2e5b2,color:#000000
    style n6dj4wb847p15xfmsv6pkki81fca6wxlz_modules_sops_secrets_for_users fill:#e2e5b2,color:#000000
    style nd1ng06fsddgx1aqjq5nx47bqk0m44nwa_nixos fill:#e5b2bf,color:#000000
    style nd1ng06fsddgx1aqjq5nx47bqk0m44nwa_nixos_common_nix fill:#e5b2bf,color:#000000
    style nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_global_nix fill:#e5c3b2,color:#000000
    style nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_configurations_nixos fill:#e5c3b2,color:#000000
    style nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_modules_docker_nix fill:#e5c3b2,color:#000000
    style nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_modules_headlamp_nix fill:#e5c3b2,color:#000000
    style nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_modules_tmux_nix fill:#e5c3b2,color:#000000
    style nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_machines_nixos_wsl_nixos fill:#e5c3b2,color:#000000
    style nybavkngjg2kqzqcswbfjwb5rsm4vy1aj_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#e5c3b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_build_tarball_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_docker_desktop_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_interop_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_recovery_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_ssh_agent_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd_native fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_systemd_native_wrap_shell_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_usbip_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_version_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_welcome_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_wsl_conf_nix fill:#bbe5b2,color:#000000
    style n8syshy0bx8bz5zna7yzr7syp1qczxgvx_modules_wsl_distro_nix fill:#bbe5b2,color:#000000
```
