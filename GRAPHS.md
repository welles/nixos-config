# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    ni4i6ydpzir3r24l9ij0ffavccrppwly9_flake_nix["`**flake.nix**

_i4i6ydpzir3r24l9ij0ffavccrppwly9_`"]
    nqz016x87gnmpg4daqw0r0cksjcw6bsn5_module_nix["`**module.nix**

_qz016x87gnmpg4daqw0r0cksjcw6bsn5_`"]
    nqz016x87gnmpg4daqw0r0cksjcw6bsn5_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_qz016x87gnmpg4daqw0r0cksjcw6bsn5_`"]
    nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops["`**modules/sops**

_xbwnsf410bxgv0ch0zx94ix0hk9zfzwl_`"]
    nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops_templates["`**modules/sops/templates**

_xbwnsf410bxgv0ch0zx94ix0hk9zfzwl_`"]
    nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_xbwnsf410bxgv0ch0zx94ix0hk9zfzwl_`"]
    nv7axdg33b77bsb4qzkxk4vgjx4v2j4fa_nixos["`**nixos**

_v7axdg33b77bsb4qzkxk4vgjx4v2j4fa_`"]
    nv7axdg33b77bsb4qzkxk4vgjx4v2j4fa_nixos_common_nix["`**nixos/common.nix**

_v7axdg33b77bsb4qzkxk4vgjx4v2j4fa_`"]
    npgv0202qckqrz2rph1fb380qdsc9ha2l_global_nix["`**global.nix**

_pgv0202qckqrz2rph1fb380qdsc9ha2l_`"]
    npgv0202qckqrz2rph1fb380qdsc9ha2l_configurations_eltern["`**configurations/eltern**

_pgv0202qckqrz2rph1fb380qdsc9ha2l_`"]
    npgv0202qckqrz2rph1fb380qdsc9ha2l_modules_networkmanager_nix["`**modules/networkmanager.nix**

_pgv0202qckqrz2rph1fb380qdsc9ha2l_`"]
    npgv0202qckqrz2rph1fb380qdsc9ha2l_modules_avahi_nix["`**modules/avahi.nix**

_pgv0202qckqrz2rph1fb380qdsc9ha2l_`"]
    npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_pgv0202qckqrz2rph1fb380qdsc9ha2l_`"]
    npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_pgv0202qckqrz2rph1fb380qdsc9ha2l_`"]
    ni4i6ydpzir3r24l9ij0ffavccrppwly9_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_i4i6ydpzir3r24l9ij0ffavccrppwly9_`"]
    npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_pgv0202qckqrz2rph1fb380qdsc9ha2l_`"]
    ni4i6ydpzir3r24l9ij0ffavccrppwly9_flake_nix --> nqz016x87gnmpg4daqw0r0cksjcw6bsn5_module_nix
    ni4i6ydpzir3r24l9ij0ffavccrppwly9_flake_nix --> nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops
    ni4i6ydpzir3r24l9ij0ffavccrppwly9_flake_nix --> nv7axdg33b77bsb4qzkxk4vgjx4v2j4fa_nixos
    ni4i6ydpzir3r24l9ij0ffavccrppwly9_flake_nix --> npgv0202qckqrz2rph1fb380qdsc9ha2l_global_nix
    ni4i6ydpzir3r24l9ij0ffavccrppwly9_flake_nix --> npgv0202qckqrz2rph1fb380qdsc9ha2l_configurations_eltern
    ni4i6ydpzir3r24l9ij0ffavccrppwly9_flake_nix --> npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos
    nqz016x87gnmpg4daqw0r0cksjcw6bsn5_module_nix --> nqz016x87gnmpg4daqw0r0cksjcw6bsn5_lib_make_disk_image_nix
    nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops --> nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops_templates
    nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops --> nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops_secrets_for_users
    nv7axdg33b77bsb4qzkxk4vgjx4v2j4fa_nixos --> nv7axdg33b77bsb4qzkxk4vgjx4v2j4fa_nixos_common_nix
    npgv0202qckqrz2rph1fb380qdsc9ha2l_configurations_eltern --> npgv0202qckqrz2rph1fb380qdsc9ha2l_modules_networkmanager_nix
    npgv0202qckqrz2rph1fb380qdsc9ha2l_configurations_eltern --> npgv0202qckqrz2rph1fb380qdsc9ha2l_modules_avahi_nix
    npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos --> npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos_hardware_configuration_nix
    npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos --> npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos_disk_configuration_nix
    npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos_hardware_configuration_nix --> ni4i6ydpzir3r24l9ij0ffavccrppwly9_nixos_modules_installer_scan_not_detected_nix
    style ni4i6ydpzir3r24l9ij0ffavccrppwly9_flake_nix fill:#bbb2e5,color:#000000
    style nqz016x87gnmpg4daqw0r0cksjcw6bsn5_module_nix fill:#b2e5d1,color:#000000
    style nqz016x87gnmpg4daqw0r0cksjcw6bsn5_lib_make_disk_image_nix fill:#b2e5d1,color:#000000
    style nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops fill:#d2e5b2,color:#000000
    style nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops_templates fill:#d2e5b2,color:#000000
    style nxbwnsf410bxgv0ch0zx94ix0hk9zfzwl_modules_sops_secrets_for_users fill:#d2e5b2,color:#000000
    style nv7axdg33b77bsb4qzkxk4vgjx4v2j4fa_nixos fill:#c0b2e5,color:#000000
    style nv7axdg33b77bsb4qzkxk4vgjx4v2j4fa_nixos_common_nix fill:#c0b2e5,color:#000000
    style npgv0202qckqrz2rph1fb380qdsc9ha2l_global_nix fill:#b2e5cd,color:#000000
    style npgv0202qckqrz2rph1fb380qdsc9ha2l_configurations_eltern fill:#b2e5cd,color:#000000
    style npgv0202qckqrz2rph1fb380qdsc9ha2l_modules_networkmanager_nix fill:#b2e5cd,color:#000000
    style npgv0202qckqrz2rph1fb380qdsc9ha2l_modules_avahi_nix fill:#b2e5cd,color:#000000
    style npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos fill:#b2e5cd,color:#000000
    style npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos_hardware_configuration_nix fill:#b2e5cd,color:#000000
    style ni4i6ydpzir3r24l9ij0ffavccrppwly9_nixos_modules_installer_scan_not_detected_nix fill:#bbb2e5,color:#000000
    style npgv0202qckqrz2rph1fb380qdsc9ha2l_machines_eltern_asus_nixos_disk_configuration_nix fill:#b2e5cd,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    nkyrwh0i04s7ppyk28ph98qwycv9hb79i_flake_nix["`**flake.nix**

_kyrwh0i04s7ppyk28ph98qwycv9hb79i_`"]
    nd2bkaqmhv0ald4w1nm704i8pnivgs12h_module_nix["`**module.nix**

_d2bkaqmhv0ald4w1nm704i8pnivgs12h_`"]
    nd2bkaqmhv0ald4w1nm704i8pnivgs12h_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_d2bkaqmhv0ald4w1nm704i8pnivgs12h_`"]
    npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops["`**modules/sops**

_pfp7xipkpvxmdnda1lnqdcsjznni3zcb_`"]
    npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops_templates["`**modules/sops/templates**

_pfp7xipkpvxmdnda1lnqdcsjznni3zcb_`"]
    npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_pfp7xipkpvxmdnda1lnqdcsjznni3zcb_`"]
    nl5pgy75gg0v513cvm6jv1ibyw8xwnyqp_nixos["`**nixos**

_l5pgy75gg0v513cvm6jv1ibyw8xwnyqp_`"]
    nl5pgy75gg0v513cvm6jv1ibyw8xwnyqp_nixos_common_nix["`**nixos/common.nix**

_l5pgy75gg0v513cvm6jv1ibyw8xwnyqp_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_global_nix["`**global.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch["`**configurations/schokoladenelch**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_docker_nix["`**modules/docker.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_networkmanager_nix["`**modules/networkmanager.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_tmux_nix["`**modules/tmux.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_check_mkv["`**modules/scripts/check-mkv**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_create_zfs_dataset["`**modules/scripts/create-zfs-dataset**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_stacks_default_nix["`**modules/stacks/default.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nkyrwh0i04s7ppyk28ph98qwycv9hb79i_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_kyrwh0i04s7ppyk28ph98qwycv9hb79i_`"]
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_z2lwbwa52zasja1hxwnnrblmmqns7w6f_`"]
    nkyrwh0i04s7ppyk28ph98qwycv9hb79i_flake_nix --> nd2bkaqmhv0ald4w1nm704i8pnivgs12h_module_nix
    nkyrwh0i04s7ppyk28ph98qwycv9hb79i_flake_nix --> npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops
    nkyrwh0i04s7ppyk28ph98qwycv9hb79i_flake_nix --> nl5pgy75gg0v513cvm6jv1ibyw8xwnyqp_nixos
    nkyrwh0i04s7ppyk28ph98qwycv9hb79i_flake_nix --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_global_nix
    nkyrwh0i04s7ppyk28ph98qwycv9hb79i_flake_nix --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch
    nkyrwh0i04s7ppyk28ph98qwycv9hb79i_flake_nix --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos
    nd2bkaqmhv0ald4w1nm704i8pnivgs12h_module_nix --> nd2bkaqmhv0ald4w1nm704i8pnivgs12h_lib_make_disk_image_nix
    npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops --> npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops_templates
    npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops --> npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops_secrets_for_users
    nl5pgy75gg0v513cvm6jv1ibyw8xwnyqp_nixos --> nl5pgy75gg0v513cvm6jv1ibyw8xwnyqp_nixos_common_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_docker_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_networkmanager_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_tmux_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_check_mkv
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_create_zfs_dataset
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_zfs_manual_snapshot
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_zfs_snapshot_diff
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_boot_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_networking_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_services_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_persistence_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_stacks_default_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos --> nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> nkyrwh0i04s7ppyk28ph98qwycv9hb79i_nixos_modules_installer_scan_not_detected_nix
    style nkyrwh0i04s7ppyk28ph98qwycv9hb79i_flake_nix fill:#e5dcb2,color:#000000
    style nd2bkaqmhv0ald4w1nm704i8pnivgs12h_module_nix fill:#b2e5db,color:#000000
    style nd2bkaqmhv0ald4w1nm704i8pnivgs12h_lib_make_disk_image_nix fill:#b2e5db,color:#000000
    style npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops fill:#e5b2d1,color:#000000
    style npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops_templates fill:#e5b2d1,color:#000000
    style npfp7xipkpvxmdnda1lnqdcsjznni3zcb_modules_sops_secrets_for_users fill:#e5b2d1,color:#000000
    style nl5pgy75gg0v513cvm6jv1ibyw8xwnyqp_nixos fill:#e5d6b2,color:#000000
    style nl5pgy75gg0v513cvm6jv1ibyw8xwnyqp_nixos_common_nix fill:#e5d6b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_global_nix fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_docker_nix fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_networkmanager_nix fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_tmux_nix fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_check_mkv fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_create_zfs_dataset fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_zfs_manual_snapshot fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_scripts_zfs_snapshot_diff fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_boot_nix fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_networking_nix fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_services_nix fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_configurations_schokoladenelch_persistence_nix fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_modules_stacks_default_nix fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos fill:#c4e5b2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#c4e5b2,color:#000000
    style nkyrwh0i04s7ppyk28ph98qwycv9hb79i_nixos_modules_installer_scan_not_detected_nix fill:#e5dcb2,color:#000000
    style nz2lwbwa52zasja1hxwnnrblmmqns7w6f_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#c4e5b2,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    ns2sk6ds0k88p3cia2v98h73wc7iigkfi_flake_nix["`**flake.nix**

_s2sk6ds0k88p3cia2v98h73wc7iigkfi_`"]
    ndph8sqhi2dkw49rz1n11f5306hsdp5ng_module_nix["`**module.nix**

_dph8sqhi2dkw49rz1n11f5306hsdp5ng_`"]
    ndph8sqhi2dkw49rz1n11f5306hsdp5ng_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_dph8sqhi2dkw49rz1n11f5306hsdp5ng_`"]
    nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops["`**modules/sops**

_xsgw213ahcnzpgv8fld61amvlghfg9hf_`"]
    nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops_templates["`**modules/sops/templates**

_xsgw213ahcnzpgv8fld61amvlghfg9hf_`"]
    nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_xsgw213ahcnzpgv8fld61amvlghfg9hf_`"]
    n3bkg74qdmgv0qjkhgwk49amlgnsscyqj_nixos["`**nixos**

_3bkg74qdmgv0qjkhgwk49amlgnsscyqj_`"]
    n3bkg74qdmgv0qjkhgwk49amlgnsscyqj_nixos_common_nix["`**nixos/common.nix**

_3bkg74qdmgv0qjkhgwk49amlgnsscyqj_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_global_nix["`**global.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico["`**configurations/nico**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_docker_nix["`**modules/docker.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_networkmanager_nix["`**modules/networkmanager.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_pipewire_nix["`**modules/pipewire.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_services_nix["`**configurations/nico/services.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_avahi_nix["`**modules/avahi.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    ns2sk6ds0k88p3cia2v98h73wc7iigkfi_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_s2sk6ds0k88p3cia2v98h73wc7iigkfi_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_eden_nix["`**modules/eden.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_kap9bzlb12kh8xfish3c39r8jlkr65sh_`"]
    ns2sk6ds0k88p3cia2v98h73wc7iigkfi_flake_nix --> ndph8sqhi2dkw49rz1n11f5306hsdp5ng_module_nix
    ns2sk6ds0k88p3cia2v98h73wc7iigkfi_flake_nix --> nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops
    ns2sk6ds0k88p3cia2v98h73wc7iigkfi_flake_nix --> n3bkg74qdmgv0qjkhgwk49amlgnsscyqj_nixos
    ns2sk6ds0k88p3cia2v98h73wc7iigkfi_flake_nix --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_global_nix
    ns2sk6ds0k88p3cia2v98h73wc7iigkfi_flake_nix --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico
    ns2sk6ds0k88p3cia2v98h73wc7iigkfi_flake_nix --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos
    ndph8sqhi2dkw49rz1n11f5306hsdp5ng_module_nix --> ndph8sqhi2dkw49rz1n11f5306hsdp5ng_lib_make_disk_image_nix
    nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops --> nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops_templates
    nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops --> nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops_secrets_for_users
    n3bkg74qdmgv0qjkhgwk49amlgnsscyqj_nixos --> n3bkg74qdmgv0qjkhgwk49amlgnsscyqj_nixos_common_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_docker_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_networkmanager_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_boot_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_desktop_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_audio_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_virtualisation_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_services_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_packages_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_rclone_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_audio_nix --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_pipewire_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_services_nix --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_avahi_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos_hardware_configuration_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_eden_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos --> nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_xone_dongle_nix
    nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos_hardware_configuration_nix --> ns2sk6ds0k88p3cia2v98h73wc7iigkfi_nixos_modules_installer_scan_not_detected_nix
    style ns2sk6ds0k88p3cia2v98h73wc7iigkfi_flake_nix fill:#e5d2b2,color:#000000
    style ndph8sqhi2dkw49rz1n11f5306hsdp5ng_module_nix fill:#b2e5d5,color:#000000
    style ndph8sqhi2dkw49rz1n11f5306hsdp5ng_lib_make_disk_image_nix fill:#b2e5d5,color:#000000
    style nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops fill:#bbe5b2,color:#000000
    style nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops_templates fill:#bbe5b2,color:#000000
    style nxsgw213ahcnzpgv8fld61amvlghfg9hf_modules_sops_secrets_for_users fill:#bbe5b2,color:#000000
    style n3bkg74qdmgv0qjkhgwk49amlgnsscyqj_nixos fill:#b2b7e5,color:#000000
    style n3bkg74qdmgv0qjkhgwk49amlgnsscyqj_nixos_common_nix fill:#b2b7e5,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_global_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_docker_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_networkmanager_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_boot_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_desktop_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_audio_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_pipewire_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_virtualisation_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_services_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_avahi_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_packages_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_configurations_nico_rclone_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#b2e5dd,color:#000000
    style ns2sk6ds0k88p3cia2v98h73wc7iigkfi_nixos_modules_installer_scan_not_detected_nix fill:#e5d2b2,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_eden_nix fill:#b2e5dd,color:#000000
    style nkap9bzlb12kh8xfish3c39r8jlkr65sh_modules_xone_dongle_nix fill:#b2e5dd,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    nld40m6a4aqq4n3xfb32vc5liza33hxx2_flake_nix["`**flake.nix**

_ld40m6a4aqq4n3xfb32vc5liza33hxx2_`"]
    nbcbpgvrv1xgv6jsgqadmqanj4d0vqxl3_module_nix["`**module.nix**

_bcbpgvrv1xgv6jsgqadmqanj4d0vqxl3_`"]
    nbcbpgvrv1xgv6jsgqadmqanj4d0vqxl3_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_bcbpgvrv1xgv6jsgqadmqanj4d0vqxl3_`"]
    nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops["`**modules/sops**

_n16mm75bp3j7k0iiyzsqhw4g9jhi5acx_`"]
    nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops_templates["`**modules/sops/templates**

_n16mm75bp3j7k0iiyzsqhw4g9jhi5acx_`"]
    nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_n16mm75bp3j7k0iiyzsqhw4g9jhi5acx_`"]
    n7xg1qd4b5kvwijlwq4lxn1nfn9asb018_nixos["`**nixos**

_7xg1qd4b5kvwijlwq4lxn1nfn9asb018_`"]
    n7xg1qd4b5kvwijlwq4lxn1nfn9asb018_nixos_common_nix["`**nixos/common.nix**

_7xg1qd4b5kvwijlwq4lxn1nfn9asb018_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_global_nix["`**global.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico["`**configurations/nico**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_docker_nix["`**modules/docker.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_networkmanager_nix["`**modules/networkmanager.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_pipewire_nix["`**modules/pipewire.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_services_nix["`**configurations/nico/services.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_avahi_nix["`**modules/avahi.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nld40m6a4aqq4n3xfb32vc5liza33hxx2_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_ld40m6a4aqq4n3xfb32vc5liza33hxx2_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_disk_configuration_nix["`**machines/nico-thinkpad-nixos/disk-configuration.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_impermanence_nix["`**machines/nico-thinkpad-nixos/impermanence.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_fy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_`"]
    nld40m6a4aqq4n3xfb32vc5liza33hxx2_flake_nix --> nbcbpgvrv1xgv6jsgqadmqanj4d0vqxl3_module_nix
    nld40m6a4aqq4n3xfb32vc5liza33hxx2_flake_nix --> nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops
    nld40m6a4aqq4n3xfb32vc5liza33hxx2_flake_nix --> n7xg1qd4b5kvwijlwq4lxn1nfn9asb018_nixos
    nld40m6a4aqq4n3xfb32vc5liza33hxx2_flake_nix --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_global_nix
    nld40m6a4aqq4n3xfb32vc5liza33hxx2_flake_nix --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico
    nld40m6a4aqq4n3xfb32vc5liza33hxx2_flake_nix --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos
    nbcbpgvrv1xgv6jsgqadmqanj4d0vqxl3_module_nix --> nbcbpgvrv1xgv6jsgqadmqanj4d0vqxl3_lib_make_disk_image_nix
    nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops --> nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops_templates
    nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops --> nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops_secrets_for_users
    n7xg1qd4b5kvwijlwq4lxn1nfn9asb018_nixos --> n7xg1qd4b5kvwijlwq4lxn1nfn9asb018_nixos_common_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_docker_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_networkmanager_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_boot_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_desktop_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_audio_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_virtualisation_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_services_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_packages_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_rclone_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_audio_nix --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_pipewire_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_services_nix --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_avahi_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_hardware_configuration_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_disk_configuration_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_impermanence_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos --> nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_mobile_network_nix
    nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_hardware_configuration_nix --> nld40m6a4aqq4n3xfb32vc5liza33hxx2_nixos_modules_installer_scan_not_detected_nix
    style nld40m6a4aqq4n3xfb32vc5liza33hxx2_flake_nix fill:#b2c7e5,color:#000000
    style nbcbpgvrv1xgv6jsgqadmqanj4d0vqxl3_module_nix fill:#e5b2b5,color:#000000
    style nbcbpgvrv1xgv6jsgqadmqanj4d0vqxl3_lib_make_disk_image_nix fill:#e5b2b5,color:#000000
    style nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops fill:#e5b2c6,color:#000000
    style nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops_templates fill:#e5b2c6,color:#000000
    style nn16mm75bp3j7k0iiyzsqhw4g9jhi5acx_modules_sops_secrets_for_users fill:#e5b2c6,color:#000000
    style n7xg1qd4b5kvwijlwq4lxn1nfn9asb018_nixos fill:#b7b2e5,color:#000000
    style n7xg1qd4b5kvwijlwq4lxn1nfn9asb018_nixos_common_nix fill:#b7b2e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_global_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_docker_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_networkmanager_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_boot_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_desktop_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_audio_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_pipewire_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_virtualisation_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_services_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_modules_avahi_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_packages_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_configurations_nico_rclone_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#b2c5e5,color:#000000
    style nld40m6a4aqq4n3xfb32vc5liza33hxx2_nixos_modules_installer_scan_not_detected_nix fill:#b2c7e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_disk_configuration_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_impermanence_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#b2c5e5,color:#000000
    style nfy7dy7wrpvqc44cc64qkdpg4gfzyfzdf_machines_nico_thinkpad_nixos_mobile_network_nix fill:#b2c5e5,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    n8wflkb0j0dp18gfyccvqyaxk9mgp4m5m_flake_nix["`**flake.nix**

_8wflkb0j0dp18gfyccvqyaxk9mgp4m5m_`"]
    n5bcnynq39984w4bd8f917lknqfipvnr7_module_nix["`**module.nix**

_5bcnynq39984w4bd8f917lknqfipvnr7_`"]
    n5bcnynq39984w4bd8f917lknqfipvnr7_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_5bcnynq39984w4bd8f917lknqfipvnr7_`"]
    nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops["`**modules/sops**

_xf3r76yr3n0ybg2q03wgs288nzbk3acf_`"]
    nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops_templates["`**modules/sops/templates**

_xf3r76yr3n0ybg2q03wgs288nzbk3acf_`"]
    nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_xf3r76yr3n0ybg2q03wgs288nzbk3acf_`"]
    nv3y1qc7ggys2sggv4bngy62bccvrzbk1_nixos["`**nixos**

_v3y1qc7ggys2sggv4bngy62bccvrzbk1_`"]
    nv3y1qc7ggys2sggv4bngy62bccvrzbk1_nixos_common_nix["`**nixos/common.nix**

_v3y1qc7ggys2sggv4bngy62bccvrzbk1_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_global_nix["`**global.nix**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_configurations_nixos["`**configurations/nixos**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_modules_docker_nix["`**modules/docker.nix**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_modules_headlamp_nix["`**modules/headlamp.nix**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_modules_tmux_nix["`**modules/tmux.nix**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_1gi47inybsajh3kksgp6yyrfq680b90a_`"]
    n8wflkb0j0dp18gfyccvqyaxk9mgp4m5m_flake_nix --> n5bcnynq39984w4bd8f917lknqfipvnr7_module_nix
    n8wflkb0j0dp18gfyccvqyaxk9mgp4m5m_flake_nix --> nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops
    n8wflkb0j0dp18gfyccvqyaxk9mgp4m5m_flake_nix --> nv3y1qc7ggys2sggv4bngy62bccvrzbk1_nixos
    n8wflkb0j0dp18gfyccvqyaxk9mgp4m5m_flake_nix --> n1gi47inybsajh3kksgp6yyrfq680b90a_global_nix
    n8wflkb0j0dp18gfyccvqyaxk9mgp4m5m_flake_nix --> n1gi47inybsajh3kksgp6yyrfq680b90a_configurations_nixos
    n8wflkb0j0dp18gfyccvqyaxk9mgp4m5m_flake_nix --> n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos
    n5bcnynq39984w4bd8f917lknqfipvnr7_module_nix --> n5bcnynq39984w4bd8f917lknqfipvnr7_lib_make_disk_image_nix
    nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops --> nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops_templates
    nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops --> nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops_secrets_for_users
    nv3y1qc7ggys2sggv4bngy62bccvrzbk1_nixos --> nv3y1qc7ggys2sggv4bngy62bccvrzbk1_nixos_common_nix
    n1gi47inybsajh3kksgp6yyrfq680b90a_configurations_nixos --> n1gi47inybsajh3kksgp6yyrfq680b90a_modules_docker_nix
    n1gi47inybsajh3kksgp6yyrfq680b90a_configurations_nixos --> n1gi47inybsajh3kksgp6yyrfq680b90a_modules_headlamp_nix
    n1gi47inybsajh3kksgp6yyrfq680b90a_configurations_nixos --> n1gi47inybsajh3kksgp6yyrfq680b90a_modules_tmux_nix
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos --> n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos --> n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_disk_configuration_nix
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos --> n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_boot_nix
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos --> n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_desktop_nix
    n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos --> n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_persistence_nix
    style n8wflkb0j0dp18gfyccvqyaxk9mgp4m5m_flake_nix fill:#e5d3b2,color:#000000
    style n5bcnynq39984w4bd8f917lknqfipvnr7_module_nix fill:#e5b2c0,color:#000000
    style n5bcnynq39984w4bd8f917lknqfipvnr7_lib_make_disk_image_nix fill:#e5b2c0,color:#000000
    style nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops fill:#b2b6e5,color:#000000
    style nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops_templates fill:#b2b6e5,color:#000000
    style nxf3r76yr3n0ybg2q03wgs288nzbk3acf_modules_sops_secrets_for_users fill:#b2b6e5,color:#000000
    style nv3y1qc7ggys2sggv4bngy62bccvrzbk1_nixos fill:#b2c6e5,color:#000000
    style nv3y1qc7ggys2sggv4bngy62bccvrzbk1_nixos_common_nix fill:#b2c6e5,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_global_nix fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_configurations_nixos fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_modules_docker_nix fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_modules_headlamp_nix fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_modules_tmux_nix fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_boot_nix fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_desktop_nix fill:#e5bbb2,color:#000000
    style n1gi47inybsajh3kksgp6yyrfq680b90a_machines_nixos_virtualbox_nixos_persistence_nix fill:#e5bbb2,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    n0832rkvlp24svvrkvzmckf51njdkpnzh_flake_nix["`**flake.nix**

_0832rkvlp24svvrkvzmckf51njdkpnzh_`"]
    niniqplc0vmspn539m3yhnfri7fnn38jw_module_nix["`**module.nix**

_iniqplc0vmspn539m3yhnfri7fnn38jw_`"]
    niniqplc0vmspn539m3yhnfri7fnn38jw_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_iniqplc0vmspn539m3yhnfri7fnn38jw_`"]
    nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops["`**modules/sops**

_b4ffv02421wwbcigmam2z2qkk4mz9v72_`"]
    nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops_templates["`**modules/sops/templates**

_b4ffv02421wwbcigmam2z2qkk4mz9v72_`"]
    nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_b4ffv02421wwbcigmam2z2qkk4mz9v72_`"]
    nalzmf02p8fjpdq5mrz839bn5yil4280a_nixos["`**nixos**

_alzmf02p8fjpdq5mrz839bn5yil4280a_`"]
    nalzmf02p8fjpdq5mrz839bn5yil4280a_nixos_common_nix["`**nixos/common.nix**

_alzmf02p8fjpdq5mrz839bn5yil4280a_`"]
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_global_nix["`**global.nix**

_caxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_`"]
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_configurations_nixos["`**configurations/nixos**

_caxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_`"]
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_modules_docker_nix["`**modules/docker.nix**

_caxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_`"]
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_modules_headlamp_nix["`**modules/headlamp.nix**

_caxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_`"]
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_modules_tmux_nix["`**modules/tmux.nix**

_caxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_`"]
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_caxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_`"]
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_caxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules["`**modules**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_build_tarball_nix["`**modules/build-tarball.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_interop_nix["`**modules/interop.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_recovery_nix["`**modules/recovery.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd["`**modules/systemd**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd_native["`**modules/systemd/native**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_usbip_nix["`**modules/usbip.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_version_nix["`**modules/version.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_welcome_nix["`**modules/welcome.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_yghfpm7ipy9i64cxcp428wfs7svnfica_`"]
    n0832rkvlp24svvrkvzmckf51njdkpnzh_flake_nix --> niniqplc0vmspn539m3yhnfri7fnn38jw_module_nix
    n0832rkvlp24svvrkvzmckf51njdkpnzh_flake_nix --> nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops
    n0832rkvlp24svvrkvzmckf51njdkpnzh_flake_nix --> nalzmf02p8fjpdq5mrz839bn5yil4280a_nixos
    n0832rkvlp24svvrkvzmckf51njdkpnzh_flake_nix --> ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_global_nix
    n0832rkvlp24svvrkvzmckf51njdkpnzh_flake_nix --> ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_configurations_nixos
    n0832rkvlp24svvrkvzmckf51njdkpnzh_flake_nix --> ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_machines_nixos_wsl_nixos
    niniqplc0vmspn539m3yhnfri7fnn38jw_module_nix --> niniqplc0vmspn539m3yhnfri7fnn38jw_lib_make_disk_image_nix
    nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops --> nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops_templates
    nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops --> nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops_secrets_for_users
    nalzmf02p8fjpdq5mrz839bn5yil4280a_nixos --> nalzmf02p8fjpdq5mrz839bn5yil4280a_nixos_common_nix
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_configurations_nixos --> ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_modules_docker_nix
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_configurations_nixos --> ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_modules_headlamp_nix
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_configurations_nixos --> ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_modules_tmux_nix
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_machines_nixos_wsl_nixos --> ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_machines_nixos_wsl_nixos_hardware_configuration_nix
    ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_machines_nixos_wsl_nixos --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_build_tarball_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_docker_desktop_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_interop_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_recovery_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_ssh_agent_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_usbip_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_version_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_welcome_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_wsl_conf_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_wsl_distro_nix
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd_native
    nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd_native --> nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd_native_wrap_shell_nix
    style n0832rkvlp24svvrkvzmckf51njdkpnzh_flake_nix fill:#c8b2e5,color:#000000
    style niniqplc0vmspn539m3yhnfri7fnn38jw_module_nix fill:#b7b2e5,color:#000000
    style niniqplc0vmspn539m3yhnfri7fnn38jw_lib_make_disk_image_nix fill:#b7b2e5,color:#000000
    style nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops fill:#b6e5b2,color:#000000
    style nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops_templates fill:#b6e5b2,color:#000000
    style nb4ffv02421wwbcigmam2z2qkk4mz9v72_modules_sops_secrets_for_users fill:#b6e5b2,color:#000000
    style nalzmf02p8fjpdq5mrz839bn5yil4280a_nixos fill:#bbe5b2,color:#000000
    style nalzmf02p8fjpdq5mrz839bn5yil4280a_nixos_common_nix fill:#bbe5b2,color:#000000
    style ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_global_nix fill:#b2bce5,color:#000000
    style ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_configurations_nixos fill:#b2bce5,color:#000000
    style ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_modules_docker_nix fill:#b2bce5,color:#000000
    style ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_modules_headlamp_nix fill:#b2bce5,color:#000000
    style ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_modules_tmux_nix fill:#b2bce5,color:#000000
    style ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_machines_nixos_wsl_nixos fill:#b2bce5,color:#000000
    style ncaxzlpdjh7xnw1jwf4hzsp3y2fcy11l8_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#b2bce5,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_build_tarball_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_docker_desktop_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_interop_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_recovery_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_ssh_agent_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd_native fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_systemd_native_wrap_shell_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_usbip_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_version_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_welcome_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_wsl_conf_nix fill:#e5b2e1,color:#000000
    style nyghfpm7ipy9i64cxcp428wfs7svnfica_modules_wsl_distro_nix fill:#e5b2e1,color:#000000
```
