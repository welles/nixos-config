# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    nwlhh48cg7zd9fp5159s1glchxcp7jh98_flake_nix["`**flake.nix**

_wlhh48cg7zd9fp5159s1glchxcp7jh98_`"]
    nki0wr48qn7fk4920x6l3zgrg7nzasmgx_module_nix["`**module.nix**

_ki0wr48qn7fk4920x6l3zgrg7nzasmgx_`"]
    nki0wr48qn7fk4920x6l3zgrg7nzasmgx_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_ki0wr48qn7fk4920x6l3zgrg7nzasmgx_`"]
    nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops["`**modules/sops**

_mjypmy440j0pqvdf1sl2ib53mw4h286c_`"]
    nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops_templates["`**modules/sops/templates**

_mjypmy440j0pqvdf1sl2ib53mw4h286c_`"]
    nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_mjypmy440j0pqvdf1sl2ib53mw4h286c_`"]
    n19izv0cp4qidc571j4anp4j1p4h2rdja_nixos["`**nixos**

_19izv0cp4qidc571j4anp4j1p4h2rdja_`"]
    n19izv0cp4qidc571j4anp4j1p4h2rdja_nixos_common_nix["`**nixos/common.nix**

_19izv0cp4qidc571j4anp4j1p4h2rdja_`"]
    ngalnn1432m0gacr4200r533bzpvna88m_global_nix["`**global.nix**

_galnn1432m0gacr4200r533bzpvna88m_`"]
    ngalnn1432m0gacr4200r533bzpvna88m_configurations_eltern["`**configurations/eltern**

_galnn1432m0gacr4200r533bzpvna88m_`"]
    ngalnn1432m0gacr4200r533bzpvna88m_modules_networkmanager_nix["`**modules/networkmanager.nix**

_galnn1432m0gacr4200r533bzpvna88m_`"]
    ngalnn1432m0gacr4200r533bzpvna88m_modules_avahi_nix["`**modules/avahi.nix**

_galnn1432m0gacr4200r533bzpvna88m_`"]
    ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_galnn1432m0gacr4200r533bzpvna88m_`"]
    ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_galnn1432m0gacr4200r533bzpvna88m_`"]
    nwlhh48cg7zd9fp5159s1glchxcp7jh98_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_wlhh48cg7zd9fp5159s1glchxcp7jh98_`"]
    ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_galnn1432m0gacr4200r533bzpvna88m_`"]
    nwlhh48cg7zd9fp5159s1glchxcp7jh98_flake_nix --> nki0wr48qn7fk4920x6l3zgrg7nzasmgx_module_nix
    nwlhh48cg7zd9fp5159s1glchxcp7jh98_flake_nix --> nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops
    nwlhh48cg7zd9fp5159s1glchxcp7jh98_flake_nix --> n19izv0cp4qidc571j4anp4j1p4h2rdja_nixos
    nwlhh48cg7zd9fp5159s1glchxcp7jh98_flake_nix --> ngalnn1432m0gacr4200r533bzpvna88m_global_nix
    nwlhh48cg7zd9fp5159s1glchxcp7jh98_flake_nix --> ngalnn1432m0gacr4200r533bzpvna88m_configurations_eltern
    nwlhh48cg7zd9fp5159s1glchxcp7jh98_flake_nix --> ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos
    nki0wr48qn7fk4920x6l3zgrg7nzasmgx_module_nix --> nki0wr48qn7fk4920x6l3zgrg7nzasmgx_lib_make_disk_image_nix
    nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops --> nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops_templates
    nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops --> nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops_secrets_for_users
    n19izv0cp4qidc571j4anp4j1p4h2rdja_nixos --> n19izv0cp4qidc571j4anp4j1p4h2rdja_nixos_common_nix
    ngalnn1432m0gacr4200r533bzpvna88m_configurations_eltern --> ngalnn1432m0gacr4200r533bzpvna88m_modules_networkmanager_nix
    ngalnn1432m0gacr4200r533bzpvna88m_configurations_eltern --> ngalnn1432m0gacr4200r533bzpvna88m_modules_avahi_nix
    ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos --> ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos_hardware_configuration_nix
    ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos --> ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos_disk_configuration_nix
    ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos_hardware_configuration_nix --> nwlhh48cg7zd9fp5159s1glchxcp7jh98_nixos_modules_installer_scan_not_detected_nix
    style nwlhh48cg7zd9fp5159s1glchxcp7jh98_flake_nix fill:#b2bde5,color:#000000
    style nki0wr48qn7fk4920x6l3zgrg7nzasmgx_module_nix fill:#b2e5c4,color:#000000
    style nki0wr48qn7fk4920x6l3zgrg7nzasmgx_lib_make_disk_image_nix fill:#b2e5c4,color:#000000
    style nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops fill:#d2e5b2,color:#000000
    style nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops_templates fill:#d2e5b2,color:#000000
    style nmjypmy440j0pqvdf1sl2ib53mw4h286c_modules_sops_secrets_for_users fill:#d2e5b2,color:#000000
    style n19izv0cp4qidc571j4anp4j1p4h2rdja_nixos fill:#e5b2d2,color:#000000
    style n19izv0cp4qidc571j4anp4j1p4h2rdja_nixos_common_nix fill:#e5b2d2,color:#000000
    style ngalnn1432m0gacr4200r533bzpvna88m_global_nix fill:#cce5b2,color:#000000
    style ngalnn1432m0gacr4200r533bzpvna88m_configurations_eltern fill:#cce5b2,color:#000000
    style ngalnn1432m0gacr4200r533bzpvna88m_modules_networkmanager_nix fill:#cce5b2,color:#000000
    style ngalnn1432m0gacr4200r533bzpvna88m_modules_avahi_nix fill:#cce5b2,color:#000000
    style ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos fill:#cce5b2,color:#000000
    style ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos_hardware_configuration_nix fill:#cce5b2,color:#000000
    style nwlhh48cg7zd9fp5159s1glchxcp7jh98_nixos_modules_installer_scan_not_detected_nix fill:#b2bde5,color:#000000
    style ngalnn1432m0gacr4200r533bzpvna88m_machines_eltern_asus_nixos_disk_configuration_nix fill:#cce5b2,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_flake_nix["`**flake.nix**

_s8apvqvrv3xhxb4vwisbcf0gd69klyvq_`"]
    nv3234wwv4c76zskyzb8l4zqmnclamp56_module_nix["`**module.nix**

_v3234wwv4c76zskyzb8l4zqmnclamp56_`"]
    nv3234wwv4c76zskyzb8l4zqmnclamp56_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_v3234wwv4c76zskyzb8l4zqmnclamp56_`"]
    nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops["`**modules/sops**

_rslgp7q28gk810gph5pzf8r5cb2xsa3v_`"]
    nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops_templates["`**modules/sops/templates**

_rslgp7q28gk810gph5pzf8r5cb2xsa3v_`"]
    nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_rslgp7q28gk810gph5pzf8r5cb2xsa3v_`"]
    nslq2p0gq2nxfnjzjpak8np4nlpcibsdj_nixos["`**nixos**

_slq2p0gq2nxfnjzjpak8np4nlpcibsdj_`"]
    nslq2p0gq2nxfnjzjpak8np4nlpcibsdj_nixos_common_nix["`**nixos/common.nix**

_slq2p0gq2nxfnjzjpak8np4nlpcibsdj_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_global_nix["`**global.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch["`**configurations/schokoladenelch**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_docker_nix["`**modules/docker.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_networkmanager_nix["`**modules/networkmanager.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_tmux_nix["`**modules/tmux.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_check_mkv["`**modules/scripts/check-mkv**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_create_zfs_dataset["`**modules/scripts/create-zfs-dataset**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_stacks_default_nix["`**modules/stacks/default.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_s8apvqvrv3xhxb4vwisbcf0gd69klyvq_`"]
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_7zkv8938a5lp9hslm6d04k8i3vrw09rw_`"]
    ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_flake_nix --> nv3234wwv4c76zskyzb8l4zqmnclamp56_module_nix
    ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_flake_nix --> nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops
    ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_flake_nix --> nslq2p0gq2nxfnjzjpak8np4nlpcibsdj_nixos
    ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_flake_nix --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_global_nix
    ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_flake_nix --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch
    ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_flake_nix --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos
    nv3234wwv4c76zskyzb8l4zqmnclamp56_module_nix --> nv3234wwv4c76zskyzb8l4zqmnclamp56_lib_make_disk_image_nix
    nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops --> nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops_templates
    nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops --> nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops_secrets_for_users
    nslq2p0gq2nxfnjzjpak8np4nlpcibsdj_nixos --> nslq2p0gq2nxfnjzjpak8np4nlpcibsdj_nixos_common_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_docker_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_networkmanager_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_tmux_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_check_mkv
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_create_zfs_dataset
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_zfs_manual_snapshot
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_zfs_snapshot_diff
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_boot_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_networking_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_services_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_persistence_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_stacks_default_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos --> n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_nixos_modules_installer_scan_not_detected_nix
    style ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_flake_nix fill:#e0b2e5,color:#000000
    style nv3234wwv4c76zskyzb8l4zqmnclamp56_module_nix fill:#b2c9e5,color:#000000
    style nv3234wwv4c76zskyzb8l4zqmnclamp56_lib_make_disk_image_nix fill:#b2c9e5,color:#000000
    style nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops fill:#b2c8e5,color:#000000
    style nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops_templates fill:#b2c8e5,color:#000000
    style nrslgp7q28gk810gph5pzf8r5cb2xsa3v_modules_sops_secrets_for_users fill:#b2c8e5,color:#000000
    style nslq2p0gq2nxfnjzjpak8np4nlpcibsdj_nixos fill:#e4b2e5,color:#000000
    style nslq2p0gq2nxfnjzjpak8np4nlpcibsdj_nixos_common_nix fill:#e4b2e5,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_global_nix fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_docker_nix fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_networkmanager_nix fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_tmux_nix fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_check_mkv fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_create_zfs_dataset fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_zfs_manual_snapshot fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_scripts_zfs_snapshot_diff fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_boot_nix fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_networking_nix fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_services_nix fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_configurations_schokoladenelch_persistence_nix fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_modules_stacks_default_nix fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos fill:#e5d2b2,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#e5d2b2,color:#000000
    style ns8apvqvrv3xhxb4vwisbcf0gd69klyvq_nixos_modules_installer_scan_not_detected_nix fill:#e0b2e5,color:#000000
    style n7zkv8938a5lp9hslm6d04k8i3vrw09rw_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#e5d2b2,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_flake_nix["`**flake.nix**

_2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_`"]
    n61i6svy8sl79v6mw4502h75idyc2498j_module_nix["`**module.nix**

_61i6svy8sl79v6mw4502h75idyc2498j_`"]
    n61i6svy8sl79v6mw4502h75idyc2498j_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_61i6svy8sl79v6mw4502h75idyc2498j_`"]
    n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops["`**modules/sops**

_4xbxz03d0a3kwg5cv07h166wn1srv7na_`"]
    n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops_templates["`**modules/sops/templates**

_4xbxz03d0a3kwg5cv07h166wn1srv7na_`"]
    n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_4xbxz03d0a3kwg5cv07h166wn1srv7na_`"]
    n0mzlwpjlhq3mczjxa5flib8sgb4pw3n1_nixos["`**nixos**

_0mzlwpjlhq3mczjxa5flib8sgb4pw3n1_`"]
    n0mzlwpjlhq3mczjxa5flib8sgb4pw3n1_nixos_common_nix["`**nixos/common.nix**

_0mzlwpjlhq3mczjxa5flib8sgb4pw3n1_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_global_nix["`**global.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico["`**configurations/nico**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_docker_nix["`**modules/docker.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_networkmanager_nix["`**modules/networkmanager.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_pipewire_nix["`**modules/pipewire.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_services_nix["`**configurations/nico/services.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_avahi_nix["`**modules/avahi.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_eden_nix["`**modules/eden.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_b305gzd974c5xldqdxzgl0y40vzl06f9_`"]
    n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_flake_nix --> n61i6svy8sl79v6mw4502h75idyc2498j_module_nix
    n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_flake_nix --> n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops
    n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_flake_nix --> n0mzlwpjlhq3mczjxa5flib8sgb4pw3n1_nixos
    n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_flake_nix --> nb305gzd974c5xldqdxzgl0y40vzl06f9_global_nix
    n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_flake_nix --> nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico
    n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_flake_nix --> nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos
    n61i6svy8sl79v6mw4502h75idyc2498j_module_nix --> n61i6svy8sl79v6mw4502h75idyc2498j_lib_make_disk_image_nix
    n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops --> n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops_templates
    n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops --> n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops_secrets_for_users
    n0mzlwpjlhq3mczjxa5flib8sgb4pw3n1_nixos --> n0mzlwpjlhq3mczjxa5flib8sgb4pw3n1_nixos_common_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico --> nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_docker_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico --> nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_networkmanager_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico --> nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_boot_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico --> nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_desktop_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico --> nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_audio_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico --> nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_virtualisation_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico --> nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_services_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico --> nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_packages_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico --> nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_rclone_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_audio_nix --> nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_pipewire_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_services_nix --> nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_avahi_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos --> nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos_hardware_configuration_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos --> nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos --> nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_eden_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos --> nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_xone_dongle_nix
    nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos_hardware_configuration_nix --> n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_nixos_modules_installer_scan_not_detected_nix
    style n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_flake_nix fill:#cbb2e5,color:#000000
    style n61i6svy8sl79v6mw4502h75idyc2498j_module_nix fill:#cdb2e5,color:#000000
    style n61i6svy8sl79v6mw4502h75idyc2498j_lib_make_disk_image_nix fill:#cdb2e5,color:#000000
    style n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops fill:#b2bae5,color:#000000
    style n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops_templates fill:#b2bae5,color:#000000
    style n4xbxz03d0a3kwg5cv07h166wn1srv7na_modules_sops_secrets_for_users fill:#b2bae5,color:#000000
    style n0mzlwpjlhq3mczjxa5flib8sgb4pw3n1_nixos fill:#e5b2b2,color:#000000
    style n0mzlwpjlhq3mczjxa5flib8sgb4pw3n1_nixos_common_nix fill:#e5b2b2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_global_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_docker_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_networkmanager_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_boot_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_desktop_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_audio_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_pipewire_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_virtualisation_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_services_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_avahi_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_packages_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_configurations_nico_rclone_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#e5bbb2,color:#000000
    style n2j43dl6cn6yy9dnbbrwxqbg5mq954lnf_nixos_modules_installer_scan_not_detected_nix fill:#cbb2e5,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_eden_nix fill:#e5bbb2,color:#000000
    style nb305gzd974c5xldqdxzgl0y40vzl06f9_modules_xone_dongle_nix fill:#e5bbb2,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_flake_nix["`**flake.nix**

_2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_`"]
    nxahgdbqw4qyvbf0kbpfg9jflsdjlpnyn_module_nix["`**module.nix**

_xahgdbqw4qyvbf0kbpfg9jflsdjlpnyn_`"]
    nxahgdbqw4qyvbf0kbpfg9jflsdjlpnyn_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_xahgdbqw4qyvbf0kbpfg9jflsdjlpnyn_`"]
    nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops["`**modules/sops**

_bhr85ik8sw9bbwig4i91ppxnraha8a03_`"]
    nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops_templates["`**modules/sops/templates**

_bhr85ik8sw9bbwig4i91ppxnraha8a03_`"]
    nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_bhr85ik8sw9bbwig4i91ppxnraha8a03_`"]
    nmig42sph0g9m8pm5xfn06m2qyamli83z_nixos["`**nixos**

_mig42sph0g9m8pm5xfn06m2qyamli83z_`"]
    nmig42sph0g9m8pm5xfn06m2qyamli83z_nixos_common_nix["`**nixos/common.nix**

_mig42sph0g9m8pm5xfn06m2qyamli83z_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_global_nix["`**global.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico["`**configurations/nico**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_docker_nix["`**modules/docker.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_networkmanager_nix["`**modules/networkmanager.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_pipewire_nix["`**modules/pipewire.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_services_nix["`**configurations/nico/services.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_avahi_nix["`**modules/avahi.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_hzm1dw4g0d3yz2wkxnrkqrn1az3k3740_`"]
    n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_flake_nix --> nxahgdbqw4qyvbf0kbpfg9jflsdjlpnyn_module_nix
    n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_flake_nix --> nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops
    n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_flake_nix --> nmig42sph0g9m8pm5xfn06m2qyamli83z_nixos
    n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_flake_nix --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_global_nix
    n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_flake_nix --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico
    n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_flake_nix --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos
    nxahgdbqw4qyvbf0kbpfg9jflsdjlpnyn_module_nix --> nxahgdbqw4qyvbf0kbpfg9jflsdjlpnyn_lib_make_disk_image_nix
    nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops --> nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops_templates
    nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops --> nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops_secrets_for_users
    nmig42sph0g9m8pm5xfn06m2qyamli83z_nixos --> nmig42sph0g9m8pm5xfn06m2qyamli83z_nixos_common_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_docker_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_networkmanager_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_boot_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_desktop_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_audio_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_virtualisation_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_services_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_packages_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_rclone_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_audio_nix --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_pipewire_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_services_nix --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_avahi_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_hardware_configuration_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos --> nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_mobile_network_nix
    nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_hardware_configuration_nix --> n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_nixos_modules_installer_scan_not_detected_nix
    style n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_flake_nix fill:#b2e5da,color:#000000
    style nxahgdbqw4qyvbf0kbpfg9jflsdjlpnyn_module_nix fill:#e5dfb2,color:#000000
    style nxahgdbqw4qyvbf0kbpfg9jflsdjlpnyn_lib_make_disk_image_nix fill:#e5dfb2,color:#000000
    style nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops fill:#b2d4e5,color:#000000
    style nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops_templates fill:#b2d4e5,color:#000000
    style nbhr85ik8sw9bbwig4i91ppxnraha8a03_modules_sops_secrets_for_users fill:#b2d4e5,color:#000000
    style nmig42sph0g9m8pm5xfn06m2qyamli83z_nixos fill:#bab2e5,color:#000000
    style nmig42sph0g9m8pm5xfn06m2qyamli83z_nixos_common_nix fill:#bab2e5,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_global_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_docker_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_networkmanager_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_boot_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_desktop_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_audio_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_pipewire_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_virtualisation_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_services_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_modules_avahi_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_packages_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_configurations_nico_rclone_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#e5dbb2,color:#000000
    style n2vmmlc6ixhkpib1wh8ahz8fnj4i3iaw6_nixos_modules_installer_scan_not_detected_nix fill:#b2e5da,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#e5dbb2,color:#000000
    style nhzm1dw4g0d3yz2wkxnrkqrn1az3k3740_machines_nico_thinkpad_nixos_mobile_network_nix fill:#e5dbb2,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    n900b6m7p2f7zfqnlmdvxc0vgwlmrsk25_flake_nix["`**flake.nix**

_900b6m7p2f7zfqnlmdvxc0vgwlmrsk25_`"]
    n4ji2k4nav843f2slp1qczwvxpfkk3fcp_module_nix["`**module.nix**

_4ji2k4nav843f2slp1qczwvxpfkk3fcp_`"]
    n4ji2k4nav843f2slp1qczwvxpfkk3fcp_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_4ji2k4nav843f2slp1qczwvxpfkk3fcp_`"]
    n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops["`**modules/sops**

_10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_`"]
    n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops_templates["`**modules/sops/templates**

_10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_`"]
    n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_`"]
    nfrj1q1csbx11f4ck6j5plbf9ihvjc9b6_nixos["`**nixos**

_frj1q1csbx11f4ck6j5plbf9ihvjc9b6_`"]
    nfrj1q1csbx11f4ck6j5plbf9ihvjc9b6_nixos_common_nix["`**nixos/common.nix**

_frj1q1csbx11f4ck6j5plbf9ihvjc9b6_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_global_nix["`**global.nix**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_configurations_nixos["`**configurations/nixos**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_modules_docker_nix["`**modules/docker.nix**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_modules_headlamp_nix["`**modules/headlamp.nix**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_modules_tmux_nix["`**modules/tmux.nix**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_ab6ln8g2kfc416k750b55gjf1v979bhz_`"]
    n900b6m7p2f7zfqnlmdvxc0vgwlmrsk25_flake_nix --> n4ji2k4nav843f2slp1qczwvxpfkk3fcp_module_nix
    n900b6m7p2f7zfqnlmdvxc0vgwlmrsk25_flake_nix --> n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops
    n900b6m7p2f7zfqnlmdvxc0vgwlmrsk25_flake_nix --> nfrj1q1csbx11f4ck6j5plbf9ihvjc9b6_nixos
    n900b6m7p2f7zfqnlmdvxc0vgwlmrsk25_flake_nix --> nab6ln8g2kfc416k750b55gjf1v979bhz_global_nix
    n900b6m7p2f7zfqnlmdvxc0vgwlmrsk25_flake_nix --> nab6ln8g2kfc416k750b55gjf1v979bhz_configurations_nixos
    n900b6m7p2f7zfqnlmdvxc0vgwlmrsk25_flake_nix --> nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos
    n4ji2k4nav843f2slp1qczwvxpfkk3fcp_module_nix --> n4ji2k4nav843f2slp1qczwvxpfkk3fcp_lib_make_disk_image_nix
    n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops --> n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops_templates
    n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops --> n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops_secrets_for_users
    nfrj1q1csbx11f4ck6j5plbf9ihvjc9b6_nixos --> nfrj1q1csbx11f4ck6j5plbf9ihvjc9b6_nixos_common_nix
    nab6ln8g2kfc416k750b55gjf1v979bhz_configurations_nixos --> nab6ln8g2kfc416k750b55gjf1v979bhz_modules_docker_nix
    nab6ln8g2kfc416k750b55gjf1v979bhz_configurations_nixos --> nab6ln8g2kfc416k750b55gjf1v979bhz_modules_headlamp_nix
    nab6ln8g2kfc416k750b55gjf1v979bhz_configurations_nixos --> nab6ln8g2kfc416k750b55gjf1v979bhz_modules_tmux_nix
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos --> nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos --> nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_disk_configuration_nix
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos --> nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_boot_nix
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos --> nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_desktop_nix
    nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos --> nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_persistence_nix
    style n900b6m7p2f7zfqnlmdvxc0vgwlmrsk25_flake_nix fill:#e5b9b2,color:#000000
    style n4ji2k4nav843f2slp1qczwvxpfkk3fcp_module_nix fill:#b2e5c0,color:#000000
    style n4ji2k4nav843f2slp1qczwvxpfkk3fcp_lib_make_disk_image_nix fill:#b2e5c0,color:#000000
    style n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops fill:#b2d5e5,color:#000000
    style n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops_templates fill:#b2d5e5,color:#000000
    style n10kiz1jh8yk3k698z6xdbnpxrc2ddlcz_modules_sops_secrets_for_users fill:#b2d5e5,color:#000000
    style nfrj1q1csbx11f4ck6j5plbf9ihvjc9b6_nixos fill:#cfb2e5,color:#000000
    style nfrj1q1csbx11f4ck6j5plbf9ihvjc9b6_nixos_common_nix fill:#cfb2e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_global_nix fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_configurations_nixos fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_modules_docker_nix fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_modules_headlamp_nix fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_modules_tmux_nix fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_boot_nix fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_desktop_nix fill:#b2e1e5,color:#000000
    style nab6ln8g2kfc416k750b55gjf1v979bhz_machines_nixos_virtualbox_nixos_persistence_nix fill:#b2e1e5,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    nfh1pnvrfshjyn5r7n91477r3vk2zss3f_flake_nix["`**flake.nix**

_fh1pnvrfshjyn5r7n91477r3vk2zss3f_`"]
    nlccd546vqn9mnfh24xkmic86gpn3vaj0_module_nix["`**module.nix**

_lccd546vqn9mnfh24xkmic86gpn3vaj0_`"]
    nlccd546vqn9mnfh24xkmic86gpn3vaj0_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_lccd546vqn9mnfh24xkmic86gpn3vaj0_`"]
    n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops["`**modules/sops**

_5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_`"]
    n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops_templates["`**modules/sops/templates**

_5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_`"]
    n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_`"]
    nigwgq72vyshzgdq0wpapjp4cgfnnw08h_nixos["`**nixos**

_igwgq72vyshzgdq0wpapjp4cgfnnw08h_`"]
    nigwgq72vyshzgdq0wpapjp4cgfnnw08h_nixos_common_nix["`**nixos/common.nix**

_igwgq72vyshzgdq0wpapjp4cgfnnw08h_`"]
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_global_nix["`**global.nix**

_lmw1c4nx1jxd18v8yxya7cznqa3j89jl_`"]
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_configurations_nixos["`**configurations/nixos**

_lmw1c4nx1jxd18v8yxya7cznqa3j89jl_`"]
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_modules_docker_nix["`**modules/docker.nix**

_lmw1c4nx1jxd18v8yxya7cznqa3j89jl_`"]
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_modules_headlamp_nix["`**modules/headlamp.nix**

_lmw1c4nx1jxd18v8yxya7cznqa3j89jl_`"]
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_modules_tmux_nix["`**modules/tmux.nix**

_lmw1c4nx1jxd18v8yxya7cznqa3j89jl_`"]
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_lmw1c4nx1jxd18v8yxya7cznqa3j89jl_`"]
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_lmw1c4nx1jxd18v8yxya7cznqa3j89jl_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules["`**modules**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_build_tarball_nix["`**modules/build-tarball.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_interop_nix["`**modules/interop.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_recovery_nix["`**modules/recovery.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd["`**modules/systemd**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd_native["`**modules/systemd/native**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_usbip_nix["`**modules/usbip.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_version_nix["`**modules/version.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_welcome_nix["`**modules/welcome.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_7y7qdwhhq4mf94kavrkgh0rj4y30q646_`"]
    nfh1pnvrfshjyn5r7n91477r3vk2zss3f_flake_nix --> nlccd546vqn9mnfh24xkmic86gpn3vaj0_module_nix
    nfh1pnvrfshjyn5r7n91477r3vk2zss3f_flake_nix --> n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops
    nfh1pnvrfshjyn5r7n91477r3vk2zss3f_flake_nix --> nigwgq72vyshzgdq0wpapjp4cgfnnw08h_nixos
    nfh1pnvrfshjyn5r7n91477r3vk2zss3f_flake_nix --> nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_global_nix
    nfh1pnvrfshjyn5r7n91477r3vk2zss3f_flake_nix --> nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_configurations_nixos
    nfh1pnvrfshjyn5r7n91477r3vk2zss3f_flake_nix --> nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_machines_nixos_wsl_nixos
    nlccd546vqn9mnfh24xkmic86gpn3vaj0_module_nix --> nlccd546vqn9mnfh24xkmic86gpn3vaj0_lib_make_disk_image_nix
    n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops --> n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops_templates
    n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops --> n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops_secrets_for_users
    nigwgq72vyshzgdq0wpapjp4cgfnnw08h_nixos --> nigwgq72vyshzgdq0wpapjp4cgfnnw08h_nixos_common_nix
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_configurations_nixos --> nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_modules_docker_nix
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_configurations_nixos --> nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_modules_headlamp_nix
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_configurations_nixos --> nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_modules_tmux_nix
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_machines_nixos_wsl_nixos --> nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_machines_nixos_wsl_nixos_hardware_configuration_nix
    nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_machines_nixos_wsl_nixos --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_build_tarball_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_docker_desktop_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_interop_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_recovery_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_ssh_agent_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_usbip_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_version_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_welcome_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_wsl_conf_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_wsl_distro_nix
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd_native
    n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd_native --> n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd_native_wrap_shell_nix
    style nfh1pnvrfshjyn5r7n91477r3vk2zss3f_flake_nix fill:#bfe5b2,color:#000000
    style nlccd546vqn9mnfh24xkmic86gpn3vaj0_module_nix fill:#b2cfe5,color:#000000
    style nlccd546vqn9mnfh24xkmic86gpn3vaj0_lib_make_disk_image_nix fill:#b2cfe5,color:#000000
    style n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops fill:#e5beb2,color:#000000
    style n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops_templates fill:#e5beb2,color:#000000
    style n5jy5zhv7gdvnqq8y8xcfr3y4gvq0w95x_modules_sops_secrets_for_users fill:#e5beb2,color:#000000
    style nigwgq72vyshzgdq0wpapjp4cgfnnw08h_nixos fill:#b2e5c0,color:#000000
    style nigwgq72vyshzgdq0wpapjp4cgfnnw08h_nixos_common_nix fill:#b2e5c0,color:#000000
    style nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_global_nix fill:#b2bbe5,color:#000000
    style nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_configurations_nixos fill:#b2bbe5,color:#000000
    style nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_modules_docker_nix fill:#b2bbe5,color:#000000
    style nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_modules_headlamp_nix fill:#b2bbe5,color:#000000
    style nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_modules_tmux_nix fill:#b2bbe5,color:#000000
    style nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_machines_nixos_wsl_nixos fill:#b2bbe5,color:#000000
    style nlmw1c4nx1jxd18v8yxya7cznqa3j89jl_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#b2bbe5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_build_tarball_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_docker_desktop_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_interop_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_recovery_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_ssh_agent_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd_native fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_systemd_native_wrap_shell_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_usbip_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_version_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_welcome_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_wsl_conf_nix fill:#b2b8e5,color:#000000
    style n7y7qdwhhq4mf94kavrkgh0rj4y30q646_modules_wsl_distro_nix fill:#b2b8e5,color:#000000
```
