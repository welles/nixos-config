# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_flake_nix["`**flake.nix**

_cdv5ggx4zcy3xsarm443wr31c6i1dlsb_`"]
    n6pz8b5s2bk9y9r9kphy1zma5ff14h82g_module_nix["`**module.nix**

_6pz8b5s2bk9y9r9kphy1zma5ff14h82g_`"]
    n6pz8b5s2bk9y9r9kphy1zma5ff14h82g_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_6pz8b5s2bk9y9r9kphy1zma5ff14h82g_`"]
    n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops["`**modules/sops**

_6kq390ig93mm2gy9swnqrzdsypjgw42r_`"]
    n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops_templates["`**modules/sops/templates**

_6kq390ig93mm2gy9swnqrzdsypjgw42r_`"]
    n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_6kq390ig93mm2gy9swnqrzdsypjgw42r_`"]
    n3wcs3dggyhzwjvnidxihj0k50xi6x78r_nixos["`**nixos**

_3wcs3dggyhzwjvnidxihj0k50xi6x78r_`"]
    n3wcs3dggyhzwjvnidxihj0k50xi6x78r_nixos_common_nix["`**nixos/common.nix**

_3wcs3dggyhzwjvnidxihj0k50xi6x78r_`"]
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_global_nix["`**global.nix**

_nbjz566mn4wfzbfml1dwhl8ripdzhzh7_`"]
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_configurations_eltern["`**configurations/eltern**

_nbjz566mn4wfzbfml1dwhl8ripdzhzh7_`"]
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_modules_networkmanager_nix["`**modules/networkmanager.nix**

_nbjz566mn4wfzbfml1dwhl8ripdzhzh7_`"]
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_modules_avahi_nix["`**modules/avahi.nix**

_nbjz566mn4wfzbfml1dwhl8ripdzhzh7_`"]
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_nbjz566mn4wfzbfml1dwhl8ripdzhzh7_`"]
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_nbjz566mn4wfzbfml1dwhl8ripdzhzh7_`"]
    ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_cdv5ggx4zcy3xsarm443wr31c6i1dlsb_`"]
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_nbjz566mn4wfzbfml1dwhl8ripdzhzh7_`"]
    ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_flake_nix --> n6pz8b5s2bk9y9r9kphy1zma5ff14h82g_module_nix
    ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_flake_nix --> n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops
    ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_flake_nix --> n3wcs3dggyhzwjvnidxihj0k50xi6x78r_nixos
    ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_flake_nix --> nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_global_nix
    ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_flake_nix --> nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_configurations_eltern
    ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_flake_nix --> nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos
    n6pz8b5s2bk9y9r9kphy1zma5ff14h82g_module_nix --> n6pz8b5s2bk9y9r9kphy1zma5ff14h82g_lib_make_disk_image_nix
    n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops --> n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops_templates
    n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops --> n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops_secrets_for_users
    n3wcs3dggyhzwjvnidxihj0k50xi6x78r_nixos --> n3wcs3dggyhzwjvnidxihj0k50xi6x78r_nixos_common_nix
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_configurations_eltern --> nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_modules_networkmanager_nix
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_configurations_eltern --> nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_modules_avahi_nix
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos --> nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos_hardware_configuration_nix
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos --> nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos_disk_configuration_nix
    nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos_hardware_configuration_nix --> ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_nixos_modules_installer_scan_not_detected_nix
    style ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_flake_nix fill:#b2e5cf,color:#000000
    style n6pz8b5s2bk9y9r9kphy1zma5ff14h82g_module_nix fill:#bfb2e5,color:#000000
    style n6pz8b5s2bk9y9r9kphy1zma5ff14h82g_lib_make_disk_image_nix fill:#bfb2e5,color:#000000
    style n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops fill:#e5ddb2,color:#000000
    style n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops_templates fill:#e5ddb2,color:#000000
    style n6kq390ig93mm2gy9swnqrzdsypjgw42r_modules_sops_secrets_for_users fill:#e5ddb2,color:#000000
    style n3wcs3dggyhzwjvnidxihj0k50xi6x78r_nixos fill:#e5b2dc,color:#000000
    style n3wcs3dggyhzwjvnidxihj0k50xi6x78r_nixos_common_nix fill:#e5b2dc,color:#000000
    style nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_global_nix fill:#e5b2bf,color:#000000
    style nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_configurations_eltern fill:#e5b2bf,color:#000000
    style nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_modules_networkmanager_nix fill:#e5b2bf,color:#000000
    style nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_modules_avahi_nix fill:#e5b2bf,color:#000000
    style nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos fill:#e5b2bf,color:#000000
    style nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos_hardware_configuration_nix fill:#e5b2bf,color:#000000
    style ncdv5ggx4zcy3xsarm443wr31c6i1dlsb_nixos_modules_installer_scan_not_detected_nix fill:#b2e5cf,color:#000000
    style nnbjz566mn4wfzbfml1dwhl8ripdzhzh7_machines_eltern_asus_nixos_disk_configuration_nix fill:#e5b2bf,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_flake_nix["`**flake.nix**

_4frnj8qmkyhqwdqz0f61a3k1935pvc8y_`"]
    nzn97jhl0m546bgs8h6yf8aibym84q9x1_module_nix["`**module.nix**

_zn97jhl0m546bgs8h6yf8aibym84q9x1_`"]
    nzn97jhl0m546bgs8h6yf8aibym84q9x1_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_zn97jhl0m546bgs8h6yf8aibym84q9x1_`"]
    n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops["`**modules/sops**

_8wp5qgk9swgpjgmk1fpww81lcydgn5a3_`"]
    n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops_templates["`**modules/sops/templates**

_8wp5qgk9swgpjgmk1fpww81lcydgn5a3_`"]
    n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_8wp5qgk9swgpjgmk1fpww81lcydgn5a3_`"]
    nxagrl8r1y74xl0vplkb1rl07gaklgdhk_nixos["`**nixos**

_xagrl8r1y74xl0vplkb1rl07gaklgdhk_`"]
    nxagrl8r1y74xl0vplkb1rl07gaklgdhk_nixos_common_nix["`**nixos/common.nix**

_xagrl8r1y74xl0vplkb1rl07gaklgdhk_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_global_nix["`**global.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch["`**configurations/schokoladenelch**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_docker_nix["`**modules/docker.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_networkmanager_nix["`**modules/networkmanager.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_tmux_nix["`**modules/tmux.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_check_mkv["`**modules/scripts/check-mkv**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_create_zfs_dataset["`**modules/scripts/create-zfs-dataset**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_stacks_default_nix["`**modules/stacks/default.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_4frnj8qmkyhqwdqz0f61a3k1935pvc8y_`"]
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_`"]
    n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_flake_nix --> nzn97jhl0m546bgs8h6yf8aibym84q9x1_module_nix
    n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_flake_nix --> n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops
    n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_flake_nix --> nxagrl8r1y74xl0vplkb1rl07gaklgdhk_nixos
    n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_flake_nix --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_global_nix
    n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_flake_nix --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch
    n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_flake_nix --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos
    nzn97jhl0m546bgs8h6yf8aibym84q9x1_module_nix --> nzn97jhl0m546bgs8h6yf8aibym84q9x1_lib_make_disk_image_nix
    n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops --> n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops_templates
    n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops --> n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops_secrets_for_users
    nxagrl8r1y74xl0vplkb1rl07gaklgdhk_nixos --> nxagrl8r1y74xl0vplkb1rl07gaklgdhk_nixos_common_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_docker_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_networkmanager_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_tmux_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_check_mkv
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_create_zfs_dataset
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_zfs_manual_snapshot
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_zfs_snapshot_diff
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_boot_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_networking_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_services_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_persistence_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_stacks_default_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos --> n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_nixos_modules_installer_scan_not_detected_nix
    style n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_flake_nix fill:#e5e2b2,color:#000000
    style nzn97jhl0m546bgs8h6yf8aibym84q9x1_module_nix fill:#b2e2e5,color:#000000
    style nzn97jhl0m546bgs8h6yf8aibym84q9x1_lib_make_disk_image_nix fill:#b2e2e5,color:#000000
    style n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops fill:#cdb2e5,color:#000000
    style n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops_templates fill:#cdb2e5,color:#000000
    style n8wp5qgk9swgpjgmk1fpww81lcydgn5a3_modules_sops_secrets_for_users fill:#cdb2e5,color:#000000
    style nxagrl8r1y74xl0vplkb1rl07gaklgdhk_nixos fill:#b2d0e5,color:#000000
    style nxagrl8r1y74xl0vplkb1rl07gaklgdhk_nixos_common_nix fill:#b2d0e5,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_global_nix fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_docker_nix fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_networkmanager_nix fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_tmux_nix fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_check_mkv fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_create_zfs_dataset fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_zfs_manual_snapshot fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_scripts_zfs_snapshot_diff fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_boot_nix fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_networking_nix fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_services_nix fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_configurations_schokoladenelch_persistence_nix fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_modules_stacks_default_nix fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos fill:#e5b2be,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#e5b2be,color:#000000
    style n4frnj8qmkyhqwdqz0f61a3k1935pvc8y_nixos_modules_installer_scan_not_detected_nix fill:#e5e2b2,color:#000000
    style n5r8alhspiw3a7nn72hrw4r3gfh7qpd3f_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#e5b2be,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_flake_nix["`**flake.nix**

_9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_`"]
    ndbx4k0c5xw23ma8y57qm1prbq6qiij85_module_nix["`**module.nix**

_dbx4k0c5xw23ma8y57qm1prbq6qiij85_`"]
    ndbx4k0c5xw23ma8y57qm1prbq6qiij85_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_dbx4k0c5xw23ma8y57qm1prbq6qiij85_`"]
    n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops["`**modules/sops**

_60jbba2qcn24fxcy4dvzg0a7vw254n4d_`"]
    n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops_templates["`**modules/sops/templates**

_60jbba2qcn24fxcy4dvzg0a7vw254n4d_`"]
    n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_60jbba2qcn24fxcy4dvzg0a7vw254n4d_`"]
    n4hkn8w4nfs5lcd8ncb87pa0l35g5win5_nixos["`**nixos**

_4hkn8w4nfs5lcd8ncb87pa0l35g5win5_`"]
    n4hkn8w4nfs5lcd8ncb87pa0l35g5win5_nixos_common_nix["`**nixos/common.nix**

_4hkn8w4nfs5lcd8ncb87pa0l35g5win5_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_global_nix["`**global.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico["`**configurations/nico**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_modules_docker_nix["`**modules/docker.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_modules_networkmanager_nix["`**modules/networkmanager.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_modules_pipewire_nix["`**modules/pipewire.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_services_nix["`**configurations/nico/services.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_modules_avahi_nix["`**modules/avahi.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_networking_nix["`**configurations/nico/networking.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_modules_eden_nix["`**modules/eden.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    nxf53bsb9y845awiy917gsqhqclqpswzp_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_xf53bsb9y845awiy917gsqhqclqpswzp_`"]
    n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_flake_nix --> ndbx4k0c5xw23ma8y57qm1prbq6qiij85_module_nix
    n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_flake_nix --> n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops
    n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_flake_nix --> n4hkn8w4nfs5lcd8ncb87pa0l35g5win5_nixos
    n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_flake_nix --> nxf53bsb9y845awiy917gsqhqclqpswzp_global_nix
    n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_flake_nix --> nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico
    n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_flake_nix --> nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos
    ndbx4k0c5xw23ma8y57qm1prbq6qiij85_module_nix --> ndbx4k0c5xw23ma8y57qm1prbq6qiij85_lib_make_disk_image_nix
    n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops --> n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops_templates
    n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops --> n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops_secrets_for_users
    n4hkn8w4nfs5lcd8ncb87pa0l35g5win5_nixos --> n4hkn8w4nfs5lcd8ncb87pa0l35g5win5_nixos_common_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_modules_docker_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_modules_networkmanager_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_boot_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_desktop_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_audio_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_virtualisation_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_services_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_packages_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_rclone_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico --> nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_networking_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_audio_nix --> nxf53bsb9y845awiy917gsqhqclqpswzp_modules_pipewire_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_services_nix --> nxf53bsb9y845awiy917gsqhqclqpswzp_modules_avahi_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos --> nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos_hardware_configuration_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos --> nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos --> nxf53bsb9y845awiy917gsqhqclqpswzp_modules_eden_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos --> nxf53bsb9y845awiy917gsqhqclqpswzp_modules_xone_dongle_nix
    nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos_hardware_configuration_nix --> n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_nixos_modules_installer_scan_not_detected_nix
    style n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_flake_nix fill:#e5b2c7,color:#000000
    style ndbx4k0c5xw23ma8y57qm1prbq6qiij85_module_nix fill:#e5c7b2,color:#000000
    style ndbx4k0c5xw23ma8y57qm1prbq6qiij85_lib_make_disk_image_nix fill:#e5c7b2,color:#000000
    style n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops fill:#c0e5b2,color:#000000
    style n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops_templates fill:#c0e5b2,color:#000000
    style n60jbba2qcn24fxcy4dvzg0a7vw254n4d_modules_sops_secrets_for_users fill:#c0e5b2,color:#000000
    style n4hkn8w4nfs5lcd8ncb87pa0l35g5win5_nixos fill:#b2bde5,color:#000000
    style n4hkn8w4nfs5lcd8ncb87pa0l35g5win5_nixos_common_nix fill:#b2bde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_global_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_modules_docker_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_modules_networkmanager_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_boot_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_desktop_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_audio_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_modules_pipewire_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_virtualisation_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_services_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_modules_avahi_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_packages_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_rclone_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_configurations_nico_networking_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#b2cde5,color:#000000
    style n9qlsm52k0qm4q0xy5c97sh7r8cd8rbn3_nixos_modules_installer_scan_not_detected_nix fill:#e5b2c7,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_modules_eden_nix fill:#b2cde5,color:#000000
    style nxf53bsb9y845awiy917gsqhqclqpswzp_modules_xone_dongle_nix fill:#b2cde5,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_flake_nix["`**flake.nix**

_i6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_`"]
    nnzsxk7ikw7nrldn22b3lpbhy5r69cqdj_module_nix["`**module.nix**

_nzsxk7ikw7nrldn22b3lpbhy5r69cqdj_`"]
    nnzsxk7ikw7nrldn22b3lpbhy5r69cqdj_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_nzsxk7ikw7nrldn22b3lpbhy5r69cqdj_`"]
    n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops["`**modules/sops**

_1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_`"]
    n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops_templates["`**modules/sops/templates**

_1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_`"]
    n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_`"]
    n618vn5q3d07y7s562n986f3blm0plqa7_nixos["`**nixos**

_618vn5q3d07y7s562n986f3blm0plqa7_`"]
    n618vn5q3d07y7s562n986f3blm0plqa7_nixos_common_nix["`**nixos/common.nix**

_618vn5q3d07y7s562n986f3blm0plqa7_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_global_nix["`**global.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico["`**configurations/nico**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_docker_nix["`**modules/docker.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_networkmanager_nix["`**modules/networkmanager.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_pipewire_nix["`**modules/pipewire.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_services_nix["`**configurations/nico/services.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_avahi_nix["`**modules/avahi.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_networking_nix["`**configurations/nico/networking.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_i6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_disk_configuration_nix["`**machines/nico-thinkpad-nixos/disk-configuration.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_impermanence_nix["`**machines/nico-thinkpad-nixos/impermanence.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_lmwj11pblh3sld1yc5zx4ra0dbbg0dlf_`"]
    ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_flake_nix --> nnzsxk7ikw7nrldn22b3lpbhy5r69cqdj_module_nix
    ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_flake_nix --> n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops
    ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_flake_nix --> n618vn5q3d07y7s562n986f3blm0plqa7_nixos
    ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_flake_nix --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_global_nix
    ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_flake_nix --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico
    ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_flake_nix --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos
    nnzsxk7ikw7nrldn22b3lpbhy5r69cqdj_module_nix --> nnzsxk7ikw7nrldn22b3lpbhy5r69cqdj_lib_make_disk_image_nix
    n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops --> n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops_templates
    n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops --> n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops_secrets_for_users
    n618vn5q3d07y7s562n986f3blm0plqa7_nixos --> n618vn5q3d07y7s562n986f3blm0plqa7_nixos_common_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_docker_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_networkmanager_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_boot_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_desktop_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_audio_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_virtualisation_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_services_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_packages_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_rclone_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_networking_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_audio_nix --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_pipewire_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_services_nix --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_avahi_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_hardware_configuration_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_disk_configuration_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_impermanence_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos --> nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_mobile_network_nix
    nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_hardware_configuration_nix --> ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_nixos_modules_installer_scan_not_detected_nix
    style ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_flake_nix fill:#e5b5b2,color:#000000
    style nnzsxk7ikw7nrldn22b3lpbhy5r69cqdj_module_nix fill:#e5b2dd,color:#000000
    style nnzsxk7ikw7nrldn22b3lpbhy5r69cqdj_lib_make_disk_image_nix fill:#e5b2dd,color:#000000
    style n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops fill:#b2e5d3,color:#000000
    style n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops_templates fill:#b2e5d3,color:#000000
    style n1bp0gspzhdb7wqkaikyxlvq1zrg9nb6f_modules_sops_secrets_for_users fill:#b2e5d3,color:#000000
    style n618vn5q3d07y7s562n986f3blm0plqa7_nixos fill:#b2e5d1,color:#000000
    style n618vn5q3d07y7s562n986f3blm0plqa7_nixos_common_nix fill:#b2e5d1,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_global_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_docker_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_networkmanager_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_boot_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_desktop_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_audio_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_pipewire_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_virtualisation_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_services_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_modules_avahi_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_packages_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_rclone_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_configurations_nico_networking_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#bee5b2,color:#000000
    style ni6yxc1j6xaf0iy6qnh9x4blr5zn7g5vl_nixos_modules_installer_scan_not_detected_nix fill:#e5b5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_disk_configuration_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_impermanence_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#bee5b2,color:#000000
    style nlmwj11pblh3sld1yc5zx4ra0dbbg0dlf_machines_nico_thinkpad_nixos_mobile_network_nix fill:#bee5b2,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    nm7r319adyp8hm7aq415pbs8kgzdxqmsk_flake_nix["`**flake.nix**

_m7r319adyp8hm7aq415pbs8kgzdxqmsk_`"]
    nnij6bbbg0g7zicy18k2l04l0vsg4pf2q_module_nix["`**module.nix**

_nij6bbbg0g7zicy18k2l04l0vsg4pf2q_`"]
    nnij6bbbg0g7zicy18k2l04l0vsg4pf2q_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_nij6bbbg0g7zicy18k2l04l0vsg4pf2q_`"]
    nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops["`**modules/sops**

_vjpv4y6j00l5pxj7afwyf873cgsg73f6_`"]
    nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops_templates["`**modules/sops/templates**

_vjpv4y6j00l5pxj7afwyf873cgsg73f6_`"]
    nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_vjpv4y6j00l5pxj7afwyf873cgsg73f6_`"]
    ncfvf9hrn7pp3iskf7in6f9snlaapbmna_nixos["`**nixos**

_cfvf9hrn7pp3iskf7in6f9snlaapbmna_`"]
    ncfvf9hrn7pp3iskf7in6f9snlaapbmna_nixos_common_nix["`**nixos/common.nix**

_cfvf9hrn7pp3iskf7in6f9snlaapbmna_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_global_nix["`**global.nix**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_configurations_nixos["`**configurations/nixos**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_modules_docker_nix["`**modules/docker.nix**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_modules_headlamp_nix["`**modules/headlamp.nix**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_modules_tmux_nix["`**modules/tmux.nix**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_ialqfby967zgc3lma70azj3y34fvzk4k_`"]
    nm7r319adyp8hm7aq415pbs8kgzdxqmsk_flake_nix --> nnij6bbbg0g7zicy18k2l04l0vsg4pf2q_module_nix
    nm7r319adyp8hm7aq415pbs8kgzdxqmsk_flake_nix --> nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops
    nm7r319adyp8hm7aq415pbs8kgzdxqmsk_flake_nix --> ncfvf9hrn7pp3iskf7in6f9snlaapbmna_nixos
    nm7r319adyp8hm7aq415pbs8kgzdxqmsk_flake_nix --> nialqfby967zgc3lma70azj3y34fvzk4k_global_nix
    nm7r319adyp8hm7aq415pbs8kgzdxqmsk_flake_nix --> nialqfby967zgc3lma70azj3y34fvzk4k_configurations_nixos
    nm7r319adyp8hm7aq415pbs8kgzdxqmsk_flake_nix --> nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos
    nnij6bbbg0g7zicy18k2l04l0vsg4pf2q_module_nix --> nnij6bbbg0g7zicy18k2l04l0vsg4pf2q_lib_make_disk_image_nix
    nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops --> nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops_templates
    nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops --> nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops_secrets_for_users
    ncfvf9hrn7pp3iskf7in6f9snlaapbmna_nixos --> ncfvf9hrn7pp3iskf7in6f9snlaapbmna_nixos_common_nix
    nialqfby967zgc3lma70azj3y34fvzk4k_configurations_nixos --> nialqfby967zgc3lma70azj3y34fvzk4k_modules_docker_nix
    nialqfby967zgc3lma70azj3y34fvzk4k_configurations_nixos --> nialqfby967zgc3lma70azj3y34fvzk4k_modules_headlamp_nix
    nialqfby967zgc3lma70azj3y34fvzk4k_configurations_nixos --> nialqfby967zgc3lma70azj3y34fvzk4k_modules_tmux_nix
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos --> nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos --> nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_disk_configuration_nix
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos --> nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_boot_nix
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos --> nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_desktop_nix
    nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos --> nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_persistence_nix
    style nm7r319adyp8hm7aq415pbs8kgzdxqmsk_flake_nix fill:#b2c2e5,color:#000000
    style nnij6bbbg0g7zicy18k2l04l0vsg4pf2q_module_nix fill:#e5bbb2,color:#000000
    style nnij6bbbg0g7zicy18k2l04l0vsg4pf2q_lib_make_disk_image_nix fill:#e5bbb2,color:#000000
    style nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops fill:#b2e5b5,color:#000000
    style nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops_templates fill:#b2e5b5,color:#000000
    style nvjpv4y6j00l5pxj7afwyf873cgsg73f6_modules_sops_secrets_for_users fill:#b2e5b5,color:#000000
    style ncfvf9hrn7pp3iskf7in6f9snlaapbmna_nixos fill:#b2e5c3,color:#000000
    style ncfvf9hrn7pp3iskf7in6f9snlaapbmna_nixos_common_nix fill:#b2e5c3,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_global_nix fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_configurations_nixos fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_modules_docker_nix fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_modules_headlamp_nix fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_modules_tmux_nix fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_boot_nix fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_desktop_nix fill:#e5bbb2,color:#000000
    style nialqfby967zgc3lma70azj3y34fvzk4k_machines_nixos_virtualbox_nixos_persistence_nix fill:#e5bbb2,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    n2byz6z294anyxhbi5xv3hdcrjwimrnws_flake_nix["`**flake.nix**

_2byz6z294anyxhbi5xv3hdcrjwimrnws_`"]
    n3dqmfvv8nsivr8jvhpcj26ipxar42r53_module_nix["`**module.nix**

_3dqmfvv8nsivr8jvhpcj26ipxar42r53_`"]
    n3dqmfvv8nsivr8jvhpcj26ipxar42r53_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_3dqmfvv8nsivr8jvhpcj26ipxar42r53_`"]
    nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops["`**modules/sops**

_mpj7xzxd5615g5aksk9snsbnvlcpmwyq_`"]
    nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops_templates["`**modules/sops/templates**

_mpj7xzxd5615g5aksk9snsbnvlcpmwyq_`"]
    nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_mpj7xzxd5615g5aksk9snsbnvlcpmwyq_`"]
    n2pcqq5jjdby1cinb7jbrdazlsmwnz6zq_nixos["`**nixos**

_2pcqq5jjdby1cinb7jbrdazlsmwnz6zq_`"]
    n2pcqq5jjdby1cinb7jbrdazlsmwnz6zq_nixos_common_nix["`**nixos/common.nix**

_2pcqq5jjdby1cinb7jbrdazlsmwnz6zq_`"]
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_global_nix["`**global.nix**

_5ajf3jj2546bd9zaaql0imbdp7cwchb5_`"]
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_configurations_nixos["`**configurations/nixos**

_5ajf3jj2546bd9zaaql0imbdp7cwchb5_`"]
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_modules_docker_nix["`**modules/docker.nix**

_5ajf3jj2546bd9zaaql0imbdp7cwchb5_`"]
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_modules_headlamp_nix["`**modules/headlamp.nix**

_5ajf3jj2546bd9zaaql0imbdp7cwchb5_`"]
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_modules_tmux_nix["`**modules/tmux.nix**

_5ajf3jj2546bd9zaaql0imbdp7cwchb5_`"]
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_5ajf3jj2546bd9zaaql0imbdp7cwchb5_`"]
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_5ajf3jj2546bd9zaaql0imbdp7cwchb5_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules["`**modules**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_build_tarball_nix["`**modules/build-tarball.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_interop_nix["`**modules/interop.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_recovery_nix["`**modules/recovery.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd["`**modules/systemd**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd_native["`**modules/systemd/native**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_usbip_nix["`**modules/usbip.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_version_nix["`**modules/version.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_welcome_nix["`**modules/welcome.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_vqqmmrhpy0rggz6cy8gp4h1jz420byg1_`"]
    n2byz6z294anyxhbi5xv3hdcrjwimrnws_flake_nix --> n3dqmfvv8nsivr8jvhpcj26ipxar42r53_module_nix
    n2byz6z294anyxhbi5xv3hdcrjwimrnws_flake_nix --> nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops
    n2byz6z294anyxhbi5xv3hdcrjwimrnws_flake_nix --> n2pcqq5jjdby1cinb7jbrdazlsmwnz6zq_nixos
    n2byz6z294anyxhbi5xv3hdcrjwimrnws_flake_nix --> n5ajf3jj2546bd9zaaql0imbdp7cwchb5_global_nix
    n2byz6z294anyxhbi5xv3hdcrjwimrnws_flake_nix --> n5ajf3jj2546bd9zaaql0imbdp7cwchb5_configurations_nixos
    n2byz6z294anyxhbi5xv3hdcrjwimrnws_flake_nix --> n5ajf3jj2546bd9zaaql0imbdp7cwchb5_machines_nixos_wsl_nixos
    n3dqmfvv8nsivr8jvhpcj26ipxar42r53_module_nix --> n3dqmfvv8nsivr8jvhpcj26ipxar42r53_lib_make_disk_image_nix
    nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops --> nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops_templates
    nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops --> nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops_secrets_for_users
    n2pcqq5jjdby1cinb7jbrdazlsmwnz6zq_nixos --> n2pcqq5jjdby1cinb7jbrdazlsmwnz6zq_nixos_common_nix
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_configurations_nixos --> n5ajf3jj2546bd9zaaql0imbdp7cwchb5_modules_docker_nix
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_configurations_nixos --> n5ajf3jj2546bd9zaaql0imbdp7cwchb5_modules_headlamp_nix
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_configurations_nixos --> n5ajf3jj2546bd9zaaql0imbdp7cwchb5_modules_tmux_nix
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_machines_nixos_wsl_nixos --> n5ajf3jj2546bd9zaaql0imbdp7cwchb5_machines_nixos_wsl_nixos_hardware_configuration_nix
    n5ajf3jj2546bd9zaaql0imbdp7cwchb5_machines_nixos_wsl_nixos --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_build_tarball_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_docker_desktop_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_interop_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_recovery_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_ssh_agent_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_usbip_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_version_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_welcome_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_wsl_conf_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_wsl_distro_nix
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd_native
    nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd_native --> nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd_native_wrap_shell_nix
    style n2byz6z294anyxhbi5xv3hdcrjwimrnws_flake_nix fill:#e5b2df,color:#000000
    style n3dqmfvv8nsivr8jvhpcj26ipxar42r53_module_nix fill:#b2e5cb,color:#000000
    style n3dqmfvv8nsivr8jvhpcj26ipxar42r53_lib_make_disk_image_nix fill:#b2e5cb,color:#000000
    style nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops fill:#e5e5b2,color:#000000
    style nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops_templates fill:#e5e5b2,color:#000000
    style nmpj7xzxd5615g5aksk9snsbnvlcpmwyq_modules_sops_secrets_for_users fill:#e5e5b2,color:#000000
    style n2pcqq5jjdby1cinb7jbrdazlsmwnz6zq_nixos fill:#e5b2ca,color:#000000
    style n2pcqq5jjdby1cinb7jbrdazlsmwnz6zq_nixos_common_nix fill:#e5b2ca,color:#000000
    style n5ajf3jj2546bd9zaaql0imbdp7cwchb5_global_nix fill:#e5c1b2,color:#000000
    style n5ajf3jj2546bd9zaaql0imbdp7cwchb5_configurations_nixos fill:#e5c1b2,color:#000000
    style n5ajf3jj2546bd9zaaql0imbdp7cwchb5_modules_docker_nix fill:#e5c1b2,color:#000000
    style n5ajf3jj2546bd9zaaql0imbdp7cwchb5_modules_headlamp_nix fill:#e5c1b2,color:#000000
    style n5ajf3jj2546bd9zaaql0imbdp7cwchb5_modules_tmux_nix fill:#e5c1b2,color:#000000
    style n5ajf3jj2546bd9zaaql0imbdp7cwchb5_machines_nixos_wsl_nixos fill:#e5c1b2,color:#000000
    style n5ajf3jj2546bd9zaaql0imbdp7cwchb5_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#e5c1b2,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_build_tarball_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_docker_desktop_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_interop_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_recovery_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_ssh_agent_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd_native fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_systemd_native_wrap_shell_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_usbip_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_version_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_welcome_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_wsl_conf_nix fill:#cbb2e5,color:#000000
    style nvqqmmrhpy0rggz6cy8gp4h1jz420byg1_modules_wsl_distro_nix fill:#cbb2e5,color:#000000
```
