# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    n941zhwm7qmyqix17l819ayxgcr28bz4y_flake_nix["`**flake.nix**

_941zhwm7qmyqix17l819ayxgcr28bz4y_`"]
    nz5c94czm1r8dplyy2l58iqvxcy984xfk_module_nix["`**module.nix**

_z5c94czm1r8dplyy2l58iqvxcy984xfk_`"]
    nz5c94czm1r8dplyy2l58iqvxcy984xfk_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_z5c94czm1r8dplyy2l58iqvxcy984xfk_`"]
    nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops["`**modules/sops**

_wafprjv3ysybv6yzp64j972rlffkxvaq_`"]
    nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops_templates["`**modules/sops/templates**

_wafprjv3ysybv6yzp64j972rlffkxvaq_`"]
    nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_wafprjv3ysybv6yzp64j972rlffkxvaq_`"]
    n6sl86i8mdj4ahfacf171zskvmzj86f0y_nixos["`**nixos**

_6sl86i8mdj4ahfacf171zskvmzj86f0y_`"]
    n6sl86i8mdj4ahfacf171zskvmzj86f0y_nixos_common_nix["`**nixos/common.nix**

_6sl86i8mdj4ahfacf171zskvmzj86f0y_`"]
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_global_nix["`**global.nix**

_8c274i2pdg3zh02g4a5763r5vxyxb20z_`"]
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_configurations_eltern["`**configurations/eltern**

_8c274i2pdg3zh02g4a5763r5vxyxb20z_`"]
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_modules_networkmanager_nix["`**modules/networkmanager.nix**

_8c274i2pdg3zh02g4a5763r5vxyxb20z_`"]
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_modules_avahi_nix["`**modules/avahi.nix**

_8c274i2pdg3zh02g4a5763r5vxyxb20z_`"]
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_8c274i2pdg3zh02g4a5763r5vxyxb20z_`"]
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_8c274i2pdg3zh02g4a5763r5vxyxb20z_`"]
    n941zhwm7qmyqix17l819ayxgcr28bz4y_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_941zhwm7qmyqix17l819ayxgcr28bz4y_`"]
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_8c274i2pdg3zh02g4a5763r5vxyxb20z_`"]
    n941zhwm7qmyqix17l819ayxgcr28bz4y_flake_nix --> nz5c94czm1r8dplyy2l58iqvxcy984xfk_module_nix
    n941zhwm7qmyqix17l819ayxgcr28bz4y_flake_nix --> nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops
    n941zhwm7qmyqix17l819ayxgcr28bz4y_flake_nix --> n6sl86i8mdj4ahfacf171zskvmzj86f0y_nixos
    n941zhwm7qmyqix17l819ayxgcr28bz4y_flake_nix --> n8c274i2pdg3zh02g4a5763r5vxyxb20z_global_nix
    n941zhwm7qmyqix17l819ayxgcr28bz4y_flake_nix --> n8c274i2pdg3zh02g4a5763r5vxyxb20z_configurations_eltern
    n941zhwm7qmyqix17l819ayxgcr28bz4y_flake_nix --> n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos
    nz5c94czm1r8dplyy2l58iqvxcy984xfk_module_nix --> nz5c94czm1r8dplyy2l58iqvxcy984xfk_lib_make_disk_image_nix
    nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops --> nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops_templates
    nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops --> nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops_secrets_for_users
    n6sl86i8mdj4ahfacf171zskvmzj86f0y_nixos --> n6sl86i8mdj4ahfacf171zskvmzj86f0y_nixos_common_nix
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_configurations_eltern --> n8c274i2pdg3zh02g4a5763r5vxyxb20z_modules_networkmanager_nix
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_configurations_eltern --> n8c274i2pdg3zh02g4a5763r5vxyxb20z_modules_avahi_nix
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos --> n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos_hardware_configuration_nix
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos --> n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos_disk_configuration_nix
    n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos_hardware_configuration_nix --> n941zhwm7qmyqix17l819ayxgcr28bz4y_nixos_modules_installer_scan_not_detected_nix
    style n941zhwm7qmyqix17l819ayxgcr28bz4y_flake_nix fill:#e5ccb2,color:#000000
    style nz5c94czm1r8dplyy2l58iqvxcy984xfk_module_nix fill:#b2e5bc,color:#000000
    style nz5c94czm1r8dplyy2l58iqvxcy984xfk_lib_make_disk_image_nix fill:#b2e5bc,color:#000000
    style nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops fill:#b2e5cc,color:#000000
    style nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops_templates fill:#b2e5cc,color:#000000
    style nwafprjv3ysybv6yzp64j972rlffkxvaq_modules_sops_secrets_for_users fill:#b2e5cc,color:#000000
    style n6sl86i8mdj4ahfacf171zskvmzj86f0y_nixos fill:#dde5b2,color:#000000
    style n6sl86i8mdj4ahfacf171zskvmzj86f0y_nixos_common_nix fill:#dde5b2,color:#000000
    style n8c274i2pdg3zh02g4a5763r5vxyxb20z_global_nix fill:#b2e5da,color:#000000
    style n8c274i2pdg3zh02g4a5763r5vxyxb20z_configurations_eltern fill:#b2e5da,color:#000000
    style n8c274i2pdg3zh02g4a5763r5vxyxb20z_modules_networkmanager_nix fill:#b2e5da,color:#000000
    style n8c274i2pdg3zh02g4a5763r5vxyxb20z_modules_avahi_nix fill:#b2e5da,color:#000000
    style n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos fill:#b2e5da,color:#000000
    style n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos_hardware_configuration_nix fill:#b2e5da,color:#000000
    style n941zhwm7qmyqix17l819ayxgcr28bz4y_nixos_modules_installer_scan_not_detected_nix fill:#e5ccb2,color:#000000
    style n8c274i2pdg3zh02g4a5763r5vxyxb20z_machines_eltern_asus_nixos_disk_configuration_nix fill:#b2e5da,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    n8x49dchnfly93857ahh3a8z728afcds8_flake_nix["`**flake.nix**

_8x49dchnfly93857ahh3a8z728afcds8_`"]
    nd83qxb337jyrms3h12hsqqjs5k14zb23_module_nix["`**module.nix**

_d83qxb337jyrms3h12hsqqjs5k14zb23_`"]
    nd83qxb337jyrms3h12hsqqjs5k14zb23_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_d83qxb337jyrms3h12hsqqjs5k14zb23_`"]
    nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops["`**modules/sops**

_f277gvf8baf5pi5n8fka2xr2hmbgljj5_`"]
    nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops_templates["`**modules/sops/templates**

_f277gvf8baf5pi5n8fka2xr2hmbgljj5_`"]
    nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_f277gvf8baf5pi5n8fka2xr2hmbgljj5_`"]
    njz4l97hqsl50rxpn7g3mlvrrkb902c6q_nixos["`**nixos**

_jz4l97hqsl50rxpn7g3mlvrrkb902c6q_`"]
    njz4l97hqsl50rxpn7g3mlvrrkb902c6q_nixos_common_nix["`**nixos/common.nix**

_jz4l97hqsl50rxpn7g3mlvrrkb902c6q_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_global_nix["`**global.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch["`**configurations/schokoladenelch**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_docker_nix["`**modules/docker.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_networkmanager_nix["`**modules/networkmanager.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_tmux_nix["`**modules/tmux.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_check_mkv["`**modules/scripts/check-mkv**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_create_zfs_dataset["`**modules/scripts/create-zfs-dataset**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_stacks_default_nix["`**modules/stacks/default.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    n8x49dchnfly93857ahh3a8z728afcds8_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_8x49dchnfly93857ahh3a8z728afcds8_`"]
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_piclcjhjbh3nryzaqm7jy994zjs0k2xq_`"]
    n8x49dchnfly93857ahh3a8z728afcds8_flake_nix --> nd83qxb337jyrms3h12hsqqjs5k14zb23_module_nix
    n8x49dchnfly93857ahh3a8z728afcds8_flake_nix --> nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops
    n8x49dchnfly93857ahh3a8z728afcds8_flake_nix --> njz4l97hqsl50rxpn7g3mlvrrkb902c6q_nixos
    n8x49dchnfly93857ahh3a8z728afcds8_flake_nix --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_global_nix
    n8x49dchnfly93857ahh3a8z728afcds8_flake_nix --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch
    n8x49dchnfly93857ahh3a8z728afcds8_flake_nix --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos
    nd83qxb337jyrms3h12hsqqjs5k14zb23_module_nix --> nd83qxb337jyrms3h12hsqqjs5k14zb23_lib_make_disk_image_nix
    nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops --> nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops_templates
    nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops --> nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops_secrets_for_users
    njz4l97hqsl50rxpn7g3mlvrrkb902c6q_nixos --> njz4l97hqsl50rxpn7g3mlvrrkb902c6q_nixos_common_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_docker_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_networkmanager_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_tmux_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_check_mkv
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_create_zfs_dataset
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_zfs_manual_snapshot
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_zfs_snapshot_diff
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_boot_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_networking_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_services_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_persistence_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_stacks_default_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos --> npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> n8x49dchnfly93857ahh3a8z728afcds8_nixos_modules_installer_scan_not_detected_nix
    style n8x49dchnfly93857ahh3a8z728afcds8_flake_nix fill:#e5ddb2,color:#000000
    style nd83qxb337jyrms3h12hsqqjs5k14zb23_module_nix fill:#d0b2e5,color:#000000
    style nd83qxb337jyrms3h12hsqqjs5k14zb23_lib_make_disk_image_nix fill:#d0b2e5,color:#000000
    style nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops fill:#e2b2e5,color:#000000
    style nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops_templates fill:#e2b2e5,color:#000000
    style nf277gvf8baf5pi5n8fka2xr2hmbgljj5_modules_sops_secrets_for_users fill:#e2b2e5,color:#000000
    style njz4l97hqsl50rxpn7g3mlvrrkb902c6q_nixos fill:#c7b2e5,color:#000000
    style njz4l97hqsl50rxpn7g3mlvrrkb902c6q_nixos_common_nix fill:#c7b2e5,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_global_nix fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_docker_nix fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_networkmanager_nix fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_tmux_nix fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_check_mkv fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_create_zfs_dataset fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_zfs_manual_snapshot fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_scripts_zfs_snapshot_diff fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_boot_nix fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_networking_nix fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_services_nix fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_configurations_schokoladenelch_persistence_nix fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_modules_stacks_default_nix fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos fill:#e5c8b2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#e5c8b2,color:#000000
    style n8x49dchnfly93857ahh3a8z728afcds8_nixos_modules_installer_scan_not_detected_nix fill:#e5ddb2,color:#000000
    style npiclcjhjbh3nryzaqm7jy994zjs0k2xq_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#e5c8b2,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    nfiinqhapb1s5k4xzz2lfp79abpsyszkx_flake_nix["`**flake.nix**

_fiinqhapb1s5k4xzz2lfp79abpsyszkx_`"]
    ny1pbp2b8y4b4p41zn0dlfx4g8hy5gblp_module_nix["`**module.nix**

_y1pbp2b8y4b4p41zn0dlfx4g8hy5gblp_`"]
    ny1pbp2b8y4b4p41zn0dlfx4g8hy5gblp_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_y1pbp2b8y4b4p41zn0dlfx4g8hy5gblp_`"]
    nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops["`**modules/sops**

_xk9vh5q554iy1xcbbzv23p1fj7p0ng4d_`"]
    nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops_templates["`**modules/sops/templates**

_xk9vh5q554iy1xcbbzv23p1fj7p0ng4d_`"]
    nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_xk9vh5q554iy1xcbbzv23p1fj7p0ng4d_`"]
    nqxl6rnhgb4smk94vl6khnshw9dkj39qh_nixos["`**nixos**

_qxl6rnhgb4smk94vl6khnshw9dkj39qh_`"]
    nqxl6rnhgb4smk94vl6khnshw9dkj39qh_nixos_common_nix["`**nixos/common.nix**

_qxl6rnhgb4smk94vl6khnshw9dkj39qh_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_global_nix["`**global.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico["`**configurations/nico**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_docker_nix["`**modules/docker.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_networkmanager_nix["`**modules/networkmanager.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_pipewire_nix["`**modules/pipewire.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_services_nix["`**configurations/nico/services.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_avahi_nix["`**modules/avahi.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    nfiinqhapb1s5k4xzz2lfp79abpsyszkx_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_fiinqhapb1s5k4xzz2lfp79abpsyszkx_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_eden_nix["`**modules/eden.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_dfdqxd6gkpdrfyl1nkm077281a4bf569_`"]
    nfiinqhapb1s5k4xzz2lfp79abpsyszkx_flake_nix --> ny1pbp2b8y4b4p41zn0dlfx4g8hy5gblp_module_nix
    nfiinqhapb1s5k4xzz2lfp79abpsyszkx_flake_nix --> nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops
    nfiinqhapb1s5k4xzz2lfp79abpsyszkx_flake_nix --> nqxl6rnhgb4smk94vl6khnshw9dkj39qh_nixos
    nfiinqhapb1s5k4xzz2lfp79abpsyszkx_flake_nix --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_global_nix
    nfiinqhapb1s5k4xzz2lfp79abpsyszkx_flake_nix --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico
    nfiinqhapb1s5k4xzz2lfp79abpsyszkx_flake_nix --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos
    ny1pbp2b8y4b4p41zn0dlfx4g8hy5gblp_module_nix --> ny1pbp2b8y4b4p41zn0dlfx4g8hy5gblp_lib_make_disk_image_nix
    nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops --> nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops_templates
    nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops --> nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops_secrets_for_users
    nqxl6rnhgb4smk94vl6khnshw9dkj39qh_nixos --> nqxl6rnhgb4smk94vl6khnshw9dkj39qh_nixos_common_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_docker_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_networkmanager_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_boot_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_desktop_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_audio_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_virtualisation_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_services_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_packages_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_rclone_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_audio_nix --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_pipewire_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_services_nix --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_avahi_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos_hardware_configuration_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_eden_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos --> ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_xone_dongle_nix
    ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos_hardware_configuration_nix --> nfiinqhapb1s5k4xzz2lfp79abpsyszkx_nixos_modules_installer_scan_not_detected_nix
    style nfiinqhapb1s5k4xzz2lfp79abpsyszkx_flake_nix fill:#e5d4b2,color:#000000
    style ny1pbp2b8y4b4p41zn0dlfx4g8hy5gblp_module_nix fill:#e1b2e5,color:#000000
    style ny1pbp2b8y4b4p41zn0dlfx4g8hy5gblp_lib_make_disk_image_nix fill:#e1b2e5,color:#000000
    style nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops fill:#e5b2d3,color:#000000
    style nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops_templates fill:#e5b2d3,color:#000000
    style nxk9vh5q554iy1xcbbzv23p1fj7p0ng4d_modules_sops_secrets_for_users fill:#e5b2d3,color:#000000
    style nqxl6rnhgb4smk94vl6khnshw9dkj39qh_nixos fill:#b2e5c7,color:#000000
    style nqxl6rnhgb4smk94vl6khnshw9dkj39qh_nixos_common_nix fill:#b2e5c7,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_global_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_docker_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_networkmanager_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_boot_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_desktop_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_audio_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_pipewire_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_virtualisation_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_services_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_avahi_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_packages_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_configurations_nico_rclone_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#cdb2e5,color:#000000
    style nfiinqhapb1s5k4xzz2lfp79abpsyszkx_nixos_modules_installer_scan_not_detected_nix fill:#e5d4b2,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_eden_nix fill:#cdb2e5,color:#000000
    style ndfdqxd6gkpdrfyl1nkm077281a4bf569_modules_xone_dongle_nix fill:#cdb2e5,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_flake_nix["`**flake.nix**

_xvdzzrd1fmk7fvljap69hxzy2g5ycadk_`"]
    nq3nbs6w56yzkbm922y9bdwpbzaqbpscn_module_nix["`**module.nix**

_q3nbs6w56yzkbm922y9bdwpbzaqbpscn_`"]
    nq3nbs6w56yzkbm922y9bdwpbzaqbpscn_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_q3nbs6w56yzkbm922y9bdwpbzaqbpscn_`"]
    nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops["`**modules/sops**

_c02rb083jsrsx6sin9gp15wgb1lhykxa_`"]
    nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops_templates["`**modules/sops/templates**

_c02rb083jsrsx6sin9gp15wgb1lhykxa_`"]
    nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_c02rb083jsrsx6sin9gp15wgb1lhykxa_`"]
    ng999kl7j0la6r1wnfgq7ndkq65q59n3r_nixos["`**nixos**

_g999kl7j0la6r1wnfgq7ndkq65q59n3r_`"]
    ng999kl7j0la6r1wnfgq7ndkq65q59n3r_nixos_common_nix["`**nixos/common.nix**

_g999kl7j0la6r1wnfgq7ndkq65q59n3r_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_global_nix["`**global.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico["`**configurations/nico**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_docker_nix["`**modules/docker.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_networkmanager_nix["`**modules/networkmanager.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_pipewire_nix["`**modules/pipewire.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_services_nix["`**configurations/nico/services.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_avahi_nix["`**modules/avahi.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_xvdzzrd1fmk7fvljap69hxzy2g5ycadk_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_disk_configuration_nix["`**machines/nico-thinkpad-nixos/disk-configuration.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_impermanence_nix["`**machines/nico-thinkpad-nixos/impermanence.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_s1a32v5n1yj0p1xda6mvkav3bcc0m54f_`"]
    nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_flake_nix --> nq3nbs6w56yzkbm922y9bdwpbzaqbpscn_module_nix
    nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_flake_nix --> nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops
    nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_flake_nix --> ng999kl7j0la6r1wnfgq7ndkq65q59n3r_nixos
    nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_flake_nix --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_global_nix
    nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_flake_nix --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico
    nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_flake_nix --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos
    nq3nbs6w56yzkbm922y9bdwpbzaqbpscn_module_nix --> nq3nbs6w56yzkbm922y9bdwpbzaqbpscn_lib_make_disk_image_nix
    nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops --> nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops_templates
    nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops --> nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops_secrets_for_users
    ng999kl7j0la6r1wnfgq7ndkq65q59n3r_nixos --> ng999kl7j0la6r1wnfgq7ndkq65q59n3r_nixos_common_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_docker_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_networkmanager_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_boot_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_desktop_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_audio_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_virtualisation_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_services_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_packages_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_rclone_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_audio_nix --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_pipewire_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_services_nix --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_avahi_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_hardware_configuration_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_disk_configuration_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_impermanence_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos --> ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_mobile_network_nix
    ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_hardware_configuration_nix --> nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_nixos_modules_installer_scan_not_detected_nix
    style nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_flake_nix fill:#e0b2e5,color:#000000
    style nq3nbs6w56yzkbm922y9bdwpbzaqbpscn_module_nix fill:#e5b2bb,color:#000000
    style nq3nbs6w56yzkbm922y9bdwpbzaqbpscn_lib_make_disk_image_nix fill:#e5b2bb,color:#000000
    style nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops fill:#b2dbe5,color:#000000
    style nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops_templates fill:#b2dbe5,color:#000000
    style nc02rb083jsrsx6sin9gp15wgb1lhykxa_modules_sops_secrets_for_users fill:#b2dbe5,color:#000000
    style ng999kl7j0la6r1wnfgq7ndkq65q59n3r_nixos fill:#d1b2e5,color:#000000
    style ng999kl7j0la6r1wnfgq7ndkq65q59n3r_nixos_common_nix fill:#d1b2e5,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_global_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_docker_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_networkmanager_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_boot_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_desktop_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_audio_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_pipewire_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_virtualisation_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_services_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_modules_avahi_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_packages_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_configurations_nico_rclone_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#e5d1b2,color:#000000
    style nxvdzzrd1fmk7fvljap69hxzy2g5ycadk_nixos_modules_installer_scan_not_detected_nix fill:#e0b2e5,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_disk_configuration_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_impermanence_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#e5d1b2,color:#000000
    style ns1a32v5n1yj0p1xda6mvkav3bcc0m54f_machines_nico_thinkpad_nixos_mobile_network_nix fill:#e5d1b2,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    nqc1mk7y86a818kxdqkis7v3f6rklqzgp_flake_nix["`**flake.nix**

_qc1mk7y86a818kxdqkis7v3f6rklqzgp_`"]
    nzj0rw3q2f8jkq50ajgzy5j7jjy2lb9v3_module_nix["`**module.nix**

_zj0rw3q2f8jkq50ajgzy5j7jjy2lb9v3_`"]
    nzj0rw3q2f8jkq50ajgzy5j7jjy2lb9v3_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_zj0rw3q2f8jkq50ajgzy5j7jjy2lb9v3_`"]
    n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops["`**modules/sops**

_3kd3vpd6pl4kycb4qjzwpryw170cizmb_`"]
    n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops_templates["`**modules/sops/templates**

_3kd3vpd6pl4kycb4qjzwpryw170cizmb_`"]
    n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_3kd3vpd6pl4kycb4qjzwpryw170cizmb_`"]
    nh70mm0rjg282h05hsk6spma51b97s0p5_nixos["`**nixos**

_h70mm0rjg282h05hsk6spma51b97s0p5_`"]
    nh70mm0rjg282h05hsk6spma51b97s0p5_nixos_common_nix["`**nixos/common.nix**

_h70mm0rjg282h05hsk6spma51b97s0p5_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_global_nix["`**global.nix**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_configurations_nixos["`**configurations/nixos**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_modules_docker_nix["`**modules/docker.nix**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_modules_headlamp_nix["`**modules/headlamp.nix**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_modules_tmux_nix["`**modules/tmux.nix**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_aa7c97lccpw52ikch82dq2s6pj75bbyv_`"]
    nqc1mk7y86a818kxdqkis7v3f6rklqzgp_flake_nix --> nzj0rw3q2f8jkq50ajgzy5j7jjy2lb9v3_module_nix
    nqc1mk7y86a818kxdqkis7v3f6rklqzgp_flake_nix --> n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops
    nqc1mk7y86a818kxdqkis7v3f6rklqzgp_flake_nix --> nh70mm0rjg282h05hsk6spma51b97s0p5_nixos
    nqc1mk7y86a818kxdqkis7v3f6rklqzgp_flake_nix --> naa7c97lccpw52ikch82dq2s6pj75bbyv_global_nix
    nqc1mk7y86a818kxdqkis7v3f6rklqzgp_flake_nix --> naa7c97lccpw52ikch82dq2s6pj75bbyv_configurations_nixos
    nqc1mk7y86a818kxdqkis7v3f6rklqzgp_flake_nix --> naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos
    nzj0rw3q2f8jkq50ajgzy5j7jjy2lb9v3_module_nix --> nzj0rw3q2f8jkq50ajgzy5j7jjy2lb9v3_lib_make_disk_image_nix
    n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops --> n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops_templates
    n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops --> n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops_secrets_for_users
    nh70mm0rjg282h05hsk6spma51b97s0p5_nixos --> nh70mm0rjg282h05hsk6spma51b97s0p5_nixos_common_nix
    naa7c97lccpw52ikch82dq2s6pj75bbyv_configurations_nixos --> naa7c97lccpw52ikch82dq2s6pj75bbyv_modules_docker_nix
    naa7c97lccpw52ikch82dq2s6pj75bbyv_configurations_nixos --> naa7c97lccpw52ikch82dq2s6pj75bbyv_modules_headlamp_nix
    naa7c97lccpw52ikch82dq2s6pj75bbyv_configurations_nixos --> naa7c97lccpw52ikch82dq2s6pj75bbyv_modules_tmux_nix
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos --> naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos --> naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_disk_configuration_nix
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos --> naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_boot_nix
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos --> naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_desktop_nix
    naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos --> naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_persistence_nix
    style nqc1mk7y86a818kxdqkis7v3f6rklqzgp_flake_nix fill:#ddb2e5,color:#000000
    style nzj0rw3q2f8jkq50ajgzy5j7jjy2lb9v3_module_nix fill:#c4b2e5,color:#000000
    style nzj0rw3q2f8jkq50ajgzy5j7jjy2lb9v3_lib_make_disk_image_nix fill:#c4b2e5,color:#000000
    style n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops fill:#e5b2c5,color:#000000
    style n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops_templates fill:#e5b2c5,color:#000000
    style n3kd3vpd6pl4kycb4qjzwpryw170cizmb_modules_sops_secrets_for_users fill:#e5b2c5,color:#000000
    style nh70mm0rjg282h05hsk6spma51b97s0p5_nixos fill:#b2e5b5,color:#000000
    style nh70mm0rjg282h05hsk6spma51b97s0p5_nixos_common_nix fill:#b2e5b5,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_global_nix fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_configurations_nixos fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_modules_docker_nix fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_modules_headlamp_nix fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_modules_tmux_nix fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_boot_nix fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_desktop_nix fill:#e2e5b2,color:#000000
    style naa7c97lccpw52ikch82dq2s6pj75bbyv_machines_nixos_virtualbox_nixos_persistence_nix fill:#e2e5b2,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    nwla95s4bllwr5zdp470zqqaj141p3zhv_flake_nix["`**flake.nix**

_wla95s4bllwr5zdp470zqqaj141p3zhv_`"]
    nh634d31yiiqwhbnk1gzm24jhv4phjkr2_module_nix["`**module.nix**

_h634d31yiiqwhbnk1gzm24jhv4phjkr2_`"]
    nh634d31yiiqwhbnk1gzm24jhv4phjkr2_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_h634d31yiiqwhbnk1gzm24jhv4phjkr2_`"]
    nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops["`**modules/sops**

_v0glg6ynhz84brc4qdn73a0qfmrmrczh_`"]
    nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops_templates["`**modules/sops/templates**

_v0glg6ynhz84brc4qdn73a0qfmrmrczh_`"]
    nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_v0glg6ynhz84brc4qdn73a0qfmrmrczh_`"]
    njr34bpsylxmg8mx49i4j3ariy99qrgnd_nixos["`**nixos**

_jr34bpsylxmg8mx49i4j3ariy99qrgnd_`"]
    njr34bpsylxmg8mx49i4j3ariy99qrgnd_nixos_common_nix["`**nixos/common.nix**

_jr34bpsylxmg8mx49i4j3ariy99qrgnd_`"]
    n18agn9nnzik4vbpqybv64l0723ilqdcy_global_nix["`**global.nix**

_18agn9nnzik4vbpqybv64l0723ilqdcy_`"]
    n18agn9nnzik4vbpqybv64l0723ilqdcy_configurations_nixos["`**configurations/nixos**

_18agn9nnzik4vbpqybv64l0723ilqdcy_`"]
    n18agn9nnzik4vbpqybv64l0723ilqdcy_modules_docker_nix["`**modules/docker.nix**

_18agn9nnzik4vbpqybv64l0723ilqdcy_`"]
    n18agn9nnzik4vbpqybv64l0723ilqdcy_modules_headlamp_nix["`**modules/headlamp.nix**

_18agn9nnzik4vbpqybv64l0723ilqdcy_`"]
    n18agn9nnzik4vbpqybv64l0723ilqdcy_modules_tmux_nix["`**modules/tmux.nix**

_18agn9nnzik4vbpqybv64l0723ilqdcy_`"]
    n18agn9nnzik4vbpqybv64l0723ilqdcy_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_18agn9nnzik4vbpqybv64l0723ilqdcy_`"]
    n18agn9nnzik4vbpqybv64l0723ilqdcy_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_18agn9nnzik4vbpqybv64l0723ilqdcy_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules["`**modules**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_build_tarball_nix["`**modules/build-tarball.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_interop_nix["`**modules/interop.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_recovery_nix["`**modules/recovery.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd["`**modules/systemd**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd_native["`**modules/systemd/native**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_usbip_nix["`**modules/usbip.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_version_nix["`**modules/version.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_welcome_nix["`**modules/welcome.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_qcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_`"]
    nwla95s4bllwr5zdp470zqqaj141p3zhv_flake_nix --> nh634d31yiiqwhbnk1gzm24jhv4phjkr2_module_nix
    nwla95s4bllwr5zdp470zqqaj141p3zhv_flake_nix --> nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops
    nwla95s4bllwr5zdp470zqqaj141p3zhv_flake_nix --> njr34bpsylxmg8mx49i4j3ariy99qrgnd_nixos
    nwla95s4bllwr5zdp470zqqaj141p3zhv_flake_nix --> n18agn9nnzik4vbpqybv64l0723ilqdcy_global_nix
    nwla95s4bllwr5zdp470zqqaj141p3zhv_flake_nix --> n18agn9nnzik4vbpqybv64l0723ilqdcy_configurations_nixos
    nwla95s4bllwr5zdp470zqqaj141p3zhv_flake_nix --> n18agn9nnzik4vbpqybv64l0723ilqdcy_machines_nixos_wsl_nixos
    nh634d31yiiqwhbnk1gzm24jhv4phjkr2_module_nix --> nh634d31yiiqwhbnk1gzm24jhv4phjkr2_lib_make_disk_image_nix
    nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops --> nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops_templates
    nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops --> nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops_secrets_for_users
    njr34bpsylxmg8mx49i4j3ariy99qrgnd_nixos --> njr34bpsylxmg8mx49i4j3ariy99qrgnd_nixos_common_nix
    n18agn9nnzik4vbpqybv64l0723ilqdcy_configurations_nixos --> n18agn9nnzik4vbpqybv64l0723ilqdcy_modules_docker_nix
    n18agn9nnzik4vbpqybv64l0723ilqdcy_configurations_nixos --> n18agn9nnzik4vbpqybv64l0723ilqdcy_modules_headlamp_nix
    n18agn9nnzik4vbpqybv64l0723ilqdcy_configurations_nixos --> n18agn9nnzik4vbpqybv64l0723ilqdcy_modules_tmux_nix
    n18agn9nnzik4vbpqybv64l0723ilqdcy_machines_nixos_wsl_nixos --> n18agn9nnzik4vbpqybv64l0723ilqdcy_machines_nixos_wsl_nixos_hardware_configuration_nix
    n18agn9nnzik4vbpqybv64l0723ilqdcy_machines_nixos_wsl_nixos --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_build_tarball_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_docker_desktop_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_interop_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_recovery_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_ssh_agent_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_usbip_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_version_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_welcome_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_wsl_conf_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_wsl_distro_nix
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd_native
    nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd_native --> nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd_native_wrap_shell_nix
    style nwla95s4bllwr5zdp470zqqaj141p3zhv_flake_nix fill:#e5b2c4,color:#000000
    style nh634d31yiiqwhbnk1gzm24jhv4phjkr2_module_nix fill:#b2e5bb,color:#000000
    style nh634d31yiiqwhbnk1gzm24jhv4phjkr2_lib_make_disk_image_nix fill:#b2e5bb,color:#000000
    style nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops fill:#b2e5dd,color:#000000
    style nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops_templates fill:#b2e5dd,color:#000000
    style nv0glg6ynhz84brc4qdn73a0qfmrmrczh_modules_sops_secrets_for_users fill:#b2e5dd,color:#000000
    style njr34bpsylxmg8mx49i4j3ariy99qrgnd_nixos fill:#e4b2e5,color:#000000
    style njr34bpsylxmg8mx49i4j3ariy99qrgnd_nixos_common_nix fill:#e4b2e5,color:#000000
    style n18agn9nnzik4vbpqybv64l0723ilqdcy_global_nix fill:#e5b2b9,color:#000000
    style n18agn9nnzik4vbpqybv64l0723ilqdcy_configurations_nixos fill:#e5b2b9,color:#000000
    style n18agn9nnzik4vbpqybv64l0723ilqdcy_modules_docker_nix fill:#e5b2b9,color:#000000
    style n18agn9nnzik4vbpqybv64l0723ilqdcy_modules_headlamp_nix fill:#e5b2b9,color:#000000
    style n18agn9nnzik4vbpqybv64l0723ilqdcy_modules_tmux_nix fill:#e5b2b9,color:#000000
    style n18agn9nnzik4vbpqybv64l0723ilqdcy_machines_nixos_wsl_nixos fill:#e5b2b9,color:#000000
    style n18agn9nnzik4vbpqybv64l0723ilqdcy_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#e5b2b9,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_build_tarball_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_docker_desktop_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_interop_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_recovery_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_ssh_agent_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd_native fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_systemd_native_wrap_shell_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_usbip_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_version_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_welcome_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_wsl_conf_nix fill:#b9b2e5,color:#000000
    style nqcza4iyhd8nd7rnpvfwp4mciq2jkp8f7_modules_wsl_distro_nix fill:#b9b2e5,color:#000000
```
