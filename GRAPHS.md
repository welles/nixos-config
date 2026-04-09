# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    nlmiflh7grjbcr2z336c62lahhqfbzcgd_flake_nix["`**flake.nix**

_lmiflh7grjbcr2z336c62lahhqfbzcgd_`"]
    n56gfjwqwxm7dbcnk94fpk3l8nvm0k6r9_module_nix["`**module.nix**

_56gfjwqwxm7dbcnk94fpk3l8nvm0k6r9_`"]
    n56gfjwqwxm7dbcnk94fpk3l8nvm0k6r9_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_56gfjwqwxm7dbcnk94fpk3l8nvm0k6r9_`"]
    ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops["`**modules/sops**

_cn5n5nxpflmn6vrc088arh435g4mqv37_`"]
    ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops_templates["`**modules/sops/templates**

_cn5n5nxpflmn6vrc088arh435g4mqv37_`"]
    ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_cn5n5nxpflmn6vrc088arh435g4mqv37_`"]
    nm5wksl5c3yyrdqd4nyl29v0w63yhwkq6_nixos["`**nixos**

_m5wksl5c3yyrdqd4nyl29v0w63yhwkq6_`"]
    nm5wksl5c3yyrdqd4nyl29v0w63yhwkq6_nixos_common_nix["`**nixos/common.nix**

_m5wksl5c3yyrdqd4nyl29v0w63yhwkq6_`"]
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_global_nix["`**global.nix**

_iq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_`"]
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_configurations_eltern["`**configurations/eltern**

_iq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_`"]
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_modules_networkmanager_nix["`**modules/networkmanager.nix**

_iq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_`"]
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_modules_avahi_nix["`**modules/avahi.nix**

_iq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_`"]
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_iq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_`"]
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_iq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_`"]
    nlmiflh7grjbcr2z336c62lahhqfbzcgd_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_lmiflh7grjbcr2z336c62lahhqfbzcgd_`"]
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_iq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_`"]
    nlmiflh7grjbcr2z336c62lahhqfbzcgd_flake_nix --> n56gfjwqwxm7dbcnk94fpk3l8nvm0k6r9_module_nix
    nlmiflh7grjbcr2z336c62lahhqfbzcgd_flake_nix --> ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops
    nlmiflh7grjbcr2z336c62lahhqfbzcgd_flake_nix --> nm5wksl5c3yyrdqd4nyl29v0w63yhwkq6_nixos
    nlmiflh7grjbcr2z336c62lahhqfbzcgd_flake_nix --> niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_global_nix
    nlmiflh7grjbcr2z336c62lahhqfbzcgd_flake_nix --> niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_configurations_eltern
    nlmiflh7grjbcr2z336c62lahhqfbzcgd_flake_nix --> niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos
    n56gfjwqwxm7dbcnk94fpk3l8nvm0k6r9_module_nix --> n56gfjwqwxm7dbcnk94fpk3l8nvm0k6r9_lib_make_disk_image_nix
    ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops --> ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops_templates
    ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops --> ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops_secrets_for_users
    nm5wksl5c3yyrdqd4nyl29v0w63yhwkq6_nixos --> nm5wksl5c3yyrdqd4nyl29v0w63yhwkq6_nixos_common_nix
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_configurations_eltern --> niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_modules_networkmanager_nix
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_configurations_eltern --> niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_modules_avahi_nix
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos --> niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos_hardware_configuration_nix
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos --> niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos_disk_configuration_nix
    niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos_hardware_configuration_nix --> nlmiflh7grjbcr2z336c62lahhqfbzcgd_nixos_modules_installer_scan_not_detected_nix
    style nlmiflh7grjbcr2z336c62lahhqfbzcgd_flake_nix fill:#e5b2c2,color:#000000
    style n56gfjwqwxm7dbcnk94fpk3l8nvm0k6r9_module_nix fill:#e5c4b2,color:#000000
    style n56gfjwqwxm7dbcnk94fpk3l8nvm0k6r9_lib_make_disk_image_nix fill:#e5c4b2,color:#000000
    style ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops fill:#b2c6e5,color:#000000
    style ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops_templates fill:#b2c6e5,color:#000000
    style ncn5n5nxpflmn6vrc088arh435g4mqv37_modules_sops_secrets_for_users fill:#b2c6e5,color:#000000
    style nm5wksl5c3yyrdqd4nyl29v0w63yhwkq6_nixos fill:#bbe5b2,color:#000000
    style nm5wksl5c3yyrdqd4nyl29v0w63yhwkq6_nixos_common_nix fill:#bbe5b2,color:#000000
    style niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_global_nix fill:#e5b2d0,color:#000000
    style niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_configurations_eltern fill:#e5b2d0,color:#000000
    style niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_modules_networkmanager_nix fill:#e5b2d0,color:#000000
    style niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_modules_avahi_nix fill:#e5b2d0,color:#000000
    style niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos fill:#e5b2d0,color:#000000
    style niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos_hardware_configuration_nix fill:#e5b2d0,color:#000000
    style nlmiflh7grjbcr2z336c62lahhqfbzcgd_nixos_modules_installer_scan_not_detected_nix fill:#e5b2c2,color:#000000
    style niq1n5gmgvsmacwjqwn9mszg1ysr5wvvv_machines_eltern_asus_nixos_disk_configuration_nix fill:#e5b2d0,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    npfg36ywz43b252vz3ijmkpkfk72z228s_flake_nix["`**flake.nix**

_pfg36ywz43b252vz3ijmkpkfk72z228s_`"]
    ndajxxi883kgm9c3rg44rsmwk5jxq6xi7_module_nix["`**module.nix**

_dajxxi883kgm9c3rg44rsmwk5jxq6xi7_`"]
    ndajxxi883kgm9c3rg44rsmwk5jxq6xi7_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_dajxxi883kgm9c3rg44rsmwk5jxq6xi7_`"]
    nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops["`**modules/sops**

_vwjbqgxfb7xszp13xasxrpnqihbcn6am_`"]
    nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops_templates["`**modules/sops/templates**

_vwjbqgxfb7xszp13xasxrpnqihbcn6am_`"]
    nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_vwjbqgxfb7xszp13xasxrpnqihbcn6am_`"]
    nixwbg029nf9sgw17ag3yzmchma0fjk8n_nixos["`**nixos**

_ixwbg029nf9sgw17ag3yzmchma0fjk8n_`"]
    nixwbg029nf9sgw17ag3yzmchma0fjk8n_nixos_common_nix["`**nixos/common.nix**

_ixwbg029nf9sgw17ag3yzmchma0fjk8n_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_global_nix["`**global.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch["`**configurations/schokoladenelch**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_docker_nix["`**modules/docker.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_networkmanager_nix["`**modules/networkmanager.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_tmux_nix["`**modules/tmux.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_check_mkv["`**modules/scripts/check-mkv**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_create_zfs_dataset["`**modules/scripts/create-zfs-dataset**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_stacks_default_nix["`**modules/stacks/default.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    npfg36ywz43b252vz3ijmkpkfk72z228s_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_pfg36ywz43b252vz3ijmkpkfk72z228s_`"]
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_bbvsaqb8j4m750mc5qjnklras7zdfcka_`"]
    npfg36ywz43b252vz3ijmkpkfk72z228s_flake_nix --> ndajxxi883kgm9c3rg44rsmwk5jxq6xi7_module_nix
    npfg36ywz43b252vz3ijmkpkfk72z228s_flake_nix --> nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops
    npfg36ywz43b252vz3ijmkpkfk72z228s_flake_nix --> nixwbg029nf9sgw17ag3yzmchma0fjk8n_nixos
    npfg36ywz43b252vz3ijmkpkfk72z228s_flake_nix --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_global_nix
    npfg36ywz43b252vz3ijmkpkfk72z228s_flake_nix --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch
    npfg36ywz43b252vz3ijmkpkfk72z228s_flake_nix --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos
    ndajxxi883kgm9c3rg44rsmwk5jxq6xi7_module_nix --> ndajxxi883kgm9c3rg44rsmwk5jxq6xi7_lib_make_disk_image_nix
    nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops --> nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops_templates
    nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops --> nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops_secrets_for_users
    nixwbg029nf9sgw17ag3yzmchma0fjk8n_nixos --> nixwbg029nf9sgw17ag3yzmchma0fjk8n_nixos_common_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_docker_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_networkmanager_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_tmux_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_check_mkv
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_create_zfs_dataset
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_zfs_manual_snapshot
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_zfs_snapshot_diff
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_boot_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_networking_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_services_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_persistence_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_stacks_default_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos --> nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> npfg36ywz43b252vz3ijmkpkfk72z228s_nixos_modules_installer_scan_not_detected_nix
    style npfg36ywz43b252vz3ijmkpkfk72z228s_flake_nix fill:#e5bdb2,color:#000000
    style ndajxxi883kgm9c3rg44rsmwk5jxq6xi7_module_nix fill:#e5b2e1,color:#000000
    style ndajxxi883kgm9c3rg44rsmwk5jxq6xi7_lib_make_disk_image_nix fill:#e5b2e1,color:#000000
    style nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops fill:#e5bcb2,color:#000000
    style nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops_templates fill:#e5bcb2,color:#000000
    style nvwjbqgxfb7xszp13xasxrpnqihbcn6am_modules_sops_secrets_for_users fill:#e5bcb2,color:#000000
    style nixwbg029nf9sgw17ag3yzmchma0fjk8n_nixos fill:#e5b2b3,color:#000000
    style nixwbg029nf9sgw17ag3yzmchma0fjk8n_nixos_common_nix fill:#e5b2b3,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_global_nix fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_docker_nix fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_networkmanager_nix fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_tmux_nix fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_check_mkv fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_create_zfs_dataset fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_zfs_manual_snapshot fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_scripts_zfs_snapshot_diff fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_boot_nix fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_networking_nix fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_services_nix fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_configurations_schokoladenelch_persistence_nix fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_modules_stacks_default_nix fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos fill:#e5dcb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#e5dcb2,color:#000000
    style npfg36ywz43b252vz3ijmkpkfk72z228s_nixos_modules_installer_scan_not_detected_nix fill:#e5bdb2,color:#000000
    style nbbvsaqb8j4m750mc5qjnklras7zdfcka_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#e5dcb2,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    nic7hszkrm6nflrs1syf3xrc1j75gbg1y_flake_nix["`**flake.nix**

_ic7hszkrm6nflrs1syf3xrc1j75gbg1y_`"]
    nr8n146dcfgb6dsdx09x3nd4pn5wxmmqz_module_nix["`**module.nix**

_r8n146dcfgb6dsdx09x3nd4pn5wxmmqz_`"]
    nr8n146dcfgb6dsdx09x3nd4pn5wxmmqz_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_r8n146dcfgb6dsdx09x3nd4pn5wxmmqz_`"]
    nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops["`**modules/sops**

_zb1fw1fbsvq9ilfyln6yff7gp7rka1wq_`"]
    nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops_templates["`**modules/sops/templates**

_zb1fw1fbsvq9ilfyln6yff7gp7rka1wq_`"]
    nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_zb1fw1fbsvq9ilfyln6yff7gp7rka1wq_`"]
    nlrzizv7zcg69wj2aqwky2l41l5xz9rfk_nixos["`**nixos**

_lrzizv7zcg69wj2aqwky2l41l5xz9rfk_`"]
    nlrzizv7zcg69wj2aqwky2l41l5xz9rfk_nixos_common_nix["`**nixos/common.nix**

_lrzizv7zcg69wj2aqwky2l41l5xz9rfk_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_global_nix["`**global.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico["`**configurations/nico**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_docker_nix["`**modules/docker.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_networkmanager_nix["`**modules/networkmanager.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_pipewire_nix["`**modules/pipewire.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_services_nix["`**configurations/nico/services.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_avahi_nix["`**modules/avahi.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    nic7hszkrm6nflrs1syf3xrc1j75gbg1y_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_ic7hszkrm6nflrs1syf3xrc1j75gbg1y_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_eden_nix["`**modules/eden.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_06v3vzmkkpaigi58gj56yisfyb5w89ga_`"]
    nic7hszkrm6nflrs1syf3xrc1j75gbg1y_flake_nix --> nr8n146dcfgb6dsdx09x3nd4pn5wxmmqz_module_nix
    nic7hszkrm6nflrs1syf3xrc1j75gbg1y_flake_nix --> nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops
    nic7hszkrm6nflrs1syf3xrc1j75gbg1y_flake_nix --> nlrzizv7zcg69wj2aqwky2l41l5xz9rfk_nixos
    nic7hszkrm6nflrs1syf3xrc1j75gbg1y_flake_nix --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_global_nix
    nic7hszkrm6nflrs1syf3xrc1j75gbg1y_flake_nix --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico
    nic7hszkrm6nflrs1syf3xrc1j75gbg1y_flake_nix --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos
    nr8n146dcfgb6dsdx09x3nd4pn5wxmmqz_module_nix --> nr8n146dcfgb6dsdx09x3nd4pn5wxmmqz_lib_make_disk_image_nix
    nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops --> nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops_templates
    nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops --> nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops_secrets_for_users
    nlrzizv7zcg69wj2aqwky2l41l5xz9rfk_nixos --> nlrzizv7zcg69wj2aqwky2l41l5xz9rfk_nixos_common_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_docker_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_networkmanager_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_boot_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_desktop_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_audio_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_virtualisation_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_services_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_packages_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_rclone_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_audio_nix --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_pipewire_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_services_nix --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_avahi_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos_hardware_configuration_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_eden_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos --> n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_xone_dongle_nix
    n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos_hardware_configuration_nix --> nic7hszkrm6nflrs1syf3xrc1j75gbg1y_nixos_modules_installer_scan_not_detected_nix
    style nic7hszkrm6nflrs1syf3xrc1j75gbg1y_flake_nix fill:#b2e5c8,color:#000000
    style nr8n146dcfgb6dsdx09x3nd4pn5wxmmqz_module_nix fill:#b2e5cc,color:#000000
    style nr8n146dcfgb6dsdx09x3nd4pn5wxmmqz_lib_make_disk_image_nix fill:#b2e5cc,color:#000000
    style nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops fill:#b2d2e5,color:#000000
    style nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops_templates fill:#b2d2e5,color:#000000
    style nzb1fw1fbsvq9ilfyln6yff7gp7rka1wq_modules_sops_secrets_for_users fill:#b2d2e5,color:#000000
    style nlrzizv7zcg69wj2aqwky2l41l5xz9rfk_nixos fill:#b2d7e5,color:#000000
    style nlrzizv7zcg69wj2aqwky2l41l5xz9rfk_nixos_common_nix fill:#b2d7e5,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_global_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_docker_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_networkmanager_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_boot_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_desktop_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_audio_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_pipewire_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_virtualisation_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_services_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_avahi_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_packages_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_configurations_nico_rclone_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#e5d8b2,color:#000000
    style nic7hszkrm6nflrs1syf3xrc1j75gbg1y_nixos_modules_installer_scan_not_detected_nix fill:#b2e5c8,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_eden_nix fill:#e5d8b2,color:#000000
    style n06v3vzmkkpaigi58gj56yisfyb5w89ga_modules_xone_dongle_nix fill:#e5d8b2,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    nymckzxzd87payn7kmzgh9f2bmqxc5ppv_flake_nix["`**flake.nix**

_ymckzxzd87payn7kmzgh9f2bmqxc5ppv_`"]
    nkfxc31gjkfy0bas308rmns08bg0pgyvd_module_nix["`**module.nix**

_kfxc31gjkfy0bas308rmns08bg0pgyvd_`"]
    nkfxc31gjkfy0bas308rmns08bg0pgyvd_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_kfxc31gjkfy0bas308rmns08bg0pgyvd_`"]
    n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops["`**modules/sops**

_2343s0h32h6jr5j1mzx0fpdlpz913mpq_`"]
    n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops_templates["`**modules/sops/templates**

_2343s0h32h6jr5j1mzx0fpdlpz913mpq_`"]
    n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_2343s0h32h6jr5j1mzx0fpdlpz913mpq_`"]
    na39nmc19c46gbcz3v2j6a83b6gbp475f_nixos["`**nixos**

_a39nmc19c46gbcz3v2j6a83b6gbp475f_`"]
    na39nmc19c46gbcz3v2j6a83b6gbp475f_nixos_common_nix["`**nixos/common.nix**

_a39nmc19c46gbcz3v2j6a83b6gbp475f_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_global_nix["`**global.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico["`**configurations/nico**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_modules_docker_nix["`**modules/docker.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_modules_networkmanager_nix["`**modules/networkmanager.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_modules_pipewire_nix["`**modules/pipewire.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_services_nix["`**configurations/nico/services.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_modules_avahi_nix["`**modules/avahi.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    nymckzxzd87payn7kmzgh9f2bmqxc5ppv_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_ymckzxzd87payn7kmzgh9f2bmqxc5ppv_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_04c0q15karv4malj27j4c0hd8v6d01yi_`"]
    nymckzxzd87payn7kmzgh9f2bmqxc5ppv_flake_nix --> nkfxc31gjkfy0bas308rmns08bg0pgyvd_module_nix
    nymckzxzd87payn7kmzgh9f2bmqxc5ppv_flake_nix --> n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops
    nymckzxzd87payn7kmzgh9f2bmqxc5ppv_flake_nix --> na39nmc19c46gbcz3v2j6a83b6gbp475f_nixos
    nymckzxzd87payn7kmzgh9f2bmqxc5ppv_flake_nix --> n04c0q15karv4malj27j4c0hd8v6d01yi_global_nix
    nymckzxzd87payn7kmzgh9f2bmqxc5ppv_flake_nix --> n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico
    nymckzxzd87payn7kmzgh9f2bmqxc5ppv_flake_nix --> n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos
    nkfxc31gjkfy0bas308rmns08bg0pgyvd_module_nix --> nkfxc31gjkfy0bas308rmns08bg0pgyvd_lib_make_disk_image_nix
    n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops --> n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops_templates
    n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops --> n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops_secrets_for_users
    na39nmc19c46gbcz3v2j6a83b6gbp475f_nixos --> na39nmc19c46gbcz3v2j6a83b6gbp475f_nixos_common_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico --> n04c0q15karv4malj27j4c0hd8v6d01yi_modules_docker_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico --> n04c0q15karv4malj27j4c0hd8v6d01yi_modules_networkmanager_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico --> n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_boot_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico --> n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_desktop_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico --> n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_audio_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico --> n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_virtualisation_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico --> n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_services_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico --> n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_packages_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico --> n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_rclone_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_audio_nix --> n04c0q15karv4malj27j4c0hd8v6d01yi_modules_pipewire_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_services_nix --> n04c0q15karv4malj27j4c0hd8v6d01yi_modules_avahi_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos --> n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_hardware_configuration_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos --> n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos --> n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_mobile_network_nix
    n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_hardware_configuration_nix --> nymckzxzd87payn7kmzgh9f2bmqxc5ppv_nixos_modules_installer_scan_not_detected_nix
    style nymckzxzd87payn7kmzgh9f2bmqxc5ppv_flake_nix fill:#b7b2e5,color:#000000
    style nkfxc31gjkfy0bas308rmns08bg0pgyvd_module_nix fill:#bdb2e5,color:#000000
    style nkfxc31gjkfy0bas308rmns08bg0pgyvd_lib_make_disk_image_nix fill:#bdb2e5,color:#000000
    style n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops fill:#b2e5d0,color:#000000
    style n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops_templates fill:#b2e5d0,color:#000000
    style n2343s0h32h6jr5j1mzx0fpdlpz913mpq_modules_sops_secrets_for_users fill:#b2e5d0,color:#000000
    style na39nmc19c46gbcz3v2j6a83b6gbp475f_nixos fill:#c5b2e5,color:#000000
    style na39nmc19c46gbcz3v2j6a83b6gbp475f_nixos_common_nix fill:#c5b2e5,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_global_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_modules_docker_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_modules_networkmanager_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_boot_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_desktop_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_audio_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_modules_pipewire_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_virtualisation_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_services_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_modules_avahi_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_packages_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_configurations_nico_rclone_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#e5b2c2,color:#000000
    style nymckzxzd87payn7kmzgh9f2bmqxc5ppv_nixos_modules_installer_scan_not_detected_nix fill:#b7b2e5,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#e5b2c2,color:#000000
    style n04c0q15karv4malj27j4c0hd8v6d01yi_machines_nico_thinkpad_nixos_mobile_network_nix fill:#e5b2c2,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    nzaqk04gg87wx5rfjcd1j76zy2wc428cn_flake_nix["`**flake.nix**

_zaqk04gg87wx5rfjcd1j76zy2wc428cn_`"]
    nb81r5xf94vspln6c4p9ahki3y4mn7yx8_module_nix["`**module.nix**

_b81r5xf94vspln6c4p9ahki3y4mn7yx8_`"]
    nb81r5xf94vspln6c4p9ahki3y4mn7yx8_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_b81r5xf94vspln6c4p9ahki3y4mn7yx8_`"]
    nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops["`**modules/sops**

_czikx518ir0jmhqn8ljm56yy4a7shrmb_`"]
    nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops_templates["`**modules/sops/templates**

_czikx518ir0jmhqn8ljm56yy4a7shrmb_`"]
    nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_czikx518ir0jmhqn8ljm56yy4a7shrmb_`"]
    ngcl762dwgw4ya065m382kgsvg3jwmbsl_nixos["`**nixos**

_gcl762dwgw4ya065m382kgsvg3jwmbsl_`"]
    ngcl762dwgw4ya065m382kgsvg3jwmbsl_nixos_common_nix["`**nixos/common.nix**

_gcl762dwgw4ya065m382kgsvg3jwmbsl_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_global_nix["`**global.nix**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_configurations_nixos["`**configurations/nixos**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_modules_docker_nix["`**modules/docker.nix**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_modules_headlamp_nix["`**modules/headlamp.nix**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_modules_tmux_nix["`**modules/tmux.nix**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_pgv3f8anwgdg3042d2bq5i23k8ykc1y3_`"]
    nzaqk04gg87wx5rfjcd1j76zy2wc428cn_flake_nix --> nb81r5xf94vspln6c4p9ahki3y4mn7yx8_module_nix
    nzaqk04gg87wx5rfjcd1j76zy2wc428cn_flake_nix --> nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops
    nzaqk04gg87wx5rfjcd1j76zy2wc428cn_flake_nix --> ngcl762dwgw4ya065m382kgsvg3jwmbsl_nixos
    nzaqk04gg87wx5rfjcd1j76zy2wc428cn_flake_nix --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_global_nix
    nzaqk04gg87wx5rfjcd1j76zy2wc428cn_flake_nix --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_configurations_nixos
    nzaqk04gg87wx5rfjcd1j76zy2wc428cn_flake_nix --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos
    nb81r5xf94vspln6c4p9ahki3y4mn7yx8_module_nix --> nb81r5xf94vspln6c4p9ahki3y4mn7yx8_lib_make_disk_image_nix
    nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops --> nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops_templates
    nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops --> nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops_secrets_for_users
    ngcl762dwgw4ya065m382kgsvg3jwmbsl_nixos --> ngcl762dwgw4ya065m382kgsvg3jwmbsl_nixos_common_nix
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_configurations_nixos --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_modules_docker_nix
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_configurations_nixos --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_modules_headlamp_nix
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_configurations_nixos --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_modules_tmux_nix
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_disk_configuration_nix
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_boot_nix
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_desktop_nix
    npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos --> npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_persistence_nix
    style nzaqk04gg87wx5rfjcd1j76zy2wc428cn_flake_nix fill:#c0e5b2,color:#000000
    style nb81r5xf94vspln6c4p9ahki3y4mn7yx8_module_nix fill:#e5b2dc,color:#000000
    style nb81r5xf94vspln6c4p9ahki3y4mn7yx8_lib_make_disk_image_nix fill:#e5b2dc,color:#000000
    style nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops fill:#c2b2e5,color:#000000
    style nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops_templates fill:#c2b2e5,color:#000000
    style nczikx518ir0jmhqn8ljm56yy4a7shrmb_modules_sops_secrets_for_users fill:#c2b2e5,color:#000000
    style ngcl762dwgw4ya065m382kgsvg3jwmbsl_nixos fill:#b2e5d7,color:#000000
    style ngcl762dwgw4ya065m382kgsvg3jwmbsl_nixos_common_nix fill:#b2e5d7,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_global_nix fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_configurations_nixos fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_modules_docker_nix fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_modules_headlamp_nix fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_modules_tmux_nix fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_boot_nix fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_desktop_nix fill:#b2e5c2,color:#000000
    style npgv3f8anwgdg3042d2bq5i23k8ykc1y3_machines_nixos_virtualbox_nixos_persistence_nix fill:#b2e5c2,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    nn9fykdxrshy5brz7afm1hbn4pv0ifdld_flake_nix["`**flake.nix**

_n9fykdxrshy5brz7afm1hbn4pv0ifdld_`"]
    n9a3c461dkq3va4r3bnwhgpp1cympl8b6_module_nix["`**module.nix**

_9a3c461dkq3va4r3bnwhgpp1cympl8b6_`"]
    n9a3c461dkq3va4r3bnwhgpp1cympl8b6_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_9a3c461dkq3va4r3bnwhgpp1cympl8b6_`"]
    n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops["`**modules/sops**

_9np6r5czqxq4s03yb1af6hcj8gk103gb_`"]
    n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops_templates["`**modules/sops/templates**

_9np6r5czqxq4s03yb1af6hcj8gk103gb_`"]
    n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_9np6r5czqxq4s03yb1af6hcj8gk103gb_`"]
    ngxzanfan8spqj2kvsrrf3apnslm8q0mh_nixos["`**nixos**

_gxzanfan8spqj2kvsrrf3apnslm8q0mh_`"]
    ngxzanfan8spqj2kvsrrf3apnslm8q0mh_nixos_common_nix["`**nixos/common.nix**

_gxzanfan8spqj2kvsrrf3apnslm8q0mh_`"]
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_global_nix["`**global.nix**

_b2553va6lcyj1q2jbi6d9mdc2fq6zxbm_`"]
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_configurations_nixos["`**configurations/nixos**

_b2553va6lcyj1q2jbi6d9mdc2fq6zxbm_`"]
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_modules_docker_nix["`**modules/docker.nix**

_b2553va6lcyj1q2jbi6d9mdc2fq6zxbm_`"]
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_modules_headlamp_nix["`**modules/headlamp.nix**

_b2553va6lcyj1q2jbi6d9mdc2fq6zxbm_`"]
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_modules_tmux_nix["`**modules/tmux.nix**

_b2553va6lcyj1q2jbi6d9mdc2fq6zxbm_`"]
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_b2553va6lcyj1q2jbi6d9mdc2fq6zxbm_`"]
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_b2553va6lcyj1q2jbi6d9mdc2fq6zxbm_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules["`**modules**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_build_tarball_nix["`**modules/build-tarball.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_interop_nix["`**modules/interop.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_recovery_nix["`**modules/recovery.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd["`**modules/systemd**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd_native["`**modules/systemd/native**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_usbip_nix["`**modules/usbip.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_version_nix["`**modules/version.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_welcome_nix["`**modules/welcome.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_z633q0vd8vxyf346pa5l6vqvrnh5a747_`"]
    nn9fykdxrshy5brz7afm1hbn4pv0ifdld_flake_nix --> n9a3c461dkq3va4r3bnwhgpp1cympl8b6_module_nix
    nn9fykdxrshy5brz7afm1hbn4pv0ifdld_flake_nix --> n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops
    nn9fykdxrshy5brz7afm1hbn4pv0ifdld_flake_nix --> ngxzanfan8spqj2kvsrrf3apnslm8q0mh_nixos
    nn9fykdxrshy5brz7afm1hbn4pv0ifdld_flake_nix --> nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_global_nix
    nn9fykdxrshy5brz7afm1hbn4pv0ifdld_flake_nix --> nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_configurations_nixos
    nn9fykdxrshy5brz7afm1hbn4pv0ifdld_flake_nix --> nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_machines_nixos_wsl_nixos
    n9a3c461dkq3va4r3bnwhgpp1cympl8b6_module_nix --> n9a3c461dkq3va4r3bnwhgpp1cympl8b6_lib_make_disk_image_nix
    n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops --> n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops_templates
    n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops --> n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops_secrets_for_users
    ngxzanfan8spqj2kvsrrf3apnslm8q0mh_nixos --> ngxzanfan8spqj2kvsrrf3apnslm8q0mh_nixos_common_nix
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_configurations_nixos --> nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_modules_docker_nix
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_configurations_nixos --> nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_modules_headlamp_nix
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_configurations_nixos --> nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_modules_tmux_nix
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_machines_nixos_wsl_nixos --> nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_machines_nixos_wsl_nixos_hardware_configuration_nix
    nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_machines_nixos_wsl_nixos --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_build_tarball_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_docker_desktop_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_interop_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_recovery_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_ssh_agent_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_usbip_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_version_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_welcome_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_wsl_conf_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_wsl_distro_nix
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd_native
    nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd_native --> nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd_native_wrap_shell_nix
    style nn9fykdxrshy5brz7afm1hbn4pv0ifdld_flake_nix fill:#b2d0e5,color:#000000
    style n9a3c461dkq3va4r3bnwhgpp1cympl8b6_module_nix fill:#c0b2e5,color:#000000
    style n9a3c461dkq3va4r3bnwhgpp1cympl8b6_lib_make_disk_image_nix fill:#c0b2e5,color:#000000
    style n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops fill:#b2e5df,color:#000000
    style n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops_templates fill:#b2e5df,color:#000000
    style n9np6r5czqxq4s03yb1af6hcj8gk103gb_modules_sops_secrets_for_users fill:#b2e5df,color:#000000
    style ngxzanfan8spqj2kvsrrf3apnslm8q0mh_nixos fill:#b2dde5,color:#000000
    style ngxzanfan8spqj2kvsrrf3apnslm8q0mh_nixos_common_nix fill:#b2dde5,color:#000000
    style nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_global_nix fill:#b2cbe5,color:#000000
    style nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_configurations_nixos fill:#b2cbe5,color:#000000
    style nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_modules_docker_nix fill:#b2cbe5,color:#000000
    style nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_modules_headlamp_nix fill:#b2cbe5,color:#000000
    style nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_modules_tmux_nix fill:#b2cbe5,color:#000000
    style nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_machines_nixos_wsl_nixos fill:#b2cbe5,color:#000000
    style nb2553va6lcyj1q2jbi6d9mdc2fq6zxbm_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#b2cbe5,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_build_tarball_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_docker_desktop_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_interop_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_recovery_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_ssh_agent_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd_native fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_systemd_native_wrap_shell_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_usbip_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_version_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_welcome_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_wsl_conf_nix fill:#e0e5b2,color:#000000
    style nz633q0vd8vxyf346pa5l6vqvrnh5a747_modules_wsl_distro_nix fill:#e0e5b2,color:#000000
```
