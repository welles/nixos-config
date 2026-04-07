# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_flake_nix["`**flake.nix**

_71k0ca0dv8gr18hmw5c57mjcpamfs9dz_`"]
    n6zzzyrcrhxn11fz0ya29np9z1wvg46wh_module_nix["`**module.nix**

_6zzzyrcrhxn11fz0ya29np9z1wvg46wh_`"]
    n6zzzyrcrhxn11fz0ya29np9z1wvg46wh_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_6zzzyrcrhxn11fz0ya29np9z1wvg46wh_`"]
    nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops["`**modules/sops**

_lwp602m6sibsivn1zvrlnhah4sk18ln2_`"]
    nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops_templates["`**modules/sops/templates**

_lwp602m6sibsivn1zvrlnhah4sk18ln2_`"]
    nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_lwp602m6sibsivn1zvrlnhah4sk18ln2_`"]
    n3h9pkq9njnmgyh0l4vqs1gb71qjw1196_nixos["`**nixos**

_3h9pkq9njnmgyh0l4vqs1gb71qjw1196_`"]
    n3h9pkq9njnmgyh0l4vqs1gb71qjw1196_nixos_common_nix["`**nixos/common.nix**

_3h9pkq9njnmgyh0l4vqs1gb71qjw1196_`"]
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_global_nix["`**global.nix**

_kk0z0bkjv2r1k25mn7ncpqp77w57x5hm_`"]
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_configurations_eltern["`**configurations/eltern**

_kk0z0bkjv2r1k25mn7ncpqp77w57x5hm_`"]
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_modules_networkmanager_nix["`**modules/networkmanager.nix**

_kk0z0bkjv2r1k25mn7ncpqp77w57x5hm_`"]
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_modules_avahi_nix["`**modules/avahi.nix**

_kk0z0bkjv2r1k25mn7ncpqp77w57x5hm_`"]
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_kk0z0bkjv2r1k25mn7ncpqp77w57x5hm_`"]
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_kk0z0bkjv2r1k25mn7ncpqp77w57x5hm_`"]
    n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_71k0ca0dv8gr18hmw5c57mjcpamfs9dz_`"]
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_kk0z0bkjv2r1k25mn7ncpqp77w57x5hm_`"]
    n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_flake_nix --> n6zzzyrcrhxn11fz0ya29np9z1wvg46wh_module_nix
    n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_flake_nix --> nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops
    n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_flake_nix --> n3h9pkq9njnmgyh0l4vqs1gb71qjw1196_nixos
    n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_flake_nix --> nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_global_nix
    n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_flake_nix --> nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_configurations_eltern
    n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_flake_nix --> nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos
    n6zzzyrcrhxn11fz0ya29np9z1wvg46wh_module_nix --> n6zzzyrcrhxn11fz0ya29np9z1wvg46wh_lib_make_disk_image_nix
    nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops --> nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops_templates
    nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops --> nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops_secrets_for_users
    n3h9pkq9njnmgyh0l4vqs1gb71qjw1196_nixos --> n3h9pkq9njnmgyh0l4vqs1gb71qjw1196_nixos_common_nix
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_configurations_eltern --> nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_modules_networkmanager_nix
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_configurations_eltern --> nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_modules_avahi_nix
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos --> nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos_hardware_configuration_nix
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos --> nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos_disk_configuration_nix
    nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos_hardware_configuration_nix --> n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_nixos_modules_installer_scan_not_detected_nix
    style n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_flake_nix fill:#b2e5b2,color:#000000
    style n6zzzyrcrhxn11fz0ya29np9z1wvg46wh_module_nix fill:#b2e5c6,color:#000000
    style n6zzzyrcrhxn11fz0ya29np9z1wvg46wh_lib_make_disk_image_nix fill:#b2e5c6,color:#000000
    style nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops fill:#c7e5b2,color:#000000
    style nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops_templates fill:#c7e5b2,color:#000000
    style nlwp602m6sibsivn1zvrlnhah4sk18ln2_modules_sops_secrets_for_users fill:#c7e5b2,color:#000000
    style n3h9pkq9njnmgyh0l4vqs1gb71qjw1196_nixos fill:#ceb2e5,color:#000000
    style n3h9pkq9njnmgyh0l4vqs1gb71qjw1196_nixos_common_nix fill:#ceb2e5,color:#000000
    style nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_global_nix fill:#cbe5b2,color:#000000
    style nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_configurations_eltern fill:#cbe5b2,color:#000000
    style nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_modules_networkmanager_nix fill:#cbe5b2,color:#000000
    style nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_modules_avahi_nix fill:#cbe5b2,color:#000000
    style nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos fill:#cbe5b2,color:#000000
    style nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos_hardware_configuration_nix fill:#cbe5b2,color:#000000
    style n71k0ca0dv8gr18hmw5c57mjcpamfs9dz_nixos_modules_installer_scan_not_detected_nix fill:#b2e5b2,color:#000000
    style nkk0z0bkjv2r1k25mn7ncpqp77w57x5hm_machines_eltern_asus_nixos_disk_configuration_nix fill:#cbe5b2,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_flake_nix["`**flake.nix**

_gi9jay1g1c90m81ig7kzafbjcy8xxf4f_`"]
    n990n5z9l79pzvxb0jnchn5ppf0ikmxv9_module_nix["`**module.nix**

_990n5z9l79pzvxb0jnchn5ppf0ikmxv9_`"]
    n990n5z9l79pzvxb0jnchn5ppf0ikmxv9_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_990n5z9l79pzvxb0jnchn5ppf0ikmxv9_`"]
    n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops["`**modules/sops**

_9gr7w3sblhdazr575xx7skwh2xlyk0lb_`"]
    n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops_templates["`**modules/sops/templates**

_9gr7w3sblhdazr575xx7skwh2xlyk0lb_`"]
    n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_9gr7w3sblhdazr575xx7skwh2xlyk0lb_`"]
    ngvad23wdp5mg0mjkn6kkiyyz4ck3xf2v_nixos["`**nixos**

_gvad23wdp5mg0mjkn6kkiyyz4ck3xf2v_`"]
    ngvad23wdp5mg0mjkn6kkiyyz4ck3xf2v_nixos_common_nix["`**nixos/common.nix**

_gvad23wdp5mg0mjkn6kkiyyz4ck3xf2v_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_global_nix["`**global.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch["`**configurations/schokoladenelch**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_docker_nix["`**modules/docker.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_networkmanager_nix["`**modules/networkmanager.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_tmux_nix["`**modules/tmux.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_stacks_default_nix["`**modules/stacks/default.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_gi9jay1g1c90m81ig7kzafbjcy8xxf4f_`"]
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_qjfd3lx3mll50w14lb4d6q5jqg0a16r9_`"]
    ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_flake_nix --> n990n5z9l79pzvxb0jnchn5ppf0ikmxv9_module_nix
    ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_flake_nix --> n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops
    ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_flake_nix --> ngvad23wdp5mg0mjkn6kkiyyz4ck3xf2v_nixos
    ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_flake_nix --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_global_nix
    ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_flake_nix --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch
    ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_flake_nix --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos
    n990n5z9l79pzvxb0jnchn5ppf0ikmxv9_module_nix --> n990n5z9l79pzvxb0jnchn5ppf0ikmxv9_lib_make_disk_image_nix
    n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops --> n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops_templates
    n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops --> n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops_secrets_for_users
    ngvad23wdp5mg0mjkn6kkiyyz4ck3xf2v_nixos --> ngvad23wdp5mg0mjkn6kkiyyz4ck3xf2v_nixos_common_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_docker_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_networkmanager_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_tmux_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_boot_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_networking_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_services_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_persistence_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_stacks_default_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos --> nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_nixos_modules_installer_scan_not_detected_nix
    style ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_flake_nix fill:#bae5b2,color:#000000
    style n990n5z9l79pzvxb0jnchn5ppf0ikmxv9_module_nix fill:#b2e5e0,color:#000000
    style n990n5z9l79pzvxb0jnchn5ppf0ikmxv9_lib_make_disk_image_nix fill:#b2e5e0,color:#000000
    style n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops fill:#b2e5c2,color:#000000
    style n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops_templates fill:#b2e5c2,color:#000000
    style n9gr7w3sblhdazr575xx7skwh2xlyk0lb_modules_sops_secrets_for_users fill:#b2e5c2,color:#000000
    style ngvad23wdp5mg0mjkn6kkiyyz4ck3xf2v_nixos fill:#e5ccb2,color:#000000
    style ngvad23wdp5mg0mjkn6kkiyyz4ck3xf2v_nixos_common_nix fill:#e5ccb2,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_global_nix fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_docker_nix fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_networkmanager_nix fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_tmux_nix fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_boot_nix fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_networking_nix fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_services_nix fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_configurations_schokoladenelch_persistence_nix fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_modules_stacks_default_nix fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos fill:#cbb2e5,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#cbb2e5,color:#000000
    style ngi9jay1g1c90m81ig7kzafbjcy8xxf4f_nixos_modules_installer_scan_not_detected_nix fill:#bae5b2,color:#000000
    style nqjfd3lx3mll50w14lb4d6q5jqg0a16r9_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#cbb2e5,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    nk172i1gd39m82cxd93v33sg1sdalr3cv_flake_nix["`**flake.nix**

_k172i1gd39m82cxd93v33sg1sdalr3cv_`"]
    n15qvz0cjvxbyi51nsgydb3xada0lqhqv_module_nix["`**module.nix**

_15qvz0cjvxbyi51nsgydb3xada0lqhqv_`"]
    n15qvz0cjvxbyi51nsgydb3xada0lqhqv_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_15qvz0cjvxbyi51nsgydb3xada0lqhqv_`"]
    n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops["`**modules/sops**

_771zk6qj9ab60q2rl8kqlsphs4d0iszy_`"]
    n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops_templates["`**modules/sops/templates**

_771zk6qj9ab60q2rl8kqlsphs4d0iszy_`"]
    n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_771zk6qj9ab60q2rl8kqlsphs4d0iszy_`"]
    n0nzpahn13cg46pdq9nlnsa4sg61ih8wq_nixos["`**nixos**

_0nzpahn13cg46pdq9nlnsa4sg61ih8wq_`"]
    n0nzpahn13cg46pdq9nlnsa4sg61ih8wq_nixos_common_nix["`**nixos/common.nix**

_0nzpahn13cg46pdq9nlnsa4sg61ih8wq_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_global_nix["`**global.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico["`**configurations/nico**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_docker_nix["`**modules/docker.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_networkmanager_nix["`**modules/networkmanager.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_pipewire_nix["`**modules/pipewire.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_services_nix["`**configurations/nico/services.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_avahi_nix["`**modules/avahi.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nk172i1gd39m82cxd93v33sg1sdalr3cv_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_k172i1gd39m82cxd93v33sg1sdalr3cv_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_eden["`**modules/eden**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_xone_dongle["`**modules/xone-dongle**

_hs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_`"]
    nk172i1gd39m82cxd93v33sg1sdalr3cv_flake_nix --> n15qvz0cjvxbyi51nsgydb3xada0lqhqv_module_nix
    nk172i1gd39m82cxd93v33sg1sdalr3cv_flake_nix --> n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops
    nk172i1gd39m82cxd93v33sg1sdalr3cv_flake_nix --> n0nzpahn13cg46pdq9nlnsa4sg61ih8wq_nixos
    nk172i1gd39m82cxd93v33sg1sdalr3cv_flake_nix --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_global_nix
    nk172i1gd39m82cxd93v33sg1sdalr3cv_flake_nix --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico
    nk172i1gd39m82cxd93v33sg1sdalr3cv_flake_nix --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos
    n15qvz0cjvxbyi51nsgydb3xada0lqhqv_module_nix --> n15qvz0cjvxbyi51nsgydb3xada0lqhqv_lib_make_disk_image_nix
    n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops --> n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops_templates
    n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops --> n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops_secrets_for_users
    n0nzpahn13cg46pdq9nlnsa4sg61ih8wq_nixos --> n0nzpahn13cg46pdq9nlnsa4sg61ih8wq_nixos_common_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_docker_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_networkmanager_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_boot_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_desktop_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_audio_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_virtualisation_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_services_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_packages_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_rclone_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_audio_nix --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_pipewire_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_services_nix --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_avahi_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos_hardware_configuration_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_eden
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos --> nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_xone_dongle
    nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos_hardware_configuration_nix --> nk172i1gd39m82cxd93v33sg1sdalr3cv_nixos_modules_installer_scan_not_detected_nix
    style nk172i1gd39m82cxd93v33sg1sdalr3cv_flake_nix fill:#c6b2e5,color:#000000
    style n15qvz0cjvxbyi51nsgydb3xada0lqhqv_module_nix fill:#e5ceb2,color:#000000
    style n15qvz0cjvxbyi51nsgydb3xada0lqhqv_lib_make_disk_image_nix fill:#e5ceb2,color:#000000
    style n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops fill:#b2e5c2,color:#000000
    style n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops_templates fill:#b2e5c2,color:#000000
    style n771zk6qj9ab60q2rl8kqlsphs4d0iszy_modules_sops_secrets_for_users fill:#b2e5c2,color:#000000
    style n0nzpahn13cg46pdq9nlnsa4sg61ih8wq_nixos fill:#dbe5b2,color:#000000
    style n0nzpahn13cg46pdq9nlnsa4sg61ih8wq_nixos_common_nix fill:#dbe5b2,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_global_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_docker_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_networkmanager_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_boot_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_desktop_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_audio_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_pipewire_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_virtualisation_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_services_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_avahi_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_packages_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_configurations_nico_rclone_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#b2b2e5,color:#000000
    style nk172i1gd39m82cxd93v33sg1sdalr3cv_nixos_modules_installer_scan_not_detected_nix fill:#c6b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_eden fill:#b2b2e5,color:#000000
    style nhs4f7vi0fcmi3yk3pkpdqd4h5730fkaw_modules_xone_dongle fill:#b2b2e5,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    nwnvgdwz6h79mahcymlvcyniirc023wfa_flake_nix["`**flake.nix**

_wnvgdwz6h79mahcymlvcyniirc023wfa_`"]
    n5jvh7cz5xijlfc9cgy3ia69gpkw2bq3n_module_nix["`**module.nix**

_5jvh7cz5xijlfc9cgy3ia69gpkw2bq3n_`"]
    n5jvh7cz5xijlfc9cgy3ia69gpkw2bq3n_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_5jvh7cz5xijlfc9cgy3ia69gpkw2bq3n_`"]
    njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops["`**modules/sops**

_jm0j3s9x1mx946pwmrpjdng59bhhxpsz_`"]
    njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops_templates["`**modules/sops/templates**

_jm0j3s9x1mx946pwmrpjdng59bhhxpsz_`"]
    njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_jm0j3s9x1mx946pwmrpjdng59bhhxpsz_`"]
    nw32nyzklk4alb941za9yn6v5wrvjzp8s_nixos["`**nixos**

_w32nyzklk4alb941za9yn6v5wrvjzp8s_`"]
    nw32nyzklk4alb941za9yn6v5wrvjzp8s_nixos_common_nix["`**nixos/common.nix**

_w32nyzklk4alb941za9yn6v5wrvjzp8s_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_global_nix["`**global.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico["`**configurations/nico**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_modules_docker_nix["`**modules/docker.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_modules_networkmanager_nix["`**modules/networkmanager.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_modules_pipewire_nix["`**modules/pipewire.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_services_nix["`**configurations/nico/services.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_modules_avahi_nix["`**modules/avahi.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nwnvgdwz6h79mahcymlvcyniirc023wfa_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_wnvgdwz6h79mahcymlvcyniirc023wfa_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_ilhfrn3x845k38x7fcz076qkczqh29a5_`"]
    nwnvgdwz6h79mahcymlvcyniirc023wfa_flake_nix --> n5jvh7cz5xijlfc9cgy3ia69gpkw2bq3n_module_nix
    nwnvgdwz6h79mahcymlvcyniirc023wfa_flake_nix --> njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops
    nwnvgdwz6h79mahcymlvcyniirc023wfa_flake_nix --> nw32nyzklk4alb941za9yn6v5wrvjzp8s_nixos
    nwnvgdwz6h79mahcymlvcyniirc023wfa_flake_nix --> nilhfrn3x845k38x7fcz076qkczqh29a5_global_nix
    nwnvgdwz6h79mahcymlvcyniirc023wfa_flake_nix --> nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico
    nwnvgdwz6h79mahcymlvcyniirc023wfa_flake_nix --> nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos
    n5jvh7cz5xijlfc9cgy3ia69gpkw2bq3n_module_nix --> n5jvh7cz5xijlfc9cgy3ia69gpkw2bq3n_lib_make_disk_image_nix
    njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops --> njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops_templates
    njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops --> njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops_secrets_for_users
    nw32nyzklk4alb941za9yn6v5wrvjzp8s_nixos --> nw32nyzklk4alb941za9yn6v5wrvjzp8s_nixos_common_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico --> nilhfrn3x845k38x7fcz076qkczqh29a5_modules_docker_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico --> nilhfrn3x845k38x7fcz076qkczqh29a5_modules_networkmanager_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico --> nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_boot_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico --> nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_desktop_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico --> nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_audio_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico --> nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_virtualisation_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico --> nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_services_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico --> nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_packages_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico --> nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_rclone_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_audio_nix --> nilhfrn3x845k38x7fcz076qkczqh29a5_modules_pipewire_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_services_nix --> nilhfrn3x845k38x7fcz076qkczqh29a5_modules_avahi_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos --> nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_hardware_configuration_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos --> nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos --> nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_mobile_network_nix
    nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_hardware_configuration_nix --> nwnvgdwz6h79mahcymlvcyniirc023wfa_nixos_modules_installer_scan_not_detected_nix
    style nwnvgdwz6h79mahcymlvcyniirc023wfa_flake_nix fill:#b2dde5,color:#000000
    style n5jvh7cz5xijlfc9cgy3ia69gpkw2bq3n_module_nix fill:#bfb2e5,color:#000000
    style n5jvh7cz5xijlfc9cgy3ia69gpkw2bq3n_lib_make_disk_image_nix fill:#bfb2e5,color:#000000
    style njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops fill:#e5bab2,color:#000000
    style njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops_templates fill:#e5bab2,color:#000000
    style njm0j3s9x1mx946pwmrpjdng59bhhxpsz_modules_sops_secrets_for_users fill:#e5bab2,color:#000000
    style nw32nyzklk4alb941za9yn6v5wrvjzp8s_nixos fill:#b2e5c9,color:#000000
    style nw32nyzklk4alb941za9yn6v5wrvjzp8s_nixos_common_nix fill:#b2e5c9,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_global_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_modules_docker_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_modules_networkmanager_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_boot_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_desktop_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_audio_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_modules_pipewire_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_virtualisation_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_services_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_modules_avahi_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_packages_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_configurations_nico_rclone_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#b2e5c7,color:#000000
    style nwnvgdwz6h79mahcymlvcyniirc023wfa_nixos_modules_installer_scan_not_detected_nix fill:#b2dde5,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#b2e5c7,color:#000000
    style nilhfrn3x845k38x7fcz076qkczqh29a5_machines_nico_thinkpad_nixos_mobile_network_nix fill:#b2e5c7,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    nja57w20n01x9b4a36p24jaqi5gc6xqim_flake_nix["`**flake.nix**

_ja57w20n01x9b4a36p24jaqi5gc6xqim_`"]
    nbrsc32jvxwasly2aikz8gv5pscfxgb2h_module_nix["`**module.nix**

_brsc32jvxwasly2aikz8gv5pscfxgb2h_`"]
    nbrsc32jvxwasly2aikz8gv5pscfxgb2h_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_brsc32jvxwasly2aikz8gv5pscfxgb2h_`"]
    n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops["`**modules/sops**

_4sr94qfajn6rcqcldxc88rsp79x215j2_`"]
    n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops_templates["`**modules/sops/templates**

_4sr94qfajn6rcqcldxc88rsp79x215j2_`"]
    n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_4sr94qfajn6rcqcldxc88rsp79x215j2_`"]
    nrc706pb8fc02d4hy0fqvirmamd3ijbq9_nixos["`**nixos**

_rc706pb8fc02d4hy0fqvirmamd3ijbq9_`"]
    nrc706pb8fc02d4hy0fqvirmamd3ijbq9_nixos_common_nix["`**nixos/common.nix**

_rc706pb8fc02d4hy0fqvirmamd3ijbq9_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_global_nix["`**global.nix**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_configurations_nixos["`**configurations/nixos**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_modules_docker_nix["`**modules/docker.nix**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_modules_headlamp_nix["`**modules/headlamp.nix**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_modules_tmux_nix["`**modules/tmux.nix**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_r59jzgc323lg8x3lqim7kr47dwm59i20_`"]
    nja57w20n01x9b4a36p24jaqi5gc6xqim_flake_nix --> nbrsc32jvxwasly2aikz8gv5pscfxgb2h_module_nix
    nja57w20n01x9b4a36p24jaqi5gc6xqim_flake_nix --> n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops
    nja57w20n01x9b4a36p24jaqi5gc6xqim_flake_nix --> nrc706pb8fc02d4hy0fqvirmamd3ijbq9_nixos
    nja57w20n01x9b4a36p24jaqi5gc6xqim_flake_nix --> nr59jzgc323lg8x3lqim7kr47dwm59i20_global_nix
    nja57w20n01x9b4a36p24jaqi5gc6xqim_flake_nix --> nr59jzgc323lg8x3lqim7kr47dwm59i20_configurations_nixos
    nja57w20n01x9b4a36p24jaqi5gc6xqim_flake_nix --> nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos
    nbrsc32jvxwasly2aikz8gv5pscfxgb2h_module_nix --> nbrsc32jvxwasly2aikz8gv5pscfxgb2h_lib_make_disk_image_nix
    n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops --> n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops_templates
    n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops --> n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops_secrets_for_users
    nrc706pb8fc02d4hy0fqvirmamd3ijbq9_nixos --> nrc706pb8fc02d4hy0fqvirmamd3ijbq9_nixos_common_nix
    nr59jzgc323lg8x3lqim7kr47dwm59i20_configurations_nixos --> nr59jzgc323lg8x3lqim7kr47dwm59i20_modules_docker_nix
    nr59jzgc323lg8x3lqim7kr47dwm59i20_configurations_nixos --> nr59jzgc323lg8x3lqim7kr47dwm59i20_modules_headlamp_nix
    nr59jzgc323lg8x3lqim7kr47dwm59i20_configurations_nixos --> nr59jzgc323lg8x3lqim7kr47dwm59i20_modules_tmux_nix
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos --> nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos --> nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_disk_configuration_nix
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos --> nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_boot_nix
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos --> nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_desktop_nix
    nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos --> nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_persistence_nix
    style nja57w20n01x9b4a36p24jaqi5gc6xqim_flake_nix fill:#e0b2e5,color:#000000
    style nbrsc32jvxwasly2aikz8gv5pscfxgb2h_module_nix fill:#c6e5b2,color:#000000
    style nbrsc32jvxwasly2aikz8gv5pscfxgb2h_lib_make_disk_image_nix fill:#c6e5b2,color:#000000
    style n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops fill:#b2e5e5,color:#000000
    style n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops_templates fill:#b2e5e5,color:#000000
    style n4sr94qfajn6rcqcldxc88rsp79x215j2_modules_sops_secrets_for_users fill:#b2e5e5,color:#000000
    style nrc706pb8fc02d4hy0fqvirmamd3ijbq9_nixos fill:#b2e5ba,color:#000000
    style nrc706pb8fc02d4hy0fqvirmamd3ijbq9_nixos_common_nix fill:#b2e5ba,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_global_nix fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_configurations_nixos fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_modules_docker_nix fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_modules_headlamp_nix fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_modules_tmux_nix fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_boot_nix fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_desktop_nix fill:#b2e5dd,color:#000000
    style nr59jzgc323lg8x3lqim7kr47dwm59i20_machines_nixos_virtualbox_nixos_persistence_nix fill:#b2e5dd,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    naibgy8mbnwz8zjabpr5q9lpvx4kvsr91_flake_nix["`**flake.nix**

_aibgy8mbnwz8zjabpr5q9lpvx4kvsr91_`"]
    n7mpwbgfih5hd0ixb5xix2by8sm66imi6_module_nix["`**module.nix**

_7mpwbgfih5hd0ixb5xix2by8sm66imi6_`"]
    n7mpwbgfih5hd0ixb5xix2by8sm66imi6_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_7mpwbgfih5hd0ixb5xix2by8sm66imi6_`"]
    ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops["`**modules/sops**

_s963ljh0s5l34qkizcm4acflfj5ilfvm_`"]
    ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops_templates["`**modules/sops/templates**

_s963ljh0s5l34qkizcm4acflfj5ilfvm_`"]
    ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_s963ljh0s5l34qkizcm4acflfj5ilfvm_`"]
    nkxqwamdzjvlqsl8r7pvp0nrqs4sy11bx_nixos["`**nixos**

_kxqwamdzjvlqsl8r7pvp0nrqs4sy11bx_`"]
    nkxqwamdzjvlqsl8r7pvp0nrqs4sy11bx_nixos_common_nix["`**nixos/common.nix**

_kxqwamdzjvlqsl8r7pvp0nrqs4sy11bx_`"]
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_global_nix["`**global.nix**

_1pg40x7rf7w9c3j24xgmcqfy897mr12g_`"]
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_configurations_nixos["`**configurations/nixos**

_1pg40x7rf7w9c3j24xgmcqfy897mr12g_`"]
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_modules_docker_nix["`**modules/docker.nix**

_1pg40x7rf7w9c3j24xgmcqfy897mr12g_`"]
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_modules_headlamp_nix["`**modules/headlamp.nix**

_1pg40x7rf7w9c3j24xgmcqfy897mr12g_`"]
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_modules_tmux_nix["`**modules/tmux.nix**

_1pg40x7rf7w9c3j24xgmcqfy897mr12g_`"]
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_1pg40x7rf7w9c3j24xgmcqfy897mr12g_`"]
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_1pg40x7rf7w9c3j24xgmcqfy897mr12g_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules["`**modules**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_build_tarball_nix["`**modules/build-tarball.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_interop_nix["`**modules/interop.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_recovery_nix["`**modules/recovery.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd["`**modules/systemd**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd_native["`**modules/systemd/native**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_usbip_nix["`**modules/usbip.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_version_nix["`**modules/version.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_welcome_nix["`**modules/welcome.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_mlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_`"]
    naibgy8mbnwz8zjabpr5q9lpvx4kvsr91_flake_nix --> n7mpwbgfih5hd0ixb5xix2by8sm66imi6_module_nix
    naibgy8mbnwz8zjabpr5q9lpvx4kvsr91_flake_nix --> ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops
    naibgy8mbnwz8zjabpr5q9lpvx4kvsr91_flake_nix --> nkxqwamdzjvlqsl8r7pvp0nrqs4sy11bx_nixos
    naibgy8mbnwz8zjabpr5q9lpvx4kvsr91_flake_nix --> n1pg40x7rf7w9c3j24xgmcqfy897mr12g_global_nix
    naibgy8mbnwz8zjabpr5q9lpvx4kvsr91_flake_nix --> n1pg40x7rf7w9c3j24xgmcqfy897mr12g_configurations_nixos
    naibgy8mbnwz8zjabpr5q9lpvx4kvsr91_flake_nix --> n1pg40x7rf7w9c3j24xgmcqfy897mr12g_machines_nixos_wsl_nixos
    n7mpwbgfih5hd0ixb5xix2by8sm66imi6_module_nix --> n7mpwbgfih5hd0ixb5xix2by8sm66imi6_lib_make_disk_image_nix
    ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops --> ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops_templates
    ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops --> ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops_secrets_for_users
    nkxqwamdzjvlqsl8r7pvp0nrqs4sy11bx_nixos --> nkxqwamdzjvlqsl8r7pvp0nrqs4sy11bx_nixos_common_nix
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_configurations_nixos --> n1pg40x7rf7w9c3j24xgmcqfy897mr12g_modules_docker_nix
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_configurations_nixos --> n1pg40x7rf7w9c3j24xgmcqfy897mr12g_modules_headlamp_nix
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_configurations_nixos --> n1pg40x7rf7w9c3j24xgmcqfy897mr12g_modules_tmux_nix
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_machines_nixos_wsl_nixos --> n1pg40x7rf7w9c3j24xgmcqfy897mr12g_machines_nixos_wsl_nixos_hardware_configuration_nix
    n1pg40x7rf7w9c3j24xgmcqfy897mr12g_machines_nixos_wsl_nixos --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_build_tarball_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_docker_desktop_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_interop_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_recovery_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_ssh_agent_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_usbip_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_version_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_welcome_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_wsl_conf_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_wsl_distro_nix
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd_native
    nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd_native --> nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd_native_wrap_shell_nix
    style naibgy8mbnwz8zjabpr5q9lpvx4kvsr91_flake_nix fill:#e5b2cc,color:#000000
    style n7mpwbgfih5hd0ixb5xix2by8sm66imi6_module_nix fill:#bfb2e5,color:#000000
    style n7mpwbgfih5hd0ixb5xix2by8sm66imi6_lib_make_disk_image_nix fill:#bfb2e5,color:#000000
    style ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops fill:#b2e5ca,color:#000000
    style ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops_templates fill:#b2e5ca,color:#000000
    style ns963ljh0s5l34qkizcm4acflfj5ilfvm_modules_sops_secrets_for_users fill:#b2e5ca,color:#000000
    style nkxqwamdzjvlqsl8r7pvp0nrqs4sy11bx_nixos fill:#b2b4e5,color:#000000
    style nkxqwamdzjvlqsl8r7pvp0nrqs4sy11bx_nixos_common_nix fill:#b2b4e5,color:#000000
    style n1pg40x7rf7w9c3j24xgmcqfy897mr12g_global_nix fill:#ccb2e5,color:#000000
    style n1pg40x7rf7w9c3j24xgmcqfy897mr12g_configurations_nixos fill:#ccb2e5,color:#000000
    style n1pg40x7rf7w9c3j24xgmcqfy897mr12g_modules_docker_nix fill:#ccb2e5,color:#000000
    style n1pg40x7rf7w9c3j24xgmcqfy897mr12g_modules_headlamp_nix fill:#ccb2e5,color:#000000
    style n1pg40x7rf7w9c3j24xgmcqfy897mr12g_modules_tmux_nix fill:#ccb2e5,color:#000000
    style n1pg40x7rf7w9c3j24xgmcqfy897mr12g_machines_nixos_wsl_nixos fill:#ccb2e5,color:#000000
    style n1pg40x7rf7w9c3j24xgmcqfy897mr12g_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#ccb2e5,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_build_tarball_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_docker_desktop_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_interop_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_recovery_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_ssh_agent_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd_native fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_systemd_native_wrap_shell_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_usbip_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_version_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_welcome_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_wsl_conf_nix fill:#e5b2e4,color:#000000
    style nmlg5gr5wq2bvjzx9zwqgigv3df8p7gzp_modules_wsl_distro_nix fill:#e5b2e4,color:#000000
```
