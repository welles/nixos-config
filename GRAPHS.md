# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    nmjk3176vj1yj9bbl19a83wyg53s4qwy3_flake_nix["`**flake.nix**

_mjk3176vj1yj9bbl19a83wyg53s4qwy3_`"]
    nwqrk3qsfqx4jswx16c52n26dzhxlmm9g_module_nix["`**module.nix**

_wqrk3qsfqx4jswx16c52n26dzhxlmm9g_`"]
    nwqrk3qsfqx4jswx16c52n26dzhxlmm9g_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_wqrk3qsfqx4jswx16c52n26dzhxlmm9g_`"]
    nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops["`**modules/sops**

_v1ghn9xcfc2gxk91l09nqf05xl27hvxk_`"]
    nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops_templates["`**modules/sops/templates**

_v1ghn9xcfc2gxk91l09nqf05xl27hvxk_`"]
    nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_v1ghn9xcfc2gxk91l09nqf05xl27hvxk_`"]
    ng2dpapnvwaqaafxx5qlzss9z13bjcvvn_nixos["`**nixos**

_g2dpapnvwaqaafxx5qlzss9z13bjcvvn_`"]
    ng2dpapnvwaqaafxx5qlzss9z13bjcvvn_nixos_common_nix["`**nixos/common.nix**

_g2dpapnvwaqaafxx5qlzss9z13bjcvvn_`"]
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_global_nix["`**global.nix**

_2ahf0s6nlzjfm844hkm86gxwxva7axjy_`"]
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_configurations_eltern["`**configurations/eltern**

_2ahf0s6nlzjfm844hkm86gxwxva7axjy_`"]
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_modules_networkmanager_nix["`**modules/networkmanager.nix**

_2ahf0s6nlzjfm844hkm86gxwxva7axjy_`"]
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_modules_avahi_nix["`**modules/avahi.nix**

_2ahf0s6nlzjfm844hkm86gxwxva7axjy_`"]
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_2ahf0s6nlzjfm844hkm86gxwxva7axjy_`"]
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_2ahf0s6nlzjfm844hkm86gxwxva7axjy_`"]
    nmjk3176vj1yj9bbl19a83wyg53s4qwy3_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_mjk3176vj1yj9bbl19a83wyg53s4qwy3_`"]
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_2ahf0s6nlzjfm844hkm86gxwxva7axjy_`"]
    nmjk3176vj1yj9bbl19a83wyg53s4qwy3_flake_nix --> nwqrk3qsfqx4jswx16c52n26dzhxlmm9g_module_nix
    nmjk3176vj1yj9bbl19a83wyg53s4qwy3_flake_nix --> nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops
    nmjk3176vj1yj9bbl19a83wyg53s4qwy3_flake_nix --> ng2dpapnvwaqaafxx5qlzss9z13bjcvvn_nixos
    nmjk3176vj1yj9bbl19a83wyg53s4qwy3_flake_nix --> n2ahf0s6nlzjfm844hkm86gxwxva7axjy_global_nix
    nmjk3176vj1yj9bbl19a83wyg53s4qwy3_flake_nix --> n2ahf0s6nlzjfm844hkm86gxwxva7axjy_configurations_eltern
    nmjk3176vj1yj9bbl19a83wyg53s4qwy3_flake_nix --> n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos
    nwqrk3qsfqx4jswx16c52n26dzhxlmm9g_module_nix --> nwqrk3qsfqx4jswx16c52n26dzhxlmm9g_lib_make_disk_image_nix
    nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops --> nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops_templates
    nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops --> nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops_secrets_for_users
    ng2dpapnvwaqaafxx5qlzss9z13bjcvvn_nixos --> ng2dpapnvwaqaafxx5qlzss9z13bjcvvn_nixos_common_nix
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_configurations_eltern --> n2ahf0s6nlzjfm844hkm86gxwxva7axjy_modules_networkmanager_nix
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_configurations_eltern --> n2ahf0s6nlzjfm844hkm86gxwxva7axjy_modules_avahi_nix
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos --> n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos_hardware_configuration_nix
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos --> n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos_disk_configuration_nix
    n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos_hardware_configuration_nix --> nmjk3176vj1yj9bbl19a83wyg53s4qwy3_nixos_modules_installer_scan_not_detected_nix
    style nmjk3176vj1yj9bbl19a83wyg53s4qwy3_flake_nix fill:#e5b2c9,color:#000000
    style nwqrk3qsfqx4jswx16c52n26dzhxlmm9g_module_nix fill:#b2e5d2,color:#000000
    style nwqrk3qsfqx4jswx16c52n26dzhxlmm9g_lib_make_disk_image_nix fill:#b2e5d2,color:#000000
    style nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops fill:#b2e5cc,color:#000000
    style nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops_templates fill:#b2e5cc,color:#000000
    style nv1ghn9xcfc2gxk91l09nqf05xl27hvxk_modules_sops_secrets_for_users fill:#b2e5cc,color:#000000
    style ng2dpapnvwaqaafxx5qlzss9z13bjcvvn_nixos fill:#b2bce5,color:#000000
    style ng2dpapnvwaqaafxx5qlzss9z13bjcvvn_nixos_common_nix fill:#b2bce5,color:#000000
    style n2ahf0s6nlzjfm844hkm86gxwxva7axjy_global_nix fill:#b2e5d9,color:#000000
    style n2ahf0s6nlzjfm844hkm86gxwxva7axjy_configurations_eltern fill:#b2e5d9,color:#000000
    style n2ahf0s6nlzjfm844hkm86gxwxva7axjy_modules_networkmanager_nix fill:#b2e5d9,color:#000000
    style n2ahf0s6nlzjfm844hkm86gxwxva7axjy_modules_avahi_nix fill:#b2e5d9,color:#000000
    style n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos fill:#b2e5d9,color:#000000
    style n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos_hardware_configuration_nix fill:#b2e5d9,color:#000000
    style nmjk3176vj1yj9bbl19a83wyg53s4qwy3_nixos_modules_installer_scan_not_detected_nix fill:#e5b2c9,color:#000000
    style n2ahf0s6nlzjfm844hkm86gxwxva7axjy_machines_eltern_asus_nixos_disk_configuration_nix fill:#b2e5d9,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    nq1z9705wy35wvjf076yz3bxvh08zpsjy_flake_nix["`**flake.nix**

_q1z9705wy35wvjf076yz3bxvh08zpsjy_`"]
    ny417p3lymbh65q1hrwwsmnlkziam2lab_module_nix["`**module.nix**

_y417p3lymbh65q1hrwwsmnlkziam2lab_`"]
    ny417p3lymbh65q1hrwwsmnlkziam2lab_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_y417p3lymbh65q1hrwwsmnlkziam2lab_`"]
    nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops["`**modules/sops**

_vq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_`"]
    nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops_templates["`**modules/sops/templates**

_vq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_`"]
    nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_vq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_`"]
    n4nmfar5m0ycmvpm90s0c2kdgb846q5ar_nixos["`**nixos**

_4nmfar5m0ycmvpm90s0c2kdgb846q5ar_`"]
    n4nmfar5m0ycmvpm90s0c2kdgb846q5ar_nixos_common_nix["`**nixos/common.nix**

_4nmfar5m0ycmvpm90s0c2kdgb846q5ar_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_global_nix["`**global.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch["`**configurations/schokoladenelch**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_docker_nix["`**modules/docker.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_networkmanager_nix["`**modules/networkmanager.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_tmux_nix["`**modules/tmux.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_check_mkv["`**modules/scripts/check-mkv**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_create_zfs_dataset["`**modules/scripts/create-zfs-dataset**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_stacks_default_nix["`**modules/stacks/default.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nq1z9705wy35wvjf076yz3bxvh08zpsjy_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_q1z9705wy35wvjf076yz3bxvh08zpsjy_`"]
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_nqbjgybrj1zawdhahhlpq6zq8pvirs6p_`"]
    nq1z9705wy35wvjf076yz3bxvh08zpsjy_flake_nix --> ny417p3lymbh65q1hrwwsmnlkziam2lab_module_nix
    nq1z9705wy35wvjf076yz3bxvh08zpsjy_flake_nix --> nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops
    nq1z9705wy35wvjf076yz3bxvh08zpsjy_flake_nix --> n4nmfar5m0ycmvpm90s0c2kdgb846q5ar_nixos
    nq1z9705wy35wvjf076yz3bxvh08zpsjy_flake_nix --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_global_nix
    nq1z9705wy35wvjf076yz3bxvh08zpsjy_flake_nix --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch
    nq1z9705wy35wvjf076yz3bxvh08zpsjy_flake_nix --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos
    ny417p3lymbh65q1hrwwsmnlkziam2lab_module_nix --> ny417p3lymbh65q1hrwwsmnlkziam2lab_lib_make_disk_image_nix
    nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops --> nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops_templates
    nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops --> nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops_secrets_for_users
    n4nmfar5m0ycmvpm90s0c2kdgb846q5ar_nixos --> n4nmfar5m0ycmvpm90s0c2kdgb846q5ar_nixos_common_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_docker_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_networkmanager_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_tmux_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_check_mkv
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_create_zfs_dataset
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_zfs_manual_snapshot
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_zfs_snapshot_diff
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_boot_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_networking_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_services_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_persistence_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_stacks_default_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos --> nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> nq1z9705wy35wvjf076yz3bxvh08zpsjy_nixos_modules_installer_scan_not_detected_nix
    style nq1z9705wy35wvjf076yz3bxvh08zpsjy_flake_nix fill:#e5b2bd,color:#000000
    style ny417p3lymbh65q1hrwwsmnlkziam2lab_module_nix fill:#dbe5b2,color:#000000
    style ny417p3lymbh65q1hrwwsmnlkziam2lab_lib_make_disk_image_nix fill:#dbe5b2,color:#000000
    style nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops fill:#e5b2e5,color:#000000
    style nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops_templates fill:#e5b2e5,color:#000000
    style nvq6kz1ffqm1dibnrs3dqmvv8g5c0s19p_modules_sops_secrets_for_users fill:#e5b2e5,color:#000000
    style n4nmfar5m0ycmvpm90s0c2kdgb846q5ar_nixos fill:#e5b2b3,color:#000000
    style n4nmfar5m0ycmvpm90s0c2kdgb846q5ar_nixos_common_nix fill:#e5b2b3,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_global_nix fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_docker_nix fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_networkmanager_nix fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_tmux_nix fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_check_mkv fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_create_zfs_dataset fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_zfs_manual_snapshot fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_scripts_zfs_snapshot_diff fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_boot_nix fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_networking_nix fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_services_nix fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_configurations_schokoladenelch_persistence_nix fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_modules_stacks_default_nix fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos fill:#b2b5e5,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#b2b5e5,color:#000000
    style nq1z9705wy35wvjf076yz3bxvh08zpsjy_nixos_modules_installer_scan_not_detected_nix fill:#e5b2bd,color:#000000
    style nnqbjgybrj1zawdhahhlpq6zq8pvirs6p_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#b2b5e5,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    njaqqyj5hazc7x785yzshhqxaa9hn37fh_flake_nix["`**flake.nix**

_jaqqyj5hazc7x785yzshhqxaa9hn37fh_`"]
    ni8k78hyhck4j81hh34k8x9baah2115dn_module_nix["`**module.nix**

_i8k78hyhck4j81hh34k8x9baah2115dn_`"]
    ni8k78hyhck4j81hh34k8x9baah2115dn_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_i8k78hyhck4j81hh34k8x9baah2115dn_`"]
    nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops["`**modules/sops**

_mvy5l7h0py86zbn4nplfvgv7ka8qxfsm_`"]
    nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops_templates["`**modules/sops/templates**

_mvy5l7h0py86zbn4nplfvgv7ka8qxfsm_`"]
    nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_mvy5l7h0py86zbn4nplfvgv7ka8qxfsm_`"]
    n7nlqyzj6hzl6y9css7zkhcbimxnb34y1_nixos["`**nixos**

_7nlqyzj6hzl6y9css7zkhcbimxnb34y1_`"]
    n7nlqyzj6hzl6y9css7zkhcbimxnb34y1_nixos_common_nix["`**nixos/common.nix**

_7nlqyzj6hzl6y9css7zkhcbimxnb34y1_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_global_nix["`**global.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico["`**configurations/nico**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_docker_nix["`**modules/docker.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_networkmanager_nix["`**modules/networkmanager.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_pipewire_nix["`**modules/pipewire.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_services_nix["`**configurations/nico/services.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_avahi_nix["`**modules/avahi.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    njaqqyj5hazc7x785yzshhqxaa9hn37fh_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_jaqqyj5hazc7x785yzshhqxaa9hn37fh_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_eden_nix["`**modules/eden.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_g4cdi40rl48aaywp0ka5nal0ais8qbdj_`"]
    njaqqyj5hazc7x785yzshhqxaa9hn37fh_flake_nix --> ni8k78hyhck4j81hh34k8x9baah2115dn_module_nix
    njaqqyj5hazc7x785yzshhqxaa9hn37fh_flake_nix --> nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops
    njaqqyj5hazc7x785yzshhqxaa9hn37fh_flake_nix --> n7nlqyzj6hzl6y9css7zkhcbimxnb34y1_nixos
    njaqqyj5hazc7x785yzshhqxaa9hn37fh_flake_nix --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_global_nix
    njaqqyj5hazc7x785yzshhqxaa9hn37fh_flake_nix --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico
    njaqqyj5hazc7x785yzshhqxaa9hn37fh_flake_nix --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos
    ni8k78hyhck4j81hh34k8x9baah2115dn_module_nix --> ni8k78hyhck4j81hh34k8x9baah2115dn_lib_make_disk_image_nix
    nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops --> nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops_templates
    nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops --> nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops_secrets_for_users
    n7nlqyzj6hzl6y9css7zkhcbimxnb34y1_nixos --> n7nlqyzj6hzl6y9css7zkhcbimxnb34y1_nixos_common_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_docker_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_networkmanager_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_boot_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_desktop_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_audio_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_virtualisation_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_services_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_packages_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_rclone_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_audio_nix --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_pipewire_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_services_nix --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_avahi_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos_hardware_configuration_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_eden_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos --> ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_xone_dongle_nix
    ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos_hardware_configuration_nix --> njaqqyj5hazc7x785yzshhqxaa9hn37fh_nixos_modules_installer_scan_not_detected_nix
    style njaqqyj5hazc7x785yzshhqxaa9hn37fh_flake_nix fill:#e1e5b2,color:#000000
    style ni8k78hyhck4j81hh34k8x9baah2115dn_module_nix fill:#e5b2d7,color:#000000
    style ni8k78hyhck4j81hh34k8x9baah2115dn_lib_make_disk_image_nix fill:#e5b2d7,color:#000000
    style nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops fill:#b2c5e5,color:#000000
    style nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops_templates fill:#b2c5e5,color:#000000
    style nmvy5l7h0py86zbn4nplfvgv7ka8qxfsm_modules_sops_secrets_for_users fill:#b2c5e5,color:#000000
    style n7nlqyzj6hzl6y9css7zkhcbimxnb34y1_nixos fill:#b2dde5,color:#000000
    style n7nlqyzj6hzl6y9css7zkhcbimxnb34y1_nixos_common_nix fill:#b2dde5,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_global_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_docker_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_networkmanager_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_boot_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_desktop_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_audio_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_pipewire_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_virtualisation_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_services_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_avahi_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_packages_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_configurations_nico_rclone_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#d0e5b2,color:#000000
    style njaqqyj5hazc7x785yzshhqxaa9hn37fh_nixos_modules_installer_scan_not_detected_nix fill:#e1e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_eden_nix fill:#d0e5b2,color:#000000
    style ng4cdi40rl48aaywp0ka5nal0ais8qbdj_modules_xone_dongle_nix fill:#d0e5b2,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    nkb4vprlq0260qh4wbc3yp9d0wzclm624_flake_nix["`**flake.nix**

_kb4vprlq0260qh4wbc3yp9d0wzclm624_`"]
    nbsdk45d3lgdxyfdnwz7qgm1qbs0q2bw0_module_nix["`**module.nix**

_bsdk45d3lgdxyfdnwz7qgm1qbs0q2bw0_`"]
    nbsdk45d3lgdxyfdnwz7qgm1qbs0q2bw0_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_bsdk45d3lgdxyfdnwz7qgm1qbs0q2bw0_`"]
    n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops["`**modules/sops**

_119k9rs64bng5fhcw8z1gnfxs4pw7xs9_`"]
    n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops_templates["`**modules/sops/templates**

_119k9rs64bng5fhcw8z1gnfxs4pw7xs9_`"]
    n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_119k9rs64bng5fhcw8z1gnfxs4pw7xs9_`"]
    nc622p2pqwlh4zljm1q48a5gahss417lz_nixos["`**nixos**

_c622p2pqwlh4zljm1q48a5gahss417lz_`"]
    nc622p2pqwlh4zljm1q48a5gahss417lz_nixos_common_nix["`**nixos/common.nix**

_c622p2pqwlh4zljm1q48a5gahss417lz_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_global_nix["`**global.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico["`**configurations/nico**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_docker_nix["`**modules/docker.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_networkmanager_nix["`**modules/networkmanager.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_pipewire_nix["`**modules/pipewire.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_services_nix["`**configurations/nico/services.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_avahi_nix["`**modules/avahi.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nkb4vprlq0260qh4wbc3yp9d0wzclm624_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_kb4vprlq0260qh4wbc3yp9d0wzclm624_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_disk_configuration_nix["`**machines/nico-thinkpad-nixos/disk-configuration.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_impermanence_nix["`**machines/nico-thinkpad-nixos/impermanence.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_z091mjqna8z3dv9inqqv3bdk5h65xps9_`"]
    nkb4vprlq0260qh4wbc3yp9d0wzclm624_flake_nix --> nbsdk45d3lgdxyfdnwz7qgm1qbs0q2bw0_module_nix
    nkb4vprlq0260qh4wbc3yp9d0wzclm624_flake_nix --> n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops
    nkb4vprlq0260qh4wbc3yp9d0wzclm624_flake_nix --> nc622p2pqwlh4zljm1q48a5gahss417lz_nixos
    nkb4vprlq0260qh4wbc3yp9d0wzclm624_flake_nix --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_global_nix
    nkb4vprlq0260qh4wbc3yp9d0wzclm624_flake_nix --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico
    nkb4vprlq0260qh4wbc3yp9d0wzclm624_flake_nix --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos
    nbsdk45d3lgdxyfdnwz7qgm1qbs0q2bw0_module_nix --> nbsdk45d3lgdxyfdnwz7qgm1qbs0q2bw0_lib_make_disk_image_nix
    n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops --> n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops_templates
    n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops --> n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops_secrets_for_users
    nc622p2pqwlh4zljm1q48a5gahss417lz_nixos --> nc622p2pqwlh4zljm1q48a5gahss417lz_nixos_common_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_docker_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_networkmanager_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_boot_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_desktop_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_audio_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_virtualisation_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_services_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_packages_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_rclone_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_audio_nix --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_pipewire_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_services_nix --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_avahi_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_hardware_configuration_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_disk_configuration_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_impermanence_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos --> nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_mobile_network_nix
    nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_hardware_configuration_nix --> nkb4vprlq0260qh4wbc3yp9d0wzclm624_nixos_modules_installer_scan_not_detected_nix
    style nkb4vprlq0260qh4wbc3yp9d0wzclm624_flake_nix fill:#e5c4b2,color:#000000
    style nbsdk45d3lgdxyfdnwz7qgm1qbs0q2bw0_module_nix fill:#e5b2e5,color:#000000
    style nbsdk45d3lgdxyfdnwz7qgm1qbs0q2bw0_lib_make_disk_image_nix fill:#e5b2e5,color:#000000
    style n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops fill:#e5b2d6,color:#000000
    style n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops_templates fill:#e5b2d6,color:#000000
    style n119k9rs64bng5fhcw8z1gnfxs4pw7xs9_modules_sops_secrets_for_users fill:#e5b2d6,color:#000000
    style nc622p2pqwlh4zljm1q48a5gahss417lz_nixos fill:#b2e5dd,color:#000000
    style nc622p2pqwlh4zljm1q48a5gahss417lz_nixos_common_nix fill:#b2e5dd,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_global_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_docker_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_networkmanager_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_boot_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_desktop_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_audio_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_pipewire_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_virtualisation_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_services_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_modules_avahi_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_packages_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_configurations_nico_rclone_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#dde5b2,color:#000000
    style nkb4vprlq0260qh4wbc3yp9d0wzclm624_nixos_modules_installer_scan_not_detected_nix fill:#e5c4b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_disk_configuration_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_impermanence_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#dde5b2,color:#000000
    style nz091mjqna8z3dv9inqqv3bdk5h65xps9_machines_nico_thinkpad_nixos_mobile_network_nix fill:#dde5b2,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    n1jb0jadf465j2dm8qz2hg1lib1pkp2r8_flake_nix["`**flake.nix**

_1jb0jadf465j2dm8qz2hg1lib1pkp2r8_`"]
    ngm8cw0zv5sfp3y7hcfvh91gwhpckvph6_module_nix["`**module.nix**

_gm8cw0zv5sfp3y7hcfvh91gwhpckvph6_`"]
    ngm8cw0zv5sfp3y7hcfvh91gwhpckvph6_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_gm8cw0zv5sfp3y7hcfvh91gwhpckvph6_`"]
    npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops["`**modules/sops**

_pppry3v7jjf3allxqml5cq8024yw0m2r_`"]
    npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops_templates["`**modules/sops/templates**

_pppry3v7jjf3allxqml5cq8024yw0m2r_`"]
    npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_pppry3v7jjf3allxqml5cq8024yw0m2r_`"]
    ny6k3wrw7ndf2963p69k3xbhdxlvjzgf0_nixos["`**nixos**

_y6k3wrw7ndf2963p69k3xbhdxlvjzgf0_`"]
    ny6k3wrw7ndf2963p69k3xbhdxlvjzgf0_nixos_common_nix["`**nixos/common.nix**

_y6k3wrw7ndf2963p69k3xbhdxlvjzgf0_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_global_nix["`**global.nix**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_configurations_nixos["`**configurations/nixos**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_modules_docker_nix["`**modules/docker.nix**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_modules_headlamp_nix["`**modules/headlamp.nix**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_modules_tmux_nix["`**modules/tmux.nix**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_rcipljnvffia47jzwzkadarljilh83zp_`"]
    n1jb0jadf465j2dm8qz2hg1lib1pkp2r8_flake_nix --> ngm8cw0zv5sfp3y7hcfvh91gwhpckvph6_module_nix
    n1jb0jadf465j2dm8qz2hg1lib1pkp2r8_flake_nix --> npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops
    n1jb0jadf465j2dm8qz2hg1lib1pkp2r8_flake_nix --> ny6k3wrw7ndf2963p69k3xbhdxlvjzgf0_nixos
    n1jb0jadf465j2dm8qz2hg1lib1pkp2r8_flake_nix --> nrcipljnvffia47jzwzkadarljilh83zp_global_nix
    n1jb0jadf465j2dm8qz2hg1lib1pkp2r8_flake_nix --> nrcipljnvffia47jzwzkadarljilh83zp_configurations_nixos
    n1jb0jadf465j2dm8qz2hg1lib1pkp2r8_flake_nix --> nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos
    ngm8cw0zv5sfp3y7hcfvh91gwhpckvph6_module_nix --> ngm8cw0zv5sfp3y7hcfvh91gwhpckvph6_lib_make_disk_image_nix
    npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops --> npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops_templates
    npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops --> npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops_secrets_for_users
    ny6k3wrw7ndf2963p69k3xbhdxlvjzgf0_nixos --> ny6k3wrw7ndf2963p69k3xbhdxlvjzgf0_nixos_common_nix
    nrcipljnvffia47jzwzkadarljilh83zp_configurations_nixos --> nrcipljnvffia47jzwzkadarljilh83zp_modules_docker_nix
    nrcipljnvffia47jzwzkadarljilh83zp_configurations_nixos --> nrcipljnvffia47jzwzkadarljilh83zp_modules_headlamp_nix
    nrcipljnvffia47jzwzkadarljilh83zp_configurations_nixos --> nrcipljnvffia47jzwzkadarljilh83zp_modules_tmux_nix
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos --> nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos --> nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_disk_configuration_nix
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos --> nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_boot_nix
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos --> nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_desktop_nix
    nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos --> nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_persistence_nix
    style n1jb0jadf465j2dm8qz2hg1lib1pkp2r8_flake_nix fill:#e5b2bb,color:#000000
    style ngm8cw0zv5sfp3y7hcfvh91gwhpckvph6_module_nix fill:#c1b2e5,color:#000000
    style ngm8cw0zv5sfp3y7hcfvh91gwhpckvph6_lib_make_disk_image_nix fill:#c1b2e5,color:#000000
    style npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops fill:#b2e5bf,color:#000000
    style npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops_templates fill:#b2e5bf,color:#000000
    style npppry3v7jjf3allxqml5cq8024yw0m2r_modules_sops_secrets_for_users fill:#b2e5bf,color:#000000
    style ny6k3wrw7ndf2963p69k3xbhdxlvjzgf0_nixos fill:#d9e5b2,color:#000000
    style ny6k3wrw7ndf2963p69k3xbhdxlvjzgf0_nixos_common_nix fill:#d9e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_global_nix fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_configurations_nixos fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_modules_docker_nix fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_modules_headlamp_nix fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_modules_tmux_nix fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_boot_nix fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_desktop_nix fill:#d7e5b2,color:#000000
    style nrcipljnvffia47jzwzkadarljilh83zp_machines_nixos_virtualbox_nixos_persistence_nix fill:#d7e5b2,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    nj0z7ky1zzgarfqwm0702q5ngp3vjlr30_flake_nix["`**flake.nix**

_j0z7ky1zzgarfqwm0702q5ngp3vjlr30_`"]
    nvzkshhpghprfca78ckcn3pg3h8fq1smk_module_nix["`**module.nix**

_vzkshhpghprfca78ckcn3pg3h8fq1smk_`"]
    nvzkshhpghprfca78ckcn3pg3h8fq1smk_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_vzkshhpghprfca78ckcn3pg3h8fq1smk_`"]
    ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops["`**modules/sops**

_djpki8ypgydnnzfj3cm6jr55c26qllmr_`"]
    ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops_templates["`**modules/sops/templates**

_djpki8ypgydnnzfj3cm6jr55c26qllmr_`"]
    ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_djpki8ypgydnnzfj3cm6jr55c26qllmr_`"]
    nnic2ndw7n1f4j4zi2sg4h04xyaqbg015_nixos["`**nixos**

_nic2ndw7n1f4j4zi2sg4h04xyaqbg015_`"]
    nnic2ndw7n1f4j4zi2sg4h04xyaqbg015_nixos_common_nix["`**nixos/common.nix**

_nic2ndw7n1f4j4zi2sg4h04xyaqbg015_`"]
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_global_nix["`**global.nix**

_qwh9msjr9q0blixdzvqvhraiaxn49xs4_`"]
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_configurations_nixos["`**configurations/nixos**

_qwh9msjr9q0blixdzvqvhraiaxn49xs4_`"]
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_modules_docker_nix["`**modules/docker.nix**

_qwh9msjr9q0blixdzvqvhraiaxn49xs4_`"]
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_modules_headlamp_nix["`**modules/headlamp.nix**

_qwh9msjr9q0blixdzvqvhraiaxn49xs4_`"]
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_modules_tmux_nix["`**modules/tmux.nix**

_qwh9msjr9q0blixdzvqvhraiaxn49xs4_`"]
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_qwh9msjr9q0blixdzvqvhraiaxn49xs4_`"]
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_qwh9msjr9q0blixdzvqvhraiaxn49xs4_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules["`**modules**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_build_tarball_nix["`**modules/build-tarball.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_interop_nix["`**modules/interop.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_recovery_nix["`**modules/recovery.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd["`**modules/systemd**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd_native["`**modules/systemd/native**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_usbip_nix["`**modules/usbip.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_version_nix["`**modules/version.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_welcome_nix["`**modules/welcome.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_qp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_`"]
    nj0z7ky1zzgarfqwm0702q5ngp3vjlr30_flake_nix --> nvzkshhpghprfca78ckcn3pg3h8fq1smk_module_nix
    nj0z7ky1zzgarfqwm0702q5ngp3vjlr30_flake_nix --> ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops
    nj0z7ky1zzgarfqwm0702q5ngp3vjlr30_flake_nix --> nnic2ndw7n1f4j4zi2sg4h04xyaqbg015_nixos
    nj0z7ky1zzgarfqwm0702q5ngp3vjlr30_flake_nix --> nqwh9msjr9q0blixdzvqvhraiaxn49xs4_global_nix
    nj0z7ky1zzgarfqwm0702q5ngp3vjlr30_flake_nix --> nqwh9msjr9q0blixdzvqvhraiaxn49xs4_configurations_nixos
    nj0z7ky1zzgarfqwm0702q5ngp3vjlr30_flake_nix --> nqwh9msjr9q0blixdzvqvhraiaxn49xs4_machines_nixos_wsl_nixos
    nvzkshhpghprfca78ckcn3pg3h8fq1smk_module_nix --> nvzkshhpghprfca78ckcn3pg3h8fq1smk_lib_make_disk_image_nix
    ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops --> ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops_templates
    ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops --> ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops_secrets_for_users
    nnic2ndw7n1f4j4zi2sg4h04xyaqbg015_nixos --> nnic2ndw7n1f4j4zi2sg4h04xyaqbg015_nixos_common_nix
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_configurations_nixos --> nqwh9msjr9q0blixdzvqvhraiaxn49xs4_modules_docker_nix
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_configurations_nixos --> nqwh9msjr9q0blixdzvqvhraiaxn49xs4_modules_headlamp_nix
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_configurations_nixos --> nqwh9msjr9q0blixdzvqvhraiaxn49xs4_modules_tmux_nix
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_machines_nixos_wsl_nixos --> nqwh9msjr9q0blixdzvqvhraiaxn49xs4_machines_nixos_wsl_nixos_hardware_configuration_nix
    nqwh9msjr9q0blixdzvqvhraiaxn49xs4_machines_nixos_wsl_nixos --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_build_tarball_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_docker_desktop_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_interop_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_recovery_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_ssh_agent_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_usbip_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_version_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_welcome_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_wsl_conf_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_wsl_distro_nix
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd_native
    nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd_native --> nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd_native_wrap_shell_nix
    style nj0z7ky1zzgarfqwm0702q5ngp3vjlr30_flake_nix fill:#d7e5b2,color:#000000
    style nvzkshhpghprfca78ckcn3pg3h8fq1smk_module_nix fill:#b2e5be,color:#000000
    style nvzkshhpghprfca78ckcn3pg3h8fq1smk_lib_make_disk_image_nix fill:#b2e5be,color:#000000
    style ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops fill:#e5b2cc,color:#000000
    style ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops_templates fill:#e5b2cc,color:#000000
    style ndjpki8ypgydnnzfj3cm6jr55c26qllmr_modules_sops_secrets_for_users fill:#e5b2cc,color:#000000
    style nnic2ndw7n1f4j4zi2sg4h04xyaqbg015_nixos fill:#b2bfe5,color:#000000
    style nnic2ndw7n1f4j4zi2sg4h04xyaqbg015_nixos_common_nix fill:#b2bfe5,color:#000000
    style nqwh9msjr9q0blixdzvqvhraiaxn49xs4_global_nix fill:#e5b2d1,color:#000000
    style nqwh9msjr9q0blixdzvqvhraiaxn49xs4_configurations_nixos fill:#e5b2d1,color:#000000
    style nqwh9msjr9q0blixdzvqvhraiaxn49xs4_modules_docker_nix fill:#e5b2d1,color:#000000
    style nqwh9msjr9q0blixdzvqvhraiaxn49xs4_modules_headlamp_nix fill:#e5b2d1,color:#000000
    style nqwh9msjr9q0blixdzvqvhraiaxn49xs4_modules_tmux_nix fill:#e5b2d1,color:#000000
    style nqwh9msjr9q0blixdzvqvhraiaxn49xs4_machines_nixos_wsl_nixos fill:#e5b2d1,color:#000000
    style nqwh9msjr9q0blixdzvqvhraiaxn49xs4_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#e5b2d1,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_build_tarball_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_docker_desktop_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_interop_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_recovery_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_ssh_agent_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd_native fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_systemd_native_wrap_shell_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_usbip_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_version_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_welcome_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_wsl_conf_nix fill:#e5b2c2,color:#000000
    style nqp7d4zzlhlh7bfx2agiqgj5kq83mgq5v_modules_wsl_distro_nix fill:#e5b2c2,color:#000000
```
