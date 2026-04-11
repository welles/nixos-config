# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    ngxa99lcqqsdlinm9s2d49i978y1kapl2_flake_nix["`**flake.nix**

_gxa99lcqqsdlinm9s2d49i978y1kapl2_`"]
    n4ydpzwjq2mwk7bb82r1sbr31nakbm7l6_module_nix["`**module.nix**

_4ydpzwjq2mwk7bb82r1sbr31nakbm7l6_`"]
    n4ydpzwjq2mwk7bb82r1sbr31nakbm7l6_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_4ydpzwjq2mwk7bb82r1sbr31nakbm7l6_`"]
    ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops["`**modules/sops**

_dlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_`"]
    ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops_templates["`**modules/sops/templates**

_dlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_`"]
    ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_dlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_`"]
    nl74nd2516ay22sg71kjrbqn0vklccksv_nixos["`**nixos**

_l74nd2516ay22sg71kjrbqn0vklccksv_`"]
    nl74nd2516ay22sg71kjrbqn0vklccksv_nixos_common_nix["`**nixos/common.nix**

_l74nd2516ay22sg71kjrbqn0vklccksv_`"]
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_global_nix["`**global.nix**

_7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_`"]
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_configurations_eltern["`**configurations/eltern**

_7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_`"]
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_modules_networkmanager_nix["`**modules/networkmanager.nix**

_7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_`"]
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_modules_avahi_nix["`**modules/avahi.nix**

_7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_`"]
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_`"]
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_`"]
    ngxa99lcqqsdlinm9s2d49i978y1kapl2_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_gxa99lcqqsdlinm9s2d49i978y1kapl2_`"]
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_`"]
    ngxa99lcqqsdlinm9s2d49i978y1kapl2_flake_nix --> n4ydpzwjq2mwk7bb82r1sbr31nakbm7l6_module_nix
    ngxa99lcqqsdlinm9s2d49i978y1kapl2_flake_nix --> ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops
    ngxa99lcqqsdlinm9s2d49i978y1kapl2_flake_nix --> nl74nd2516ay22sg71kjrbqn0vklccksv_nixos
    ngxa99lcqqsdlinm9s2d49i978y1kapl2_flake_nix --> n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_global_nix
    ngxa99lcqqsdlinm9s2d49i978y1kapl2_flake_nix --> n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_configurations_eltern
    ngxa99lcqqsdlinm9s2d49i978y1kapl2_flake_nix --> n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos
    n4ydpzwjq2mwk7bb82r1sbr31nakbm7l6_module_nix --> n4ydpzwjq2mwk7bb82r1sbr31nakbm7l6_lib_make_disk_image_nix
    ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops --> ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops_templates
    ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops --> ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops_secrets_for_users
    nl74nd2516ay22sg71kjrbqn0vklccksv_nixos --> nl74nd2516ay22sg71kjrbqn0vklccksv_nixos_common_nix
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_configurations_eltern --> n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_modules_networkmanager_nix
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_configurations_eltern --> n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_modules_avahi_nix
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos --> n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos_hardware_configuration_nix
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos --> n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos_disk_configuration_nix
    n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos_hardware_configuration_nix --> ngxa99lcqqsdlinm9s2d49i978y1kapl2_nixos_modules_installer_scan_not_detected_nix
    style ngxa99lcqqsdlinm9s2d49i978y1kapl2_flake_nix fill:#dde5b2,color:#000000
    style n4ydpzwjq2mwk7bb82r1sbr31nakbm7l6_module_nix fill:#b2e5c5,color:#000000
    style n4ydpzwjq2mwk7bb82r1sbr31nakbm7l6_lib_make_disk_image_nix fill:#b2e5c5,color:#000000
    style ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops fill:#e5e4b2,color:#000000
    style ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops_templates fill:#e5e4b2,color:#000000
    style ndlgyr0pc9gpzh2jlfl38gmznxhcqbl6k_modules_sops_secrets_for_users fill:#e5e4b2,color:#000000
    style nl74nd2516ay22sg71kjrbqn0vklccksv_nixos fill:#e5c1b2,color:#000000
    style nl74nd2516ay22sg71kjrbqn0vklccksv_nixos_common_nix fill:#e5c1b2,color:#000000
    style n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_global_nix fill:#b2b9e5,color:#000000
    style n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_configurations_eltern fill:#b2b9e5,color:#000000
    style n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_modules_networkmanager_nix fill:#b2b9e5,color:#000000
    style n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_modules_avahi_nix fill:#b2b9e5,color:#000000
    style n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos fill:#b2b9e5,color:#000000
    style n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos_hardware_configuration_nix fill:#b2b9e5,color:#000000
    style ngxa99lcqqsdlinm9s2d49i978y1kapl2_nixos_modules_installer_scan_not_detected_nix fill:#dde5b2,color:#000000
    style n7i1m6zwwgvh0grjcb279w6g4g3fm2pxa_machines_eltern_asus_nixos_disk_configuration_nix fill:#b2b9e5,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_flake_nix["`**flake.nix**

_vsl4lk8mq5qkj2rqac0xawxjb58avcxz_`"]
    n5c10512j5jmi1wvdfx0l8qi4qfsaskf7_module_nix["`**module.nix**

_5c10512j5jmi1wvdfx0l8qi4qfsaskf7_`"]
    n5c10512j5jmi1wvdfx0l8qi4qfsaskf7_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_5c10512j5jmi1wvdfx0l8qi4qfsaskf7_`"]
    nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops["`**modules/sops**

_qc20g7apnnc7f97lqmsmlplgdjliic89_`"]
    nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops_templates["`**modules/sops/templates**

_qc20g7apnnc7f97lqmsmlplgdjliic89_`"]
    nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_qc20g7apnnc7f97lqmsmlplgdjliic89_`"]
    nxd5bzbxa1yqqlbp1w357yqwkxz49yqdf_nixos["`**nixos**

_xd5bzbxa1yqqlbp1w357yqwkxz49yqdf_`"]
    nxd5bzbxa1yqqlbp1w357yqwkxz49yqdf_nixos_common_nix["`**nixos/common.nix**

_xd5bzbxa1yqqlbp1w357yqwkxz49yqdf_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_global_nix["`**global.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch["`**configurations/schokoladenelch**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_docker_nix["`**modules/docker.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_networkmanager_nix["`**modules/networkmanager.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_tmux_nix["`**modules/tmux.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_check_mkv["`**modules/scripts/check-mkv**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_create_zfs_dataset["`**modules/scripts/create-zfs-dataset**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_zfs_snapshot_diff["`**modules/scripts/zfs-snapshot-diff**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_stacks_default_nix["`**modules/stacks/default.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_vsl4lk8mq5qkj2rqac0xawxjb58avcxz_`"]
    n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_7habmpsii3gcd74dls51bbfx1d6fpq18_`"]
    nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_flake_nix --> n5c10512j5jmi1wvdfx0l8qi4qfsaskf7_module_nix
    nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_flake_nix --> nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops
    nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_flake_nix --> nxd5bzbxa1yqqlbp1w357yqwkxz49yqdf_nixos
    nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_flake_nix --> n7habmpsii3gcd74dls51bbfx1d6fpq18_global_nix
    nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_flake_nix --> n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch
    nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_flake_nix --> n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos
    n5c10512j5jmi1wvdfx0l8qi4qfsaskf7_module_nix --> n5c10512j5jmi1wvdfx0l8qi4qfsaskf7_lib_make_disk_image_nix
    nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops --> nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops_templates
    nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops --> nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops_secrets_for_users
    nxd5bzbxa1yqqlbp1w357yqwkxz49yqdf_nixos --> nxd5bzbxa1yqqlbp1w357yqwkxz49yqdf_nixos_common_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_docker_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_networkmanager_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_tmux_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_check_mkv
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_create_zfs_dataset
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_zfs_manual_snapshot
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_zfs_snapshot_diff
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_boot_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_networking_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_services_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_persistence_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch --> n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_stacks_default_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos --> n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos --> n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_nixos_modules_installer_scan_not_detected_nix
    style nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_flake_nix fill:#b2dde5,color:#000000
    style n5c10512j5jmi1wvdfx0l8qi4qfsaskf7_module_nix fill:#e5b2c0,color:#000000
    style n5c10512j5jmi1wvdfx0l8qi4qfsaskf7_lib_make_disk_image_nix fill:#e5b2c0,color:#000000
    style nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops fill:#b2e5de,color:#000000
    style nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops_templates fill:#b2e5de,color:#000000
    style nqc20g7apnnc7f97lqmsmlplgdjliic89_modules_sops_secrets_for_users fill:#b2e5de,color:#000000
    style nxd5bzbxa1yqqlbp1w357yqwkxz49yqdf_nixos fill:#b2d4e5,color:#000000
    style nxd5bzbxa1yqqlbp1w357yqwkxz49yqdf_nixos_common_nix fill:#b2d4e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_global_nix fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_docker_nix fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_networkmanager_nix fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_tmux_nix fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_check_mkv fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_create_zfs_dataset fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_zfs_manual_snapshot fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_scripts_zfs_snapshot_diff fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_boot_nix fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_networking_nix fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_services_nix fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_configurations_schokoladenelch_persistence_nix fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_modules_stacks_default_nix fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos fill:#b2d1e5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#b2d1e5,color:#000000
    style nvsl4lk8mq5qkj2rqac0xawxjb58avcxz_nixos_modules_installer_scan_not_detected_nix fill:#b2dde5,color:#000000
    style n7habmpsii3gcd74dls51bbfx1d6fpq18_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#b2d1e5,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_flake_nix["`**flake.nix**

_6i3kpfg514m4a021ji7vjhjmlwl5p7n1_`"]
    ngnnx9sy2pr5d9pprimlfp6ggw2cxvxag_module_nix["`**module.nix**

_gnnx9sy2pr5d9pprimlfp6ggw2cxvxag_`"]
    ngnnx9sy2pr5d9pprimlfp6ggw2cxvxag_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_gnnx9sy2pr5d9pprimlfp6ggw2cxvxag_`"]
    nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops["`**modules/sops**

_mfhf32prps4w1y1g5yw0dvrkvy7d2q6v_`"]
    nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops_templates["`**modules/sops/templates**

_mfhf32prps4w1y1g5yw0dvrkvy7d2q6v_`"]
    nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_mfhf32prps4w1y1g5yw0dvrkvy7d2q6v_`"]
    npii0d5qjnc9ca1lk83ihnazxg062v8fw_nixos["`**nixos**

_pii0d5qjnc9ca1lk83ihnazxg062v8fw_`"]
    npii0d5qjnc9ca1lk83ihnazxg062v8fw_nixos_common_nix["`**nixos/common.nix**

_pii0d5qjnc9ca1lk83ihnazxg062v8fw_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_global_nix["`**global.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico["`**configurations/nico**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_docker_nix["`**modules/docker.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_networkmanager_nix["`**modules/networkmanager.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_pipewire_nix["`**modules/pipewire.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_services_nix["`**configurations/nico/services.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_avahi_nix["`**modules/avahi.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_6i3kpfg514m4a021ji7vjhjmlwl5p7n1_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_eden_nix["`**modules/eden.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_7p8y4dhqc3frxpraivi78q1ir5clrnav_`"]
    n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_flake_nix --> ngnnx9sy2pr5d9pprimlfp6ggw2cxvxag_module_nix
    n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_flake_nix --> nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops
    n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_flake_nix --> npii0d5qjnc9ca1lk83ihnazxg062v8fw_nixos
    n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_flake_nix --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_global_nix
    n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_flake_nix --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico
    n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_flake_nix --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos
    ngnnx9sy2pr5d9pprimlfp6ggw2cxvxag_module_nix --> ngnnx9sy2pr5d9pprimlfp6ggw2cxvxag_lib_make_disk_image_nix
    nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops --> nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops_templates
    nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops --> nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops_secrets_for_users
    npii0d5qjnc9ca1lk83ihnazxg062v8fw_nixos --> npii0d5qjnc9ca1lk83ihnazxg062v8fw_nixos_common_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_docker_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_networkmanager_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_boot_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_desktop_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_audio_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_virtualisation_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_services_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_packages_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_rclone_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_audio_nix --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_pipewire_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_services_nix --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_avahi_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos_hardware_configuration_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_eden_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos --> n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_xone_dongle_nix
    n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos_hardware_configuration_nix --> n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_nixos_modules_installer_scan_not_detected_nix
    style n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_flake_nix fill:#dbe5b2,color:#000000
    style ngnnx9sy2pr5d9pprimlfp6ggw2cxvxag_module_nix fill:#bfe5b2,color:#000000
    style ngnnx9sy2pr5d9pprimlfp6ggw2cxvxag_lib_make_disk_image_nix fill:#bfe5b2,color:#000000
    style nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops fill:#c9b2e5,color:#000000
    style nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops_templates fill:#c9b2e5,color:#000000
    style nmfhf32prps4w1y1g5yw0dvrkvy7d2q6v_modules_sops_secrets_for_users fill:#c9b2e5,color:#000000
    style npii0d5qjnc9ca1lk83ihnazxg062v8fw_nixos fill:#b2e5e5,color:#000000
    style npii0d5qjnc9ca1lk83ihnazxg062v8fw_nixos_common_nix fill:#b2e5e5,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_global_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_docker_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_networkmanager_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_boot_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_desktop_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_audio_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_pipewire_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_virtualisation_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_services_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_avahi_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_packages_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_configurations_nico_rclone_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#b2e5ce,color:#000000
    style n6i3kpfg514m4a021ji7vjhjmlwl5p7n1_nixos_modules_installer_scan_not_detected_nix fill:#dbe5b2,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_eden_nix fill:#b2e5ce,color:#000000
    style n7p8y4dhqc3frxpraivi78q1ir5clrnav_modules_xone_dongle_nix fill:#b2e5ce,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    ncbcwds22kcjapp9a0sfbyavdfjll8j7p_flake_nix["`**flake.nix**

_cbcwds22kcjapp9a0sfbyavdfjll8j7p_`"]
    nc8xs6s29pv798w3zzy0n1cvk3n17j8gb_module_nix["`**module.nix**

_c8xs6s29pv798w3zzy0n1cvk3n17j8gb_`"]
    nc8xs6s29pv798w3zzy0n1cvk3n17j8gb_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_c8xs6s29pv798w3zzy0n1cvk3n17j8gb_`"]
    ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops["`**modules/sops**

_g6r4y4r19y35ah4xacjrfcfn4hnaaj5c_`"]
    ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops_templates["`**modules/sops/templates**

_g6r4y4r19y35ah4xacjrfcfn4hnaaj5c_`"]
    ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_g6r4y4r19y35ah4xacjrfcfn4hnaaj5c_`"]
    nfddfdgkn54qxh3jdawcrcab4y5gql0jq_nixos["`**nixos**

_fddfdgkn54qxh3jdawcrcab4y5gql0jq_`"]
    nfddfdgkn54qxh3jdawcrcab4y5gql0jq_nixos_common_nix["`**nixos/common.nix**

_fddfdgkn54qxh3jdawcrcab4y5gql0jq_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_global_nix["`**global.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico["`**configurations/nico**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_modules_docker_nix["`**modules/docker.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_modules_networkmanager_nix["`**modules/networkmanager.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_modules_pipewire_nix["`**modules/pipewire.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_services_nix["`**configurations/nico/services.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_modules_avahi_nix["`**modules/avahi.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    ncbcwds22kcjapp9a0sfbyavdfjll8j7p_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_cbcwds22kcjapp9a0sfbyavdfjll8j7p_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_disk_configuration_nix["`**machines/nico-thinkpad-nixos/disk-configuration.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_impermanence_nix["`**machines/nico-thinkpad-nixos/impermanence.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_c5vw08sja5h7rwp0wb156haf2la6c269_`"]
    ncbcwds22kcjapp9a0sfbyavdfjll8j7p_flake_nix --> nc8xs6s29pv798w3zzy0n1cvk3n17j8gb_module_nix
    ncbcwds22kcjapp9a0sfbyavdfjll8j7p_flake_nix --> ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops
    ncbcwds22kcjapp9a0sfbyavdfjll8j7p_flake_nix --> nfddfdgkn54qxh3jdawcrcab4y5gql0jq_nixos
    ncbcwds22kcjapp9a0sfbyavdfjll8j7p_flake_nix --> nc5vw08sja5h7rwp0wb156haf2la6c269_global_nix
    ncbcwds22kcjapp9a0sfbyavdfjll8j7p_flake_nix --> nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico
    ncbcwds22kcjapp9a0sfbyavdfjll8j7p_flake_nix --> nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos
    nc8xs6s29pv798w3zzy0n1cvk3n17j8gb_module_nix --> nc8xs6s29pv798w3zzy0n1cvk3n17j8gb_lib_make_disk_image_nix
    ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops --> ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops_templates
    ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops --> ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops_secrets_for_users
    nfddfdgkn54qxh3jdawcrcab4y5gql0jq_nixos --> nfddfdgkn54qxh3jdawcrcab4y5gql0jq_nixos_common_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico --> nc5vw08sja5h7rwp0wb156haf2la6c269_modules_docker_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico --> nc5vw08sja5h7rwp0wb156haf2la6c269_modules_networkmanager_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico --> nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_boot_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico --> nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_desktop_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico --> nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_audio_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico --> nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_virtualisation_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico --> nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_services_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico --> nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_packages_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico --> nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_rclone_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_audio_nix --> nc5vw08sja5h7rwp0wb156haf2la6c269_modules_pipewire_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_services_nix --> nc5vw08sja5h7rwp0wb156haf2la6c269_modules_avahi_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos --> nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_hardware_configuration_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos --> nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_disk_configuration_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos --> nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_impermanence_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos --> nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos --> nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_mobile_network_nix
    nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_hardware_configuration_nix --> ncbcwds22kcjapp9a0sfbyavdfjll8j7p_nixos_modules_installer_scan_not_detected_nix
    style ncbcwds22kcjapp9a0sfbyavdfjll8j7p_flake_nix fill:#b2e5db,color:#000000
    style nc8xs6s29pv798w3zzy0n1cvk3n17j8gb_module_nix fill:#ddb2e5,color:#000000
    style nc8xs6s29pv798w3zzy0n1cvk3n17j8gb_lib_make_disk_image_nix fill:#ddb2e5,color:#000000
    style ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops fill:#b2e1e5,color:#000000
    style ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops_templates fill:#b2e1e5,color:#000000
    style ng6r4y4r19y35ah4xacjrfcfn4hnaaj5c_modules_sops_secrets_for_users fill:#b2e1e5,color:#000000
    style nfddfdgkn54qxh3jdawcrcab4y5gql0jq_nixos fill:#c3b2e5,color:#000000
    style nfddfdgkn54qxh3jdawcrcab4y5gql0jq_nixos_common_nix fill:#c3b2e5,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_global_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_modules_docker_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_modules_networkmanager_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_boot_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_desktop_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_audio_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_modules_pipewire_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_virtualisation_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_services_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_modules_avahi_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_packages_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_configurations_nico_rclone_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#e5b2c7,color:#000000
    style ncbcwds22kcjapp9a0sfbyavdfjll8j7p_nixos_modules_installer_scan_not_detected_nix fill:#b2e5db,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_disk_configuration_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_impermanence_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#e5b2c7,color:#000000
    style nc5vw08sja5h7rwp0wb156haf2la6c269_machines_nico_thinkpad_nixos_mobile_network_nix fill:#e5b2c7,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    nzywx129smd71pwizidvc68hh8807zb3x_flake_nix["`**flake.nix**

_zywx129smd71pwizidvc68hh8807zb3x_`"]
    n7dx3y2izcr8glncylwrf4bzg06c225lz_module_nix["`**module.nix**

_7dx3y2izcr8glncylwrf4bzg06c225lz_`"]
    n7dx3y2izcr8glncylwrf4bzg06c225lz_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_7dx3y2izcr8glncylwrf4bzg06c225lz_`"]
    n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops["`**modules/sops**

_2flrss212kmwrrdn1r7mcyssnx0y04fw_`"]
    n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops_templates["`**modules/sops/templates**

_2flrss212kmwrrdn1r7mcyssnx0y04fw_`"]
    n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_2flrss212kmwrrdn1r7mcyssnx0y04fw_`"]
    nl61klnk57h9afivmzrv1j2az5g33235k_nixos["`**nixos**

_l61klnk57h9afivmzrv1j2az5g33235k_`"]
    nl61klnk57h9afivmzrv1j2az5g33235k_nixos_common_nix["`**nixos/common.nix**

_l61klnk57h9afivmzrv1j2az5g33235k_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_global_nix["`**global.nix**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_configurations_nixos["`**configurations/nixos**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_modules_docker_nix["`**modules/docker.nix**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_modules_headlamp_nix["`**modules/headlamp.nix**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_modules_tmux_nix["`**modules/tmux.nix**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_4dh07p0lhs5imbgf4dx5dia965qjnlgx_`"]
    nzywx129smd71pwizidvc68hh8807zb3x_flake_nix --> n7dx3y2izcr8glncylwrf4bzg06c225lz_module_nix
    nzywx129smd71pwizidvc68hh8807zb3x_flake_nix --> n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops
    nzywx129smd71pwizidvc68hh8807zb3x_flake_nix --> nl61klnk57h9afivmzrv1j2az5g33235k_nixos
    nzywx129smd71pwizidvc68hh8807zb3x_flake_nix --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_global_nix
    nzywx129smd71pwizidvc68hh8807zb3x_flake_nix --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_configurations_nixos
    nzywx129smd71pwizidvc68hh8807zb3x_flake_nix --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos
    n7dx3y2izcr8glncylwrf4bzg06c225lz_module_nix --> n7dx3y2izcr8glncylwrf4bzg06c225lz_lib_make_disk_image_nix
    n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops --> n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops_templates
    n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops --> n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops_secrets_for_users
    nl61klnk57h9afivmzrv1j2az5g33235k_nixos --> nl61klnk57h9afivmzrv1j2az5g33235k_nixos_common_nix
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_configurations_nixos --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_modules_docker_nix
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_configurations_nixos --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_modules_headlamp_nix
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_configurations_nixos --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_modules_tmux_nix
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_disk_configuration_nix
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_boot_nix
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_desktop_nix
    n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos --> n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_persistence_nix
    style nzywx129smd71pwizidvc68hh8807zb3x_flake_nix fill:#dfe5b2,color:#000000
    style n7dx3y2izcr8glncylwrf4bzg06c225lz_module_nix fill:#e5b2b5,color:#000000
    style n7dx3y2izcr8glncylwrf4bzg06c225lz_lib_make_disk_image_nix fill:#e5b2b5,color:#000000
    style n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops fill:#c4e5b2,color:#000000
    style n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops_templates fill:#c4e5b2,color:#000000
    style n2flrss212kmwrrdn1r7mcyssnx0y04fw_modules_sops_secrets_for_users fill:#c4e5b2,color:#000000
    style nl61klnk57h9afivmzrv1j2az5g33235k_nixos fill:#e5b2e5,color:#000000
    style nl61klnk57h9afivmzrv1j2az5g33235k_nixos_common_nix fill:#e5b2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_global_nix fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_configurations_nixos fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_modules_docker_nix fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_modules_headlamp_nix fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_modules_tmux_nix fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_boot_nix fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_desktop_nix fill:#cbb2e5,color:#000000
    style n4dh07p0lhs5imbgf4dx5dia965qjnlgx_machines_nixos_virtualbox_nixos_persistence_nix fill:#cbb2e5,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    ngfck121pnl6lyhawsnbrp1yhyjkm4fmx_flake_nix["`**flake.nix**

_gfck121pnl6lyhawsnbrp1yhyjkm4fmx_`"]
    n3ac9bh2qar6671xg0jq0p21w2lvxmynk_module_nix["`**module.nix**

_3ac9bh2qar6671xg0jq0p21w2lvxmynk_`"]
    n3ac9bh2qar6671xg0jq0p21w2lvxmynk_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_3ac9bh2qar6671xg0jq0p21w2lvxmynk_`"]
    npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops["`**modules/sops**

_pshw6r15xawyx4jnqpmc6q1qkb4dccli_`"]
    npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops_templates["`**modules/sops/templates**

_pshw6r15xawyx4jnqpmc6q1qkb4dccli_`"]
    npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_pshw6r15xawyx4jnqpmc6q1qkb4dccli_`"]
    n4qclmm4c5rnsbnxvcn1qf0lbjygr5f52_nixos["`**nixos**

_4qclmm4c5rnsbnxvcn1qf0lbjygr5f52_`"]
    n4qclmm4c5rnsbnxvcn1qf0lbjygr5f52_nixos_common_nix["`**nixos/common.nix**

_4qclmm4c5rnsbnxvcn1qf0lbjygr5f52_`"]
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_global_nix["`**global.nix**

_sy19psp6qcbjvrvjb53x4qnhfr060v7g_`"]
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_configurations_nixos["`**configurations/nixos**

_sy19psp6qcbjvrvjb53x4qnhfr060v7g_`"]
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_modules_docker_nix["`**modules/docker.nix**

_sy19psp6qcbjvrvjb53x4qnhfr060v7g_`"]
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_modules_headlamp_nix["`**modules/headlamp.nix**

_sy19psp6qcbjvrvjb53x4qnhfr060v7g_`"]
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_modules_tmux_nix["`**modules/tmux.nix**

_sy19psp6qcbjvrvjb53x4qnhfr060v7g_`"]
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_sy19psp6qcbjvrvjb53x4qnhfr060v7g_`"]
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_sy19psp6qcbjvrvjb53x4qnhfr060v7g_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules["`**modules**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_build_tarball_nix["`**modules/build-tarball.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_interop_nix["`**modules/interop.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_recovery_nix["`**modules/recovery.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd["`**modules/systemd**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd_native["`**modules/systemd/native**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_usbip_nix["`**modules/usbip.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_version_nix["`**modules/version.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_welcome_nix["`**modules/welcome.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_4hphj2fj5afpxhi85d7lpky1fcb96ap8_`"]
    ngfck121pnl6lyhawsnbrp1yhyjkm4fmx_flake_nix --> n3ac9bh2qar6671xg0jq0p21w2lvxmynk_module_nix
    ngfck121pnl6lyhawsnbrp1yhyjkm4fmx_flake_nix --> npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops
    ngfck121pnl6lyhawsnbrp1yhyjkm4fmx_flake_nix --> n4qclmm4c5rnsbnxvcn1qf0lbjygr5f52_nixos
    ngfck121pnl6lyhawsnbrp1yhyjkm4fmx_flake_nix --> nsy19psp6qcbjvrvjb53x4qnhfr060v7g_global_nix
    ngfck121pnl6lyhawsnbrp1yhyjkm4fmx_flake_nix --> nsy19psp6qcbjvrvjb53x4qnhfr060v7g_configurations_nixos
    ngfck121pnl6lyhawsnbrp1yhyjkm4fmx_flake_nix --> nsy19psp6qcbjvrvjb53x4qnhfr060v7g_machines_nixos_wsl_nixos
    n3ac9bh2qar6671xg0jq0p21w2lvxmynk_module_nix --> n3ac9bh2qar6671xg0jq0p21w2lvxmynk_lib_make_disk_image_nix
    npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops --> npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops_templates
    npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops --> npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops_secrets_for_users
    n4qclmm4c5rnsbnxvcn1qf0lbjygr5f52_nixos --> n4qclmm4c5rnsbnxvcn1qf0lbjygr5f52_nixos_common_nix
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_configurations_nixos --> nsy19psp6qcbjvrvjb53x4qnhfr060v7g_modules_docker_nix
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_configurations_nixos --> nsy19psp6qcbjvrvjb53x4qnhfr060v7g_modules_headlamp_nix
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_configurations_nixos --> nsy19psp6qcbjvrvjb53x4qnhfr060v7g_modules_tmux_nix
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_machines_nixos_wsl_nixos --> nsy19psp6qcbjvrvjb53x4qnhfr060v7g_machines_nixos_wsl_nixos_hardware_configuration_nix
    nsy19psp6qcbjvrvjb53x4qnhfr060v7g_machines_nixos_wsl_nixos --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_build_tarball_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_docker_desktop_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_interop_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_recovery_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_ssh_agent_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_usbip_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_version_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_welcome_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_wsl_conf_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_wsl_distro_nix
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd_native
    n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd_native --> n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd_native_wrap_shell_nix
    style ngfck121pnl6lyhawsnbrp1yhyjkm4fmx_flake_nix fill:#d9b2e5,color:#000000
    style n3ac9bh2qar6671xg0jq0p21w2lvxmynk_module_nix fill:#dee5b2,color:#000000
    style n3ac9bh2qar6671xg0jq0p21w2lvxmynk_lib_make_disk_image_nix fill:#dee5b2,color:#000000
    style npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops fill:#b4b2e5,color:#000000
    style npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops_templates fill:#b4b2e5,color:#000000
    style npshw6r15xawyx4jnqpmc6q1qkb4dccli_modules_sops_secrets_for_users fill:#b4b2e5,color:#000000
    style n4qclmm4c5rnsbnxvcn1qf0lbjygr5f52_nixos fill:#b2e5c5,color:#000000
    style n4qclmm4c5rnsbnxvcn1qf0lbjygr5f52_nixos_common_nix fill:#b2e5c5,color:#000000
    style nsy19psp6qcbjvrvjb53x4qnhfr060v7g_global_nix fill:#e5b2ba,color:#000000
    style nsy19psp6qcbjvrvjb53x4qnhfr060v7g_configurations_nixos fill:#e5b2ba,color:#000000
    style nsy19psp6qcbjvrvjb53x4qnhfr060v7g_modules_docker_nix fill:#e5b2ba,color:#000000
    style nsy19psp6qcbjvrvjb53x4qnhfr060v7g_modules_headlamp_nix fill:#e5b2ba,color:#000000
    style nsy19psp6qcbjvrvjb53x4qnhfr060v7g_modules_tmux_nix fill:#e5b2ba,color:#000000
    style nsy19psp6qcbjvrvjb53x4qnhfr060v7g_machines_nixos_wsl_nixos fill:#e5b2ba,color:#000000
    style nsy19psp6qcbjvrvjb53x4qnhfr060v7g_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#e5b2ba,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_build_tarball_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_docker_desktop_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_interop_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_recovery_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_ssh_agent_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd_native fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_systemd_native_wrap_shell_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_usbip_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_version_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_welcome_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_wsl_conf_nix fill:#e5b2df,color:#000000
    style n4hphj2fj5afpxhi85d7lpky1fcb96ap8_modules_wsl_distro_nix fill:#e5b2df,color:#000000
```
