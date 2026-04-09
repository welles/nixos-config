# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_flake_nix["`**flake.nix**

_kzrn2fn9gr7a01dpkmb1q1hf6p873dhv_`"]
    n92khfl1f8br5j8s3cq9ps6fc83a1fs4b_module_nix["`**module.nix**

_92khfl1f8br5j8s3cq9ps6fc83a1fs4b_`"]
    n92khfl1f8br5j8s3cq9ps6fc83a1fs4b_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_92khfl1f8br5j8s3cq9ps6fc83a1fs4b_`"]
    nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops["`**modules/sops**

_xyz82si29qb4k3dzw2dzqwfvrfqlsvzc_`"]
    nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops_templates["`**modules/sops/templates**

_xyz82si29qb4k3dzw2dzqwfvrfqlsvzc_`"]
    nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_xyz82si29qb4k3dzw2dzqwfvrfqlsvzc_`"]
    nbaxmfj0rr557z369lflxqy4fbyxzmaf7_nixos["`**nixos**

_baxmfj0rr557z369lflxqy4fbyxzmaf7_`"]
    nbaxmfj0rr557z369lflxqy4fbyxzmaf7_nixos_common_nix["`**nixos/common.nix**

_baxmfj0rr557z369lflxqy4fbyxzmaf7_`"]
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_global_nix["`**global.nix**

_w572m4dwbnxl124xw8l1ax08x3lbimhx_`"]
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_configurations_eltern["`**configurations/eltern**

_w572m4dwbnxl124xw8l1ax08x3lbimhx_`"]
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_modules_networkmanager_nix["`**modules/networkmanager.nix**

_w572m4dwbnxl124xw8l1ax08x3lbimhx_`"]
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_modules_avahi_nix["`**modules/avahi.nix**

_w572m4dwbnxl124xw8l1ax08x3lbimhx_`"]
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_w572m4dwbnxl124xw8l1ax08x3lbimhx_`"]
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_w572m4dwbnxl124xw8l1ax08x3lbimhx_`"]
    nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_kzrn2fn9gr7a01dpkmb1q1hf6p873dhv_`"]
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_w572m4dwbnxl124xw8l1ax08x3lbimhx_`"]
    nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_flake_nix --> n92khfl1f8br5j8s3cq9ps6fc83a1fs4b_module_nix
    nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_flake_nix --> nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops
    nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_flake_nix --> nbaxmfj0rr557z369lflxqy4fbyxzmaf7_nixos
    nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_flake_nix --> nw572m4dwbnxl124xw8l1ax08x3lbimhx_global_nix
    nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_flake_nix --> nw572m4dwbnxl124xw8l1ax08x3lbimhx_configurations_eltern
    nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_flake_nix --> nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos
    n92khfl1f8br5j8s3cq9ps6fc83a1fs4b_module_nix --> n92khfl1f8br5j8s3cq9ps6fc83a1fs4b_lib_make_disk_image_nix
    nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops --> nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops_templates
    nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops --> nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops_secrets_for_users
    nbaxmfj0rr557z369lflxqy4fbyxzmaf7_nixos --> nbaxmfj0rr557z369lflxqy4fbyxzmaf7_nixos_common_nix
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_configurations_eltern --> nw572m4dwbnxl124xw8l1ax08x3lbimhx_modules_networkmanager_nix
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_configurations_eltern --> nw572m4dwbnxl124xw8l1ax08x3lbimhx_modules_avahi_nix
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos --> nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos_hardware_configuration_nix
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos --> nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos_disk_configuration_nix
    nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos_hardware_configuration_nix --> nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_nixos_modules_installer_scan_not_detected_nix
    style nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_flake_nix fill:#b2c0e5,color:#000000
    style n92khfl1f8br5j8s3cq9ps6fc83a1fs4b_module_nix fill:#c8e5b2,color:#000000
    style n92khfl1f8br5j8s3cq9ps6fc83a1fs4b_lib_make_disk_image_nix fill:#c8e5b2,color:#000000
    style nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops fill:#b2d7e5,color:#000000
    style nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops_templates fill:#b2d7e5,color:#000000
    style nxyz82si29qb4k3dzw2dzqwfvrfqlsvzc_modules_sops_secrets_for_users fill:#b2d7e5,color:#000000
    style nbaxmfj0rr557z369lflxqy4fbyxzmaf7_nixos fill:#e5b2d0,color:#000000
    style nbaxmfj0rr557z369lflxqy4fbyxzmaf7_nixos_common_nix fill:#e5b2d0,color:#000000
    style nw572m4dwbnxl124xw8l1ax08x3lbimhx_global_nix fill:#b6b2e5,color:#000000
    style nw572m4dwbnxl124xw8l1ax08x3lbimhx_configurations_eltern fill:#b6b2e5,color:#000000
    style nw572m4dwbnxl124xw8l1ax08x3lbimhx_modules_networkmanager_nix fill:#b6b2e5,color:#000000
    style nw572m4dwbnxl124xw8l1ax08x3lbimhx_modules_avahi_nix fill:#b6b2e5,color:#000000
    style nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos fill:#b6b2e5,color:#000000
    style nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos_hardware_configuration_nix fill:#b6b2e5,color:#000000
    style nkzrn2fn9gr7a01dpkmb1q1hf6p873dhv_nixos_modules_installer_scan_not_detected_nix fill:#b2c0e5,color:#000000
    style nw572m4dwbnxl124xw8l1ax08x3lbimhx_machines_eltern_asus_nixos_disk_configuration_nix fill:#b6b2e5,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    np189mi82jj894s72z64q88037q2fw3cp_flake_nix["`**flake.nix**

_p189mi82jj894s72z64q88037q2fw3cp_`"]
    na4di17lc0zs0855lsjy9rz6vryx2lvs1_module_nix["`**module.nix**

_a4di17lc0zs0855lsjy9rz6vryx2lvs1_`"]
    na4di17lc0zs0855lsjy9rz6vryx2lvs1_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_a4di17lc0zs0855lsjy9rz6vryx2lvs1_`"]
    nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops["`**modules/sops**

_q78zg64hysfqk0w09s04hdzdna3hnwxv_`"]
    nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops_templates["`**modules/sops/templates**

_q78zg64hysfqk0w09s04hdzdna3hnwxv_`"]
    nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_q78zg64hysfqk0w09s04hdzdna3hnwxv_`"]
    n0c6ibkyxc7w9ish94y3al6g633c6siwa_nixos["`**nixos**

_0c6ibkyxc7w9ish94y3al6g633c6siwa_`"]
    n0c6ibkyxc7w9ish94y3al6g633c6siwa_nixos_common_nix["`**nixos/common.nix**

_0c6ibkyxc7w9ish94y3al6g633c6siwa_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_global_nix["`**global.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch["`**configurations/schokoladenelch**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_docker_nix["`**modules/docker.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_networkmanager_nix["`**modules/networkmanager.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_tmux_nix["`**modules/tmux.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_stacks_default_nix["`**modules/stacks/default.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    np189mi82jj894s72z64q88037q2fw3cp_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_p189mi82jj894s72z64q88037q2fw3cp_`"]
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_hd6cj9mhhisxy5qyp4vfnibszs8jncg3_`"]
    np189mi82jj894s72z64q88037q2fw3cp_flake_nix --> na4di17lc0zs0855lsjy9rz6vryx2lvs1_module_nix
    np189mi82jj894s72z64q88037q2fw3cp_flake_nix --> nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops
    np189mi82jj894s72z64q88037q2fw3cp_flake_nix --> n0c6ibkyxc7w9ish94y3al6g633c6siwa_nixos
    np189mi82jj894s72z64q88037q2fw3cp_flake_nix --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_global_nix
    np189mi82jj894s72z64q88037q2fw3cp_flake_nix --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch
    np189mi82jj894s72z64q88037q2fw3cp_flake_nix --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos
    na4di17lc0zs0855lsjy9rz6vryx2lvs1_module_nix --> na4di17lc0zs0855lsjy9rz6vryx2lvs1_lib_make_disk_image_nix
    nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops --> nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops_templates
    nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops --> nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops_secrets_for_users
    n0c6ibkyxc7w9ish94y3al6g633c6siwa_nixos --> n0c6ibkyxc7w9ish94y3al6g633c6siwa_nixos_common_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_docker_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_networkmanager_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_tmux_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_scripts_zfs_manual_snapshot
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_scripts_zfs_snapshot_diff
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_boot_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_networking_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_services_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_persistence_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_stacks_default_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos --> nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> np189mi82jj894s72z64q88037q2fw3cp_nixos_modules_installer_scan_not_detected_nix
    style np189mi82jj894s72z64q88037q2fw3cp_flake_nix fill:#e5c7b2,color:#000000
    style na4di17lc0zs0855lsjy9rz6vryx2lvs1_module_nix fill:#c7b2e5,color:#000000
    style na4di17lc0zs0855lsjy9rz6vryx2lvs1_lib_make_disk_image_nix fill:#c7b2e5,color:#000000
    style nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops fill:#e5bbb2,color:#000000
    style nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops_templates fill:#e5bbb2,color:#000000
    style nq78zg64hysfqk0w09s04hdzdna3hnwxv_modules_sops_secrets_for_users fill:#e5bbb2,color:#000000
    style n0c6ibkyxc7w9ish94y3al6g633c6siwa_nixos fill:#b2e5b2,color:#000000
    style n0c6ibkyxc7w9ish94y3al6g633c6siwa_nixos_common_nix fill:#b2e5b2,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_global_nix fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_docker_nix fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_networkmanager_nix fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_tmux_nix fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_scripts_zfs_manual_snapshot fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_scripts_zfs_snapshot_diff fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_boot_nix fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_networking_nix fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_services_nix fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_configurations_schokoladenelch_persistence_nix fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_modules_stacks_default_nix fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos fill:#b2e5b9,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#b2e5b9,color:#000000
    style np189mi82jj894s72z64q88037q2fw3cp_nixos_modules_installer_scan_not_detected_nix fill:#e5c7b2,color:#000000
    style nhd6cj9mhhisxy5qyp4vfnibszs8jncg3_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#b2e5b9,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_flake_nix["`**flake.nix**

_dcb10jvbzsmnvn3vspvb0bi34hnc04bs_`"]
    n92qjy5fh107h7fr88iiam8jc79x4lcjy_module_nix["`**module.nix**

_92qjy5fh107h7fr88iiam8jc79x4lcjy_`"]
    n92qjy5fh107h7fr88iiam8jc79x4lcjy_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_92qjy5fh107h7fr88iiam8jc79x4lcjy_`"]
    n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops["`**modules/sops**

_3530jfj4dhlnc4g0lp5b149nmm9zq6f3_`"]
    n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops_templates["`**modules/sops/templates**

_3530jfj4dhlnc4g0lp5b149nmm9zq6f3_`"]
    n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_3530jfj4dhlnc4g0lp5b149nmm9zq6f3_`"]
    nqgbq0ai8vjypzhlw1pmqk0al8wskwbh7_nixos["`**nixos**

_qgbq0ai8vjypzhlw1pmqk0al8wskwbh7_`"]
    nqgbq0ai8vjypzhlw1pmqk0al8wskwbh7_nixos_common_nix["`**nixos/common.nix**

_qgbq0ai8vjypzhlw1pmqk0al8wskwbh7_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_global_nix["`**global.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico["`**configurations/nico**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_docker_nix["`**modules/docker.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_networkmanager_nix["`**modules/networkmanager.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_pipewire_nix["`**modules/pipewire.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_services_nix["`**configurations/nico/services.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_avahi_nix["`**modules/avahi.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_dcb10jvbzsmnvn3vspvb0bi34hnc04bs_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_eden_nix["`**modules/eden.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_nrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_`"]
    ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_flake_nix --> n92qjy5fh107h7fr88iiam8jc79x4lcjy_module_nix
    ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_flake_nix --> n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops
    ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_flake_nix --> nqgbq0ai8vjypzhlw1pmqk0al8wskwbh7_nixos
    ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_flake_nix --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_global_nix
    ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_flake_nix --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico
    ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_flake_nix --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos
    n92qjy5fh107h7fr88iiam8jc79x4lcjy_module_nix --> n92qjy5fh107h7fr88iiam8jc79x4lcjy_lib_make_disk_image_nix
    n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops --> n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops_templates
    n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops --> n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops_secrets_for_users
    nqgbq0ai8vjypzhlw1pmqk0al8wskwbh7_nixos --> nqgbq0ai8vjypzhlw1pmqk0al8wskwbh7_nixos_common_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_docker_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_networkmanager_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_boot_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_desktop_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_audio_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_virtualisation_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_services_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_packages_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_rclone_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_audio_nix --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_pipewire_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_services_nix --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_avahi_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos_hardware_configuration_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_eden_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos --> nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_xone_dongle_nix
    nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos_hardware_configuration_nix --> ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_nixos_modules_installer_scan_not_detected_nix
    style ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_flake_nix fill:#b2e5bb,color:#000000
    style n92qjy5fh107h7fr88iiam8jc79x4lcjy_module_nix fill:#bbb2e5,color:#000000
    style n92qjy5fh107h7fr88iiam8jc79x4lcjy_lib_make_disk_image_nix fill:#bbb2e5,color:#000000
    style n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops fill:#b2e5e1,color:#000000
    style n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops_templates fill:#b2e5e1,color:#000000
    style n3530jfj4dhlnc4g0lp5b149nmm9zq6f3_modules_sops_secrets_for_users fill:#b2e5e1,color:#000000
    style nqgbq0ai8vjypzhlw1pmqk0al8wskwbh7_nixos fill:#b2e5e2,color:#000000
    style nqgbq0ai8vjypzhlw1pmqk0al8wskwbh7_nixos_common_nix fill:#b2e5e2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_global_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_docker_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_networkmanager_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_boot_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_desktop_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_audio_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_pipewire_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_virtualisation_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_services_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_avahi_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_packages_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_configurations_nico_rclone_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#e5b2d2,color:#000000
    style ndcb10jvbzsmnvn3vspvb0bi34hnc04bs_nixos_modules_installer_scan_not_detected_nix fill:#b2e5bb,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_eden_nix fill:#e5b2d2,color:#000000
    style nnrqsa8rm0j7z50zfzpmhdwnj7bg0rnlq_modules_xone_dongle_nix fill:#e5b2d2,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    n20n8xy01l3clfpw47j69fcr8xmdp89r7_flake_nix["`**flake.nix**

_20n8xy01l3clfpw47j69fcr8xmdp89r7_`"]
    ngkcnixlsspjyc321q0208fxfikv95n1f_module_nix["`**module.nix**

_gkcnixlsspjyc321q0208fxfikv95n1f_`"]
    ngkcnixlsspjyc321q0208fxfikv95n1f_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_gkcnixlsspjyc321q0208fxfikv95n1f_`"]
    nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops["`**modules/sops**

_fphhy37al1pf6qszrif4d9djpd924wrl_`"]
    nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops_templates["`**modules/sops/templates**

_fphhy37al1pf6qszrif4d9djpd924wrl_`"]
    nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_fphhy37al1pf6qszrif4d9djpd924wrl_`"]
    nw0xb71xmcqh37paq9bsmz2rnnghp4y02_nixos["`**nixos**

_w0xb71xmcqh37paq9bsmz2rnnghp4y02_`"]
    nw0xb71xmcqh37paq9bsmz2rnnghp4y02_nixos_common_nix["`**nixos/common.nix**

_w0xb71xmcqh37paq9bsmz2rnnghp4y02_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_global_nix["`**global.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico["`**configurations/nico**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_docker_nix["`**modules/docker.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_networkmanager_nix["`**modules/networkmanager.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_pipewire_nix["`**modules/pipewire.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_services_nix["`**configurations/nico/services.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_avahi_nix["`**modules/avahi.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    n20n8xy01l3clfpw47j69fcr8xmdp89r7_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_20n8xy01l3clfpw47j69fcr8xmdp89r7_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_g3cr0pnwbacg3khi0m8csk11d0ccq18h_`"]
    n20n8xy01l3clfpw47j69fcr8xmdp89r7_flake_nix --> ngkcnixlsspjyc321q0208fxfikv95n1f_module_nix
    n20n8xy01l3clfpw47j69fcr8xmdp89r7_flake_nix --> nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops
    n20n8xy01l3clfpw47j69fcr8xmdp89r7_flake_nix --> nw0xb71xmcqh37paq9bsmz2rnnghp4y02_nixos
    n20n8xy01l3clfpw47j69fcr8xmdp89r7_flake_nix --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_global_nix
    n20n8xy01l3clfpw47j69fcr8xmdp89r7_flake_nix --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico
    n20n8xy01l3clfpw47j69fcr8xmdp89r7_flake_nix --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos
    ngkcnixlsspjyc321q0208fxfikv95n1f_module_nix --> ngkcnixlsspjyc321q0208fxfikv95n1f_lib_make_disk_image_nix
    nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops --> nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops_templates
    nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops --> nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops_secrets_for_users
    nw0xb71xmcqh37paq9bsmz2rnnghp4y02_nixos --> nw0xb71xmcqh37paq9bsmz2rnnghp4y02_nixos_common_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_docker_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_networkmanager_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_boot_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_desktop_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_audio_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_virtualisation_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_services_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_packages_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_rclone_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_audio_nix --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_pipewire_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_services_nix --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_avahi_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_hardware_configuration_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos --> ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_mobile_network_nix
    ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_hardware_configuration_nix --> n20n8xy01l3clfpw47j69fcr8xmdp89r7_nixos_modules_installer_scan_not_detected_nix
    style n20n8xy01l3clfpw47j69fcr8xmdp89r7_flake_nix fill:#cee5b2,color:#000000
    style ngkcnixlsspjyc321q0208fxfikv95n1f_module_nix fill:#e5b5b2,color:#000000
    style ngkcnixlsspjyc321q0208fxfikv95n1f_lib_make_disk_image_nix fill:#e5b5b2,color:#000000
    style nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops fill:#b2e5b8,color:#000000
    style nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops_templates fill:#b2e5b8,color:#000000
    style nfphhy37al1pf6qszrif4d9djpd924wrl_modules_sops_secrets_for_users fill:#b2e5b8,color:#000000
    style nw0xb71xmcqh37paq9bsmz2rnnghp4y02_nixos fill:#b2c6e5,color:#000000
    style nw0xb71xmcqh37paq9bsmz2rnnghp4y02_nixos_common_nix fill:#b2c6e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_global_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_docker_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_networkmanager_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_boot_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_desktop_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_audio_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_pipewire_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_virtualisation_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_services_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_modules_avahi_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_packages_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_configurations_nico_rclone_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#b2c2e5,color:#000000
    style n20n8xy01l3clfpw47j69fcr8xmdp89r7_nixos_modules_installer_scan_not_detected_nix fill:#cee5b2,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#b2c2e5,color:#000000
    style ng3cr0pnwbacg3khi0m8csk11d0ccq18h_machines_nico_thinkpad_nixos_mobile_network_nix fill:#b2c2e5,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    nidjw7j583vp76gcvdrjy11py5xvkr6al_flake_nix["`**flake.nix**

_idjw7j583vp76gcvdrjy11py5xvkr6al_`"]
    nk6hcmcawa2dzcwydyp1qqh6h46c84138_module_nix["`**module.nix**

_k6hcmcawa2dzcwydyp1qqh6h46c84138_`"]
    nk6hcmcawa2dzcwydyp1qqh6h46c84138_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_k6hcmcawa2dzcwydyp1qqh6h46c84138_`"]
    ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops["`**modules/sops**

_gwqr1cvwjszv29v7ij2m8n22gcv8wf9n_`"]
    ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops_templates["`**modules/sops/templates**

_gwqr1cvwjszv29v7ij2m8n22gcv8wf9n_`"]
    ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_gwqr1cvwjszv29v7ij2m8n22gcv8wf9n_`"]
    n7l4zfi7x6d6ycnwz1kv4gj2mipr9q6p9_nixos["`**nixos**

_7l4zfi7x6d6ycnwz1kv4gj2mipr9q6p9_`"]
    n7l4zfi7x6d6ycnwz1kv4gj2mipr9q6p9_nixos_common_nix["`**nixos/common.nix**

_7l4zfi7x6d6ycnwz1kv4gj2mipr9q6p9_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_global_nix["`**global.nix**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_configurations_nixos["`**configurations/nixos**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_modules_docker_nix["`**modules/docker.nix**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_modules_headlamp_nix["`**modules/headlamp.nix**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_modules_tmux_nix["`**modules/tmux.nix**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_1b0bfabnx73x7q8k0d47l21issmhgc76_`"]
    nidjw7j583vp76gcvdrjy11py5xvkr6al_flake_nix --> nk6hcmcawa2dzcwydyp1qqh6h46c84138_module_nix
    nidjw7j583vp76gcvdrjy11py5xvkr6al_flake_nix --> ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops
    nidjw7j583vp76gcvdrjy11py5xvkr6al_flake_nix --> n7l4zfi7x6d6ycnwz1kv4gj2mipr9q6p9_nixos
    nidjw7j583vp76gcvdrjy11py5xvkr6al_flake_nix --> n1b0bfabnx73x7q8k0d47l21issmhgc76_global_nix
    nidjw7j583vp76gcvdrjy11py5xvkr6al_flake_nix --> n1b0bfabnx73x7q8k0d47l21issmhgc76_configurations_nixos
    nidjw7j583vp76gcvdrjy11py5xvkr6al_flake_nix --> n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos
    nk6hcmcawa2dzcwydyp1qqh6h46c84138_module_nix --> nk6hcmcawa2dzcwydyp1qqh6h46c84138_lib_make_disk_image_nix
    ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops --> ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops_templates
    ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops --> ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops_secrets_for_users
    n7l4zfi7x6d6ycnwz1kv4gj2mipr9q6p9_nixos --> n7l4zfi7x6d6ycnwz1kv4gj2mipr9q6p9_nixos_common_nix
    n1b0bfabnx73x7q8k0d47l21issmhgc76_configurations_nixos --> n1b0bfabnx73x7q8k0d47l21issmhgc76_modules_docker_nix
    n1b0bfabnx73x7q8k0d47l21issmhgc76_configurations_nixos --> n1b0bfabnx73x7q8k0d47l21issmhgc76_modules_headlamp_nix
    n1b0bfabnx73x7q8k0d47l21issmhgc76_configurations_nixos --> n1b0bfabnx73x7q8k0d47l21issmhgc76_modules_tmux_nix
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos --> n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos --> n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_disk_configuration_nix
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos --> n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_boot_nix
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos --> n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_desktop_nix
    n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos --> n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_persistence_nix
    style nidjw7j583vp76gcvdrjy11py5xvkr6al_flake_nix fill:#e5c1b2,color:#000000
    style nk6hcmcawa2dzcwydyp1qqh6h46c84138_module_nix fill:#b2d6e5,color:#000000
    style nk6hcmcawa2dzcwydyp1qqh6h46c84138_lib_make_disk_image_nix fill:#b2d6e5,color:#000000
    style ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops fill:#e5b2ce,color:#000000
    style ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops_templates fill:#e5b2ce,color:#000000
    style ngwqr1cvwjszv29v7ij2m8n22gcv8wf9n_modules_sops_secrets_for_users fill:#e5b2ce,color:#000000
    style n7l4zfi7x6d6ycnwz1kv4gj2mipr9q6p9_nixos fill:#b2dce5,color:#000000
    style n7l4zfi7x6d6ycnwz1kv4gj2mipr9q6p9_nixos_common_nix fill:#b2dce5,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_global_nix fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_configurations_nixos fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_modules_docker_nix fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_modules_headlamp_nix fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_modules_tmux_nix fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_boot_nix fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_desktop_nix fill:#b2e5cb,color:#000000
    style n1b0bfabnx73x7q8k0d47l21issmhgc76_machines_nixos_virtualbox_nixos_persistence_nix fill:#b2e5cb,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    nf6bppid3klq78a19zrkfacp492fhrnwa_flake_nix["`**flake.nix**

_f6bppid3klq78a19zrkfacp492fhrnwa_`"]
    n8cyyjfvx8xfrjnx7a2cib2kjcvs4xicg_module_nix["`**module.nix**

_8cyyjfvx8xfrjnx7a2cib2kjcvs4xicg_`"]
    n8cyyjfvx8xfrjnx7a2cib2kjcvs4xicg_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_8cyyjfvx8xfrjnx7a2cib2kjcvs4xicg_`"]
    ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops["`**modules/sops**

_dshq7nnyx0ka97fcfyla8hhzbc5hal4s_`"]
    ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops_templates["`**modules/sops/templates**

_dshq7nnyx0ka97fcfyla8hhzbc5hal4s_`"]
    ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_dshq7nnyx0ka97fcfyla8hhzbc5hal4s_`"]
    nds2cz4n9ayp597y3n9brib2jr2qfry7m_nixos["`**nixos**

_ds2cz4n9ayp597y3n9brib2jr2qfry7m_`"]
    nds2cz4n9ayp597y3n9brib2jr2qfry7m_nixos_common_nix["`**nixos/common.nix**

_ds2cz4n9ayp597y3n9brib2jr2qfry7m_`"]
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_global_nix["`**global.nix**

_n2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_`"]
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_configurations_nixos["`**configurations/nixos**

_n2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_`"]
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_modules_docker_nix["`**modules/docker.nix**

_n2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_`"]
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_modules_headlamp_nix["`**modules/headlamp.nix**

_n2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_`"]
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_modules_tmux_nix["`**modules/tmux.nix**

_n2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_`"]
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_n2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_`"]
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_n2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules["`**modules**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_build_tarball_nix["`**modules/build-tarball.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_interop_nix["`**modules/interop.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_recovery_nix["`**modules/recovery.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd["`**modules/systemd**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd_native["`**modules/systemd/native**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_usbip_nix["`**modules/usbip.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_version_nix["`**modules/version.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_welcome_nix["`**modules/welcome.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_j17c9chfia7c9zchkvkms6cqmhkhwcrj_`"]
    nf6bppid3klq78a19zrkfacp492fhrnwa_flake_nix --> n8cyyjfvx8xfrjnx7a2cib2kjcvs4xicg_module_nix
    nf6bppid3klq78a19zrkfacp492fhrnwa_flake_nix --> ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops
    nf6bppid3klq78a19zrkfacp492fhrnwa_flake_nix --> nds2cz4n9ayp597y3n9brib2jr2qfry7m_nixos
    nf6bppid3klq78a19zrkfacp492fhrnwa_flake_nix --> nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_global_nix
    nf6bppid3klq78a19zrkfacp492fhrnwa_flake_nix --> nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_configurations_nixos
    nf6bppid3klq78a19zrkfacp492fhrnwa_flake_nix --> nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_machines_nixos_wsl_nixos
    n8cyyjfvx8xfrjnx7a2cib2kjcvs4xicg_module_nix --> n8cyyjfvx8xfrjnx7a2cib2kjcvs4xicg_lib_make_disk_image_nix
    ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops --> ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops_templates
    ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops --> ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops_secrets_for_users
    nds2cz4n9ayp597y3n9brib2jr2qfry7m_nixos --> nds2cz4n9ayp597y3n9brib2jr2qfry7m_nixos_common_nix
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_configurations_nixos --> nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_modules_docker_nix
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_configurations_nixos --> nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_modules_headlamp_nix
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_configurations_nixos --> nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_modules_tmux_nix
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_machines_nixos_wsl_nixos --> nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_machines_nixos_wsl_nixos_hardware_configuration_nix
    nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_machines_nixos_wsl_nixos --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_build_tarball_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_docker_desktop_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_interop_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_recovery_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_ssh_agent_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_usbip_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_version_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_welcome_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_wsl_conf_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_wsl_distro_nix
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd_native
    nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd_native --> nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd_native_wrap_shell_nix
    style nf6bppid3klq78a19zrkfacp492fhrnwa_flake_nix fill:#b2e5c0,color:#000000
    style n8cyyjfvx8xfrjnx7a2cib2kjcvs4xicg_module_nix fill:#e5d7b2,color:#000000
    style n8cyyjfvx8xfrjnx7a2cib2kjcvs4xicg_lib_make_disk_image_nix fill:#e5d7b2,color:#000000
    style ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops fill:#b2b5e5,color:#000000
    style ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops_templates fill:#b2b5e5,color:#000000
    style ndshq7nnyx0ka97fcfyla8hhzbc5hal4s_modules_sops_secrets_for_users fill:#b2b5e5,color:#000000
    style nds2cz4n9ayp597y3n9brib2jr2qfry7m_nixos fill:#e5b2df,color:#000000
    style nds2cz4n9ayp597y3n9brib2jr2qfry7m_nixos_common_nix fill:#e5b2df,color:#000000
    style nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_global_nix fill:#cfe5b2,color:#000000
    style nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_configurations_nixos fill:#cfe5b2,color:#000000
    style nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_modules_docker_nix fill:#cfe5b2,color:#000000
    style nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_modules_headlamp_nix fill:#cfe5b2,color:#000000
    style nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_modules_tmux_nix fill:#cfe5b2,color:#000000
    style nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_machines_nixos_wsl_nixos fill:#cfe5b2,color:#000000
    style nn2fz9mdxszrr4bji3k8xvgwx6wcj9n4w_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#cfe5b2,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_build_tarball_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_docker_desktop_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_interop_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_recovery_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_ssh_agent_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd_native fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_systemd_native_wrap_shell_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_usbip_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_version_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_welcome_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_wsl_conf_nix fill:#b2e5e3,color:#000000
    style nj17c9chfia7c9zchkvkms6cqmhkhwcrj_modules_wsl_distro_nix fill:#b2e5e3,color:#000000
```
