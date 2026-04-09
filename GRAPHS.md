# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    niv24hllsk47ky6nkdi4vc758s28sbiyl_flake_nix["`**flake.nix**

_iv24hllsk47ky6nkdi4vc758s28sbiyl_`"]
    nwv2mkhy1nvxcnazpw1dhyps7vrhd199s_module_nix["`**module.nix**

_wv2mkhy1nvxcnazpw1dhyps7vrhd199s_`"]
    nwv2mkhy1nvxcnazpw1dhyps7vrhd199s_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_wv2mkhy1nvxcnazpw1dhyps7vrhd199s_`"]
    nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops["`**modules/sops**

_wh481cgmacw252ifxfgxglks9in2vvd6_`"]
    nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops_templates["`**modules/sops/templates**

_wh481cgmacw252ifxfgxglks9in2vvd6_`"]
    nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_wh481cgmacw252ifxfgxglks9in2vvd6_`"]
    ngnmr871byrcrav90ppp7vhzgzs953c5s_nixos["`**nixos**

_gnmr871byrcrav90ppp7vhzgzs953c5s_`"]
    ngnmr871byrcrav90ppp7vhzgzs953c5s_nixos_common_nix["`**nixos/common.nix**

_gnmr871byrcrav90ppp7vhzgzs953c5s_`"]
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_global_nix["`**global.nix**

_qq6j50bdgkvwpiknc48sfv0bn3av4shb_`"]
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_configurations_eltern["`**configurations/eltern**

_qq6j50bdgkvwpiknc48sfv0bn3av4shb_`"]
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_modules_networkmanager_nix["`**modules/networkmanager.nix**

_qq6j50bdgkvwpiknc48sfv0bn3av4shb_`"]
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_modules_avahi_nix["`**modules/avahi.nix**

_qq6j50bdgkvwpiknc48sfv0bn3av4shb_`"]
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_qq6j50bdgkvwpiknc48sfv0bn3av4shb_`"]
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_qq6j50bdgkvwpiknc48sfv0bn3av4shb_`"]
    niv24hllsk47ky6nkdi4vc758s28sbiyl_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_iv24hllsk47ky6nkdi4vc758s28sbiyl_`"]
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_qq6j50bdgkvwpiknc48sfv0bn3av4shb_`"]
    niv24hllsk47ky6nkdi4vc758s28sbiyl_flake_nix --> nwv2mkhy1nvxcnazpw1dhyps7vrhd199s_module_nix
    niv24hllsk47ky6nkdi4vc758s28sbiyl_flake_nix --> nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops
    niv24hllsk47ky6nkdi4vc758s28sbiyl_flake_nix --> ngnmr871byrcrav90ppp7vhzgzs953c5s_nixos
    niv24hllsk47ky6nkdi4vc758s28sbiyl_flake_nix --> nqq6j50bdgkvwpiknc48sfv0bn3av4shb_global_nix
    niv24hllsk47ky6nkdi4vc758s28sbiyl_flake_nix --> nqq6j50bdgkvwpiknc48sfv0bn3av4shb_configurations_eltern
    niv24hllsk47ky6nkdi4vc758s28sbiyl_flake_nix --> nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos
    nwv2mkhy1nvxcnazpw1dhyps7vrhd199s_module_nix --> nwv2mkhy1nvxcnazpw1dhyps7vrhd199s_lib_make_disk_image_nix
    nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops --> nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops_templates
    nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops --> nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops_secrets_for_users
    ngnmr871byrcrav90ppp7vhzgzs953c5s_nixos --> ngnmr871byrcrav90ppp7vhzgzs953c5s_nixos_common_nix
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_configurations_eltern --> nqq6j50bdgkvwpiknc48sfv0bn3av4shb_modules_networkmanager_nix
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_configurations_eltern --> nqq6j50bdgkvwpiknc48sfv0bn3av4shb_modules_avahi_nix
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos --> nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos_hardware_configuration_nix
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos --> nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos_disk_configuration_nix
    nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos_hardware_configuration_nix --> niv24hllsk47ky6nkdi4vc758s28sbiyl_nixos_modules_installer_scan_not_detected_nix
    style niv24hllsk47ky6nkdi4vc758s28sbiyl_flake_nix fill:#e5b2c7,color:#000000
    style nwv2mkhy1nvxcnazpw1dhyps7vrhd199s_module_nix fill:#e5b2b5,color:#000000
    style nwv2mkhy1nvxcnazpw1dhyps7vrhd199s_lib_make_disk_image_nix fill:#e5b2b5,color:#000000
    style nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops fill:#b2e5bb,color:#000000
    style nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops_templates fill:#b2e5bb,color:#000000
    style nwh481cgmacw252ifxfgxglks9in2vvd6_modules_sops_secrets_for_users fill:#b2e5bb,color:#000000
    style ngnmr871byrcrav90ppp7vhzgzs953c5s_nixos fill:#b2dde5,color:#000000
    style ngnmr871byrcrav90ppp7vhzgzs953c5s_nixos_common_nix fill:#b2dde5,color:#000000
    style nqq6j50bdgkvwpiknc48sfv0bn3av4shb_global_nix fill:#e5b2ca,color:#000000
    style nqq6j50bdgkvwpiknc48sfv0bn3av4shb_configurations_eltern fill:#e5b2ca,color:#000000
    style nqq6j50bdgkvwpiknc48sfv0bn3av4shb_modules_networkmanager_nix fill:#e5b2ca,color:#000000
    style nqq6j50bdgkvwpiknc48sfv0bn3av4shb_modules_avahi_nix fill:#e5b2ca,color:#000000
    style nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos fill:#e5b2ca,color:#000000
    style nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos_hardware_configuration_nix fill:#e5b2ca,color:#000000
    style niv24hllsk47ky6nkdi4vc758s28sbiyl_nixos_modules_installer_scan_not_detected_nix fill:#e5b2c7,color:#000000
    style nqq6j50bdgkvwpiknc48sfv0bn3av4shb_machines_eltern_asus_nixos_disk_configuration_nix fill:#e5b2ca,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_flake_nix["`**flake.nix**

_3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_`"]
    nja0yrrzxxm4zsy0ll9l3x4n8jzn1xlz0_module_nix["`**module.nix**

_ja0yrrzxxm4zsy0ll9l3x4n8jzn1xlz0_`"]
    nja0yrrzxxm4zsy0ll9l3x4n8jzn1xlz0_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_ja0yrrzxxm4zsy0ll9l3x4n8jzn1xlz0_`"]
    nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops["`**modules/sops**

_r0cllk9pb7slmcn4c91mix2xqaj290b5_`"]
    nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops_templates["`**modules/sops/templates**

_r0cllk9pb7slmcn4c91mix2xqaj290b5_`"]
    nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_r0cllk9pb7slmcn4c91mix2xqaj290b5_`"]
    nrw55ldh6m67h7q0sqaj6fx3brwzcx1r0_nixos["`**nixos**

_rw55ldh6m67h7q0sqaj6fx3brwzcx1r0_`"]
    nrw55ldh6m67h7q0sqaj6fx3brwzcx1r0_nixos_common_nix["`**nixos/common.nix**

_rw55ldh6m67h7q0sqaj6fx3brwzcx1r0_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_global_nix["`**global.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch["`**configurations/schokoladenelch**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_docker_nix["`**modules/docker.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_networkmanager_nix["`**modules/networkmanager.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_tmux_nix["`**modules/tmux.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_scripts_zfs_manual_snapshot["`**modules/scripts/zfs-manual-snapshot**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_stacks_default_nix["`**modules/stacks/default.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_`"]
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_fdscsf0g6ara6y57nh2k3plrmm73yvzm_`"]
    n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_flake_nix --> nja0yrrzxxm4zsy0ll9l3x4n8jzn1xlz0_module_nix
    n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_flake_nix --> nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops
    n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_flake_nix --> nrw55ldh6m67h7q0sqaj6fx3brwzcx1r0_nixos
    n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_flake_nix --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_global_nix
    n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_flake_nix --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch
    n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_flake_nix --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos
    nja0yrrzxxm4zsy0ll9l3x4n8jzn1xlz0_module_nix --> nja0yrrzxxm4zsy0ll9l3x4n8jzn1xlz0_lib_make_disk_image_nix
    nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops --> nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops_templates
    nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops --> nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops_secrets_for_users
    nrw55ldh6m67h7q0sqaj6fx3brwzcx1r0_nixos --> nrw55ldh6m67h7q0sqaj6fx3brwzcx1r0_nixos_common_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_docker_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_networkmanager_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_tmux_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_scripts_zfs_manual_snapshot
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_boot_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_networking_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_services_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_persistence_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_stacks_default_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos --> nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_nixos_modules_installer_scan_not_detected_nix
    style n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_flake_nix fill:#b2e5be,color:#000000
    style nja0yrrzxxm4zsy0ll9l3x4n8jzn1xlz0_module_nix fill:#e5b2e0,color:#000000
    style nja0yrrzxxm4zsy0ll9l3x4n8jzn1xlz0_lib_make_disk_image_nix fill:#e5b2e0,color:#000000
    style nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops fill:#b2d4e5,color:#000000
    style nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops_templates fill:#b2d4e5,color:#000000
    style nr0cllk9pb7slmcn4c91mix2xqaj290b5_modules_sops_secrets_for_users fill:#b2d4e5,color:#000000
    style nrw55ldh6m67h7q0sqaj6fx3brwzcx1r0_nixos fill:#bfe5b2,color:#000000
    style nrw55ldh6m67h7q0sqaj6fx3brwzcx1r0_nixos_common_nix fill:#bfe5b2,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_global_nix fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_docker_nix fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_networkmanager_nix fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_tmux_nix fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_scripts_zfs_manual_snapshot fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_boot_nix fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_networking_nix fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_services_nix fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_configurations_schokoladenelch_persistence_nix fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_modules_stacks_default_nix fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos fill:#e5b2cb,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#e5b2cb,color:#000000
    style n3vmbpp1aclnlrmiqmy634k1g6x4ybl0y_nixos_modules_installer_scan_not_detected_nix fill:#b2e5be,color:#000000
    style nfdscsf0g6ara6y57nh2k3plrmm73yvzm_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#e5b2cb,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    nm9y8kgxql6cdrpykjqwkbn661mdman6y_flake_nix["`**flake.nix**

_m9y8kgxql6cdrpykjqwkbn661mdman6y_`"]
    ng55yyy1kh047vxqf04r521pwzvqnf5ij_module_nix["`**module.nix**

_g55yyy1kh047vxqf04r521pwzvqnf5ij_`"]
    ng55yyy1kh047vxqf04r521pwzvqnf5ij_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_g55yyy1kh047vxqf04r521pwzvqnf5ij_`"]
    nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops["`**modules/sops**

_h9awfpd8zx5hgxm0d1ys88z45p2drs0q_`"]
    nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops_templates["`**modules/sops/templates**

_h9awfpd8zx5hgxm0d1ys88z45p2drs0q_`"]
    nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_h9awfpd8zx5hgxm0d1ys88z45p2drs0q_`"]
    nvlnax6bc96j4jlnivv94gjflxpapz259_nixos["`**nixos**

_vlnax6bc96j4jlnivv94gjflxpapz259_`"]
    nvlnax6bc96j4jlnivv94gjflxpapz259_nixos_common_nix["`**nixos/common.nix**

_vlnax6bc96j4jlnivv94gjflxpapz259_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_global_nix["`**global.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico["`**configurations/nico**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_docker_nix["`**modules/docker.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_networkmanager_nix["`**modules/networkmanager.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_pipewire_nix["`**modules/pipewire.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_services_nix["`**configurations/nico/services.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_avahi_nix["`**modules/avahi.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nm9y8kgxql6cdrpykjqwkbn661mdman6y_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_m9y8kgxql6cdrpykjqwkbn661mdman6y_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_eden_nix["`**modules/eden.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_n4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_`"]
    nm9y8kgxql6cdrpykjqwkbn661mdman6y_flake_nix --> ng55yyy1kh047vxqf04r521pwzvqnf5ij_module_nix
    nm9y8kgxql6cdrpykjqwkbn661mdman6y_flake_nix --> nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops
    nm9y8kgxql6cdrpykjqwkbn661mdman6y_flake_nix --> nvlnax6bc96j4jlnivv94gjflxpapz259_nixos
    nm9y8kgxql6cdrpykjqwkbn661mdman6y_flake_nix --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_global_nix
    nm9y8kgxql6cdrpykjqwkbn661mdman6y_flake_nix --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico
    nm9y8kgxql6cdrpykjqwkbn661mdman6y_flake_nix --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos
    ng55yyy1kh047vxqf04r521pwzvqnf5ij_module_nix --> ng55yyy1kh047vxqf04r521pwzvqnf5ij_lib_make_disk_image_nix
    nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops --> nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops_templates
    nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops --> nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops_secrets_for_users
    nvlnax6bc96j4jlnivv94gjflxpapz259_nixos --> nvlnax6bc96j4jlnivv94gjflxpapz259_nixos_common_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_docker_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_networkmanager_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_boot_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_desktop_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_audio_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_virtualisation_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_services_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_packages_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_rclone_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_audio_nix --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_pipewire_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_services_nix --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_avahi_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos_hardware_configuration_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_eden_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos --> nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_xone_dongle_nix
    nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos_hardware_configuration_nix --> nm9y8kgxql6cdrpykjqwkbn661mdman6y_nixos_modules_installer_scan_not_detected_nix
    style nm9y8kgxql6cdrpykjqwkbn661mdman6y_flake_nix fill:#d7e5b2,color:#000000
    style ng55yyy1kh047vxqf04r521pwzvqnf5ij_module_nix fill:#e5b2db,color:#000000
    style ng55yyy1kh047vxqf04r521pwzvqnf5ij_lib_make_disk_image_nix fill:#e5b2db,color:#000000
    style nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops fill:#b2e5db,color:#000000
    style nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops_templates fill:#b2e5db,color:#000000
    style nh9awfpd8zx5hgxm0d1ys88z45p2drs0q_modules_sops_secrets_for_users fill:#b2e5db,color:#000000
    style nvlnax6bc96j4jlnivv94gjflxpapz259_nixos fill:#dfb2e5,color:#000000
    style nvlnax6bc96j4jlnivv94gjflxpapz259_nixos_common_nix fill:#dfb2e5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_global_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_docker_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_networkmanager_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_boot_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_desktop_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_audio_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_pipewire_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_virtualisation_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_services_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_avahi_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_packages_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_configurations_nico_rclone_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#e5b2b5,color:#000000
    style nm9y8kgxql6cdrpykjqwkbn661mdman6y_nixos_modules_installer_scan_not_detected_nix fill:#d7e5b2,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_eden_nix fill:#e5b2b5,color:#000000
    style nn4sfzqkw65cpp8knnf1ksxrp3cc4a1j6_modules_xone_dongle_nix fill:#e5b2b5,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_flake_nix["`**flake.nix**

_450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_`"]
    n813qqjrnxc43pmf50np2d1bikin8806a_module_nix["`**module.nix**

_813qqjrnxc43pmf50np2d1bikin8806a_`"]
    n813qqjrnxc43pmf50np2d1bikin8806a_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_813qqjrnxc43pmf50np2d1bikin8806a_`"]
    nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops["`**modules/sops**

_h1n4mccn0lnlynsvzzm1r3di62avjv9w_`"]
    nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops_templates["`**modules/sops/templates**

_h1n4mccn0lnlynsvzzm1r3di62avjv9w_`"]
    nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_h1n4mccn0lnlynsvzzm1r3di62avjv9w_`"]
    nb4zym9ax3kqw742f49g9bvhbj2vqbj5a_nixos["`**nixos**

_b4zym9ax3kqw742f49g9bvhbj2vqbj5a_`"]
    nb4zym9ax3kqw742f49g9bvhbj2vqbj5a_nixos_common_nix["`**nixos/common.nix**

_b4zym9ax3kqw742f49g9bvhbj2vqbj5a_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_global_nix["`**global.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico["`**configurations/nico**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_docker_nix["`**modules/docker.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_networkmanager_nix["`**modules/networkmanager.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_pipewire_nix["`**modules/pipewire.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_services_nix["`**configurations/nico/services.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_avahi_nix["`**modules/avahi.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_vasnrry3v0jgnrj2fxw2i1cis0p58lyk_`"]
    n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_flake_nix --> n813qqjrnxc43pmf50np2d1bikin8806a_module_nix
    n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_flake_nix --> nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops
    n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_flake_nix --> nb4zym9ax3kqw742f49g9bvhbj2vqbj5a_nixos
    n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_flake_nix --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_global_nix
    n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_flake_nix --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico
    n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_flake_nix --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos
    n813qqjrnxc43pmf50np2d1bikin8806a_module_nix --> n813qqjrnxc43pmf50np2d1bikin8806a_lib_make_disk_image_nix
    nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops --> nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops_templates
    nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops --> nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops_secrets_for_users
    nb4zym9ax3kqw742f49g9bvhbj2vqbj5a_nixos --> nb4zym9ax3kqw742f49g9bvhbj2vqbj5a_nixos_common_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_docker_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_networkmanager_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_boot_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_desktop_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_audio_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_virtualisation_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_services_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_packages_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_rclone_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_audio_nix --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_pipewire_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_services_nix --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_avahi_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_hardware_configuration_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos --> nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_mobile_network_nix
    nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_hardware_configuration_nix --> n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_nixos_modules_installer_scan_not_detected_nix
    style n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_flake_nix fill:#b2e1e5,color:#000000
    style n813qqjrnxc43pmf50np2d1bikin8806a_module_nix fill:#e5b2e1,color:#000000
    style n813qqjrnxc43pmf50np2d1bikin8806a_lib_make_disk_image_nix fill:#e5b2e1,color:#000000
    style nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops fill:#e5d1b2,color:#000000
    style nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops_templates fill:#e5d1b2,color:#000000
    style nh1n4mccn0lnlynsvzzm1r3di62avjv9w_modules_sops_secrets_for_users fill:#e5d1b2,color:#000000
    style nb4zym9ax3kqw742f49g9bvhbj2vqbj5a_nixos fill:#b2cde5,color:#000000
    style nb4zym9ax3kqw742f49g9bvhbj2vqbj5a_nixos_common_nix fill:#b2cde5,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_global_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_docker_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_networkmanager_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_boot_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_desktop_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_audio_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_pipewire_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_virtualisation_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_services_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_modules_avahi_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_packages_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_configurations_nico_rclone_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#e1e5b2,color:#000000
    style n450wvi1bmyk2m1w5cz8qi8y2v1n9q4vv_nixos_modules_installer_scan_not_detected_nix fill:#b2e1e5,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#e1e5b2,color:#000000
    style nvasnrry3v0jgnrj2fxw2i1cis0p58lyk_machines_nico_thinkpad_nixos_mobile_network_nix fill:#e1e5b2,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    nk2qcas8q021f80jmb1ix3xkxr6m69m5a_flake_nix["`**flake.nix**

_k2qcas8q021f80jmb1ix3xkxr6m69m5a_`"]
    nkav4krfnr08j0qnp0li0jjalj67wijav_module_nix["`**module.nix**

_kav4krfnr08j0qnp0li0jjalj67wijav_`"]
    nkav4krfnr08j0qnp0li0jjalj67wijav_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_kav4krfnr08j0qnp0li0jjalj67wijav_`"]
    nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops["`**modules/sops**

_mb800mqwxy0pp7lgbnzz1prq24mvjrjz_`"]
    nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops_templates["`**modules/sops/templates**

_mb800mqwxy0pp7lgbnzz1prq24mvjrjz_`"]
    nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_mb800mqwxy0pp7lgbnzz1prq24mvjrjz_`"]
    nll3mdywg4wyf883bjwfzhirajiiw27p6_nixos["`**nixos**

_ll3mdywg4wyf883bjwfzhirajiiw27p6_`"]
    nll3mdywg4wyf883bjwfzhirajiiw27p6_nixos_common_nix["`**nixos/common.nix**

_ll3mdywg4wyf883bjwfzhirajiiw27p6_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_global_nix["`**global.nix**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_configurations_nixos["`**configurations/nixos**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_modules_docker_nix["`**modules/docker.nix**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_modules_headlamp_nix["`**modules/headlamp.nix**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_modules_tmux_nix["`**modules/tmux.nix**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_wzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_`"]
    nk2qcas8q021f80jmb1ix3xkxr6m69m5a_flake_nix --> nkav4krfnr08j0qnp0li0jjalj67wijav_module_nix
    nk2qcas8q021f80jmb1ix3xkxr6m69m5a_flake_nix --> nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops
    nk2qcas8q021f80jmb1ix3xkxr6m69m5a_flake_nix --> nll3mdywg4wyf883bjwfzhirajiiw27p6_nixos
    nk2qcas8q021f80jmb1ix3xkxr6m69m5a_flake_nix --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_global_nix
    nk2qcas8q021f80jmb1ix3xkxr6m69m5a_flake_nix --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_configurations_nixos
    nk2qcas8q021f80jmb1ix3xkxr6m69m5a_flake_nix --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos
    nkav4krfnr08j0qnp0li0jjalj67wijav_module_nix --> nkav4krfnr08j0qnp0li0jjalj67wijav_lib_make_disk_image_nix
    nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops --> nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops_templates
    nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops --> nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops_secrets_for_users
    nll3mdywg4wyf883bjwfzhirajiiw27p6_nixos --> nll3mdywg4wyf883bjwfzhirajiiw27p6_nixos_common_nix
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_configurations_nixos --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_modules_docker_nix
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_configurations_nixos --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_modules_headlamp_nix
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_configurations_nixos --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_modules_tmux_nix
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_disk_configuration_nix
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_boot_nix
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_desktop_nix
    nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos --> nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_persistence_nix
    style nk2qcas8q021f80jmb1ix3xkxr6m69m5a_flake_nix fill:#b2cfe5,color:#000000
    style nkav4krfnr08j0qnp0li0jjalj67wijav_module_nix fill:#b2e5cd,color:#000000
    style nkav4krfnr08j0qnp0li0jjalj67wijav_lib_make_disk_image_nix fill:#b2e5cd,color:#000000
    style nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops fill:#e5b2df,color:#000000
    style nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops_templates fill:#e5b2df,color:#000000
    style nmb800mqwxy0pp7lgbnzz1prq24mvjrjz_modules_sops_secrets_for_users fill:#e5b2df,color:#000000
    style nll3mdywg4wyf883bjwfzhirajiiw27p6_nixos fill:#d8b2e5,color:#000000
    style nll3mdywg4wyf883bjwfzhirajiiw27p6_nixos_common_nix fill:#d8b2e5,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_global_nix fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_configurations_nixos fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_modules_docker_nix fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_modules_headlamp_nix fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_modules_tmux_nix fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_boot_nix fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_desktop_nix fill:#e5b3b2,color:#000000
    style nwzsvdq5zak21s0w9yk0pqrnkkzv6dsg4_machines_nixos_virtualbox_nixos_persistence_nix fill:#e5b3b2,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    nhh8v4inhki7dv04v9c0zlz4nqsxxb66w_flake_nix["`**flake.nix**

_hh8v4inhki7dv04v9c0zlz4nqsxxb66w_`"]
    nnwv7dk7mh5gsay9fkva1miihk8rz1y71_module_nix["`**module.nix**

_nwv7dk7mh5gsay9fkva1miihk8rz1y71_`"]
    nnwv7dk7mh5gsay9fkva1miihk8rz1y71_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_nwv7dk7mh5gsay9fkva1miihk8rz1y71_`"]
    n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops["`**modules/sops**

_786vwj556k9bjjc9ynzqs1n2kqkig1c7_`"]
    n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops_templates["`**modules/sops/templates**

_786vwj556k9bjjc9ynzqs1n2kqkig1c7_`"]
    n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_786vwj556k9bjjc9ynzqs1n2kqkig1c7_`"]
    nszn65m44kkv76y0fr4hpsim8g9lv0lps_nixos["`**nixos**

_szn65m44kkv76y0fr4hpsim8g9lv0lps_`"]
    nszn65m44kkv76y0fr4hpsim8g9lv0lps_nixos_common_nix["`**nixos/common.nix**

_szn65m44kkv76y0fr4hpsim8g9lv0lps_`"]
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_global_nix["`**global.nix**

_lffj12ybq2522gm0xb8dgjn5g2n3ab22_`"]
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_configurations_nixos["`**configurations/nixos**

_lffj12ybq2522gm0xb8dgjn5g2n3ab22_`"]
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_modules_docker_nix["`**modules/docker.nix**

_lffj12ybq2522gm0xb8dgjn5g2n3ab22_`"]
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_modules_headlamp_nix["`**modules/headlamp.nix**

_lffj12ybq2522gm0xb8dgjn5g2n3ab22_`"]
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_modules_tmux_nix["`**modules/tmux.nix**

_lffj12ybq2522gm0xb8dgjn5g2n3ab22_`"]
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_lffj12ybq2522gm0xb8dgjn5g2n3ab22_`"]
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_lffj12ybq2522gm0xb8dgjn5g2n3ab22_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules["`**modules**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_build_tarball_nix["`**modules/build-tarball.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_interop_nix["`**modules/interop.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_recovery_nix["`**modules/recovery.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd["`**modules/systemd**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd_native["`**modules/systemd/native**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_usbip_nix["`**modules/usbip.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_version_nix["`**modules/version.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_welcome_nix["`**modules/welcome.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_6is85q3sk84g5zxamc9cm6bzwirlv18b_`"]
    nhh8v4inhki7dv04v9c0zlz4nqsxxb66w_flake_nix --> nnwv7dk7mh5gsay9fkva1miihk8rz1y71_module_nix
    nhh8v4inhki7dv04v9c0zlz4nqsxxb66w_flake_nix --> n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops
    nhh8v4inhki7dv04v9c0zlz4nqsxxb66w_flake_nix --> nszn65m44kkv76y0fr4hpsim8g9lv0lps_nixos
    nhh8v4inhki7dv04v9c0zlz4nqsxxb66w_flake_nix --> nlffj12ybq2522gm0xb8dgjn5g2n3ab22_global_nix
    nhh8v4inhki7dv04v9c0zlz4nqsxxb66w_flake_nix --> nlffj12ybq2522gm0xb8dgjn5g2n3ab22_configurations_nixos
    nhh8v4inhki7dv04v9c0zlz4nqsxxb66w_flake_nix --> nlffj12ybq2522gm0xb8dgjn5g2n3ab22_machines_nixos_wsl_nixos
    nnwv7dk7mh5gsay9fkva1miihk8rz1y71_module_nix --> nnwv7dk7mh5gsay9fkva1miihk8rz1y71_lib_make_disk_image_nix
    n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops --> n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops_templates
    n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops --> n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops_secrets_for_users
    nszn65m44kkv76y0fr4hpsim8g9lv0lps_nixos --> nszn65m44kkv76y0fr4hpsim8g9lv0lps_nixos_common_nix
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_configurations_nixos --> nlffj12ybq2522gm0xb8dgjn5g2n3ab22_modules_docker_nix
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_configurations_nixos --> nlffj12ybq2522gm0xb8dgjn5g2n3ab22_modules_headlamp_nix
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_configurations_nixos --> nlffj12ybq2522gm0xb8dgjn5g2n3ab22_modules_tmux_nix
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_machines_nixos_wsl_nixos --> nlffj12ybq2522gm0xb8dgjn5g2n3ab22_machines_nixos_wsl_nixos_hardware_configuration_nix
    nlffj12ybq2522gm0xb8dgjn5g2n3ab22_machines_nixos_wsl_nixos --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_build_tarball_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_docker_desktop_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_interop_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_recovery_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_ssh_agent_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_usbip_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_version_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_welcome_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_wsl_conf_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_wsl_distro_nix
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd_native
    n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd_native --> n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd_native_wrap_shell_nix
    style nhh8v4inhki7dv04v9c0zlz4nqsxxb66w_flake_nix fill:#b2c4e5,color:#000000
    style nnwv7dk7mh5gsay9fkva1miihk8rz1y71_module_nix fill:#b2e5bb,color:#000000
    style nnwv7dk7mh5gsay9fkva1miihk8rz1y71_lib_make_disk_image_nix fill:#b2e5bb,color:#000000
    style n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops fill:#e5d0b2,color:#000000
    style n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops_templates fill:#e5d0b2,color:#000000
    style n786vwj556k9bjjc9ynzqs1n2kqkig1c7_modules_sops_secrets_for_users fill:#e5d0b2,color:#000000
    style nszn65m44kkv76y0fr4hpsim8g9lv0lps_nixos fill:#b2cbe5,color:#000000
    style nszn65m44kkv76y0fr4hpsim8g9lv0lps_nixos_common_nix fill:#b2cbe5,color:#000000
    style nlffj12ybq2522gm0xb8dgjn5g2n3ab22_global_nix fill:#b2e5d1,color:#000000
    style nlffj12ybq2522gm0xb8dgjn5g2n3ab22_configurations_nixos fill:#b2e5d1,color:#000000
    style nlffj12ybq2522gm0xb8dgjn5g2n3ab22_modules_docker_nix fill:#b2e5d1,color:#000000
    style nlffj12ybq2522gm0xb8dgjn5g2n3ab22_modules_headlamp_nix fill:#b2e5d1,color:#000000
    style nlffj12ybq2522gm0xb8dgjn5g2n3ab22_modules_tmux_nix fill:#b2e5d1,color:#000000
    style nlffj12ybq2522gm0xb8dgjn5g2n3ab22_machines_nixos_wsl_nixos fill:#b2e5d1,color:#000000
    style nlffj12ybq2522gm0xb8dgjn5g2n3ab22_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#b2e5d1,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_build_tarball_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_docker_desktop_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_interop_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_recovery_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_ssh_agent_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd_native fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_systemd_native_wrap_shell_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_usbip_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_version_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_welcome_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_wsl_conf_nix fill:#e5d8b2,color:#000000
    style n6is85q3sk84g5zxamc9cm6bzwirlv18b_modules_wsl_distro_nix fill:#e5d8b2,color:#000000
```
