# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_flake_nix["`**flake.nix**

_qfl13kyhghdkfalgjpvqd9akj5jz1s2q_`"]
    n6v1033mwv25lwcrpmd6v7c3a6f54fl66_module_nix["`**module.nix**

_6v1033mwv25lwcrpmd6v7c3a6f54fl66_`"]
    n6v1033mwv25lwcrpmd6v7c3a6f54fl66_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_6v1033mwv25lwcrpmd6v7c3a6f54fl66_`"]
    nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops["`**modules/sops**

_afiz5qjgd4j1m87ijaa8f33vzv4ba85w_`"]
    nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops_templates["`**modules/sops/templates**

_afiz5qjgd4j1m87ijaa8f33vzv4ba85w_`"]
    nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_afiz5qjgd4j1m87ijaa8f33vzv4ba85w_`"]
    npndpp56mw7qmb2nr9k07yiqwl0zanp0q_nixos["`**nixos**

_pndpp56mw7qmb2nr9k07yiqwl0zanp0q_`"]
    npndpp56mw7qmb2nr9k07yiqwl0zanp0q_nixos_common_nix["`**nixos/common.nix**

_pndpp56mw7qmb2nr9k07yiqwl0zanp0q_`"]
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_global_nix["`**global.nix**

_rfy48wpr9j92m66cyf8adx1ljg89ibyc_`"]
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_configurations_eltern["`**configurations/eltern**

_rfy48wpr9j92m66cyf8adx1ljg89ibyc_`"]
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_modules_networkmanager_nix["`**modules/networkmanager.nix**

_rfy48wpr9j92m66cyf8adx1ljg89ibyc_`"]
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_modules_avahi_nix["`**modules/avahi.nix**

_rfy48wpr9j92m66cyf8adx1ljg89ibyc_`"]
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_rfy48wpr9j92m66cyf8adx1ljg89ibyc_`"]
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_rfy48wpr9j92m66cyf8adx1ljg89ibyc_`"]
    nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_qfl13kyhghdkfalgjpvqd9akj5jz1s2q_`"]
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_rfy48wpr9j92m66cyf8adx1ljg89ibyc_`"]
    nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_flake_nix --> n6v1033mwv25lwcrpmd6v7c3a6f54fl66_module_nix
    nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_flake_nix --> nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops
    nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_flake_nix --> npndpp56mw7qmb2nr9k07yiqwl0zanp0q_nixos
    nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_flake_nix --> nrfy48wpr9j92m66cyf8adx1ljg89ibyc_global_nix
    nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_flake_nix --> nrfy48wpr9j92m66cyf8adx1ljg89ibyc_configurations_eltern
    nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_flake_nix --> nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos
    n6v1033mwv25lwcrpmd6v7c3a6f54fl66_module_nix --> n6v1033mwv25lwcrpmd6v7c3a6f54fl66_lib_make_disk_image_nix
    nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops --> nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops_templates
    nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops --> nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops_secrets_for_users
    npndpp56mw7qmb2nr9k07yiqwl0zanp0q_nixos --> npndpp56mw7qmb2nr9k07yiqwl0zanp0q_nixos_common_nix
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_configurations_eltern --> nrfy48wpr9j92m66cyf8adx1ljg89ibyc_modules_networkmanager_nix
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_configurations_eltern --> nrfy48wpr9j92m66cyf8adx1ljg89ibyc_modules_avahi_nix
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos --> nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos_hardware_configuration_nix
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos --> nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos_disk_configuration_nix
    nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos_hardware_configuration_nix --> nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_nixos_modules_installer_scan_not_detected_nix
    style nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_flake_nix fill:#b5b2e5,color:#000000
    style n6v1033mwv25lwcrpmd6v7c3a6f54fl66_module_nix fill:#e5c6b2,color:#000000
    style n6v1033mwv25lwcrpmd6v7c3a6f54fl66_lib_make_disk_image_nix fill:#e5c6b2,color:#000000
    style nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops fill:#b2cde5,color:#000000
    style nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops_templates fill:#b2cde5,color:#000000
    style nafiz5qjgd4j1m87ijaa8f33vzv4ba85w_modules_sops_secrets_for_users fill:#b2cde5,color:#000000
    style npndpp56mw7qmb2nr9k07yiqwl0zanp0q_nixos fill:#e5b2b3,color:#000000
    style npndpp56mw7qmb2nr9k07yiqwl0zanp0q_nixos_common_nix fill:#e5b2b3,color:#000000
    style nrfy48wpr9j92m66cyf8adx1ljg89ibyc_global_nix fill:#e5b2be,color:#000000
    style nrfy48wpr9j92m66cyf8adx1ljg89ibyc_configurations_eltern fill:#e5b2be,color:#000000
    style nrfy48wpr9j92m66cyf8adx1ljg89ibyc_modules_networkmanager_nix fill:#e5b2be,color:#000000
    style nrfy48wpr9j92m66cyf8adx1ljg89ibyc_modules_avahi_nix fill:#e5b2be,color:#000000
    style nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos fill:#e5b2be,color:#000000
    style nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos_hardware_configuration_nix fill:#e5b2be,color:#000000
    style nqfl13kyhghdkfalgjpvqd9akj5jz1s2q_nixos_modules_installer_scan_not_detected_nix fill:#b5b2e5,color:#000000
    style nrfy48wpr9j92m66cyf8adx1ljg89ibyc_machines_eltern_asus_nixos_disk_configuration_nix fill:#e5b2be,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    n9v9s7k8znqw4klbb490aygxsibpvzqfr_flake_nix["`**flake.nix**

_9v9s7k8znqw4klbb490aygxsibpvzqfr_`"]
    n1h61wcpyvb5b9f55m6spvn52i2m6khpr_module_nix["`**module.nix**

_1h61wcpyvb5b9f55m6spvn52i2m6khpr_`"]
    n1h61wcpyvb5b9f55m6spvn52i2m6khpr_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_1h61wcpyvb5b9f55m6spvn52i2m6khpr_`"]
    nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops["`**modules/sops**

_ks9rr40vy1sv7mqhc79r9jfgcz837wfi_`"]
    nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops_templates["`**modules/sops/templates**

_ks9rr40vy1sv7mqhc79r9jfgcz837wfi_`"]
    nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_ks9rr40vy1sv7mqhc79r9jfgcz837wfi_`"]
    n2dsqd114aa5sahrbl91kfrf6i36lf0p5_nixos["`**nixos**

_2dsqd114aa5sahrbl91kfrf6i36lf0p5_`"]
    n2dsqd114aa5sahrbl91kfrf6i36lf0p5_nixos_common_nix["`**nixos/common.nix**

_2dsqd114aa5sahrbl91kfrf6i36lf0p5_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_global_nix["`**global.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch["`**configurations/schokoladenelch**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_docker_nix["`**modules/docker.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_networkmanager_nix["`**modules/networkmanager.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_tmux_nix["`**modules/tmux.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_stacks_default_nix["`**modules/stacks/default.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    n9v9s7k8znqw4klbb490aygxsibpvzqfr_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_9v9s7k8znqw4klbb490aygxsibpvzqfr_`"]
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_na0hsddgf70mn0v07ilaj05p5xc64jvx_`"]
    n9v9s7k8znqw4klbb490aygxsibpvzqfr_flake_nix --> n1h61wcpyvb5b9f55m6spvn52i2m6khpr_module_nix
    n9v9s7k8znqw4klbb490aygxsibpvzqfr_flake_nix --> nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops
    n9v9s7k8znqw4klbb490aygxsibpvzqfr_flake_nix --> n2dsqd114aa5sahrbl91kfrf6i36lf0p5_nixos
    n9v9s7k8znqw4klbb490aygxsibpvzqfr_flake_nix --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_global_nix
    n9v9s7k8znqw4klbb490aygxsibpvzqfr_flake_nix --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch
    n9v9s7k8znqw4klbb490aygxsibpvzqfr_flake_nix --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos
    n1h61wcpyvb5b9f55m6spvn52i2m6khpr_module_nix --> n1h61wcpyvb5b9f55m6spvn52i2m6khpr_lib_make_disk_image_nix
    nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops --> nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops_templates
    nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops --> nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops_secrets_for_users
    n2dsqd114aa5sahrbl91kfrf6i36lf0p5_nixos --> n2dsqd114aa5sahrbl91kfrf6i36lf0p5_nixos_common_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_docker_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_networkmanager_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_tmux_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_boot_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_networking_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_services_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_persistence_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_stacks_default_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos --> nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> n9v9s7k8znqw4klbb490aygxsibpvzqfr_nixos_modules_installer_scan_not_detected_nix
    style n9v9s7k8znqw4klbb490aygxsibpvzqfr_flake_nix fill:#d4b2e5,color:#000000
    style n1h61wcpyvb5b9f55m6spvn52i2m6khpr_module_nix fill:#e5d8b2,color:#000000
    style n1h61wcpyvb5b9f55m6spvn52i2m6khpr_lib_make_disk_image_nix fill:#e5d8b2,color:#000000
    style nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops fill:#bfb2e5,color:#000000
    style nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops_templates fill:#bfb2e5,color:#000000
    style nks9rr40vy1sv7mqhc79r9jfgcz837wfi_modules_sops_secrets_for_users fill:#bfb2e5,color:#000000
    style n2dsqd114aa5sahrbl91kfrf6i36lf0p5_nixos fill:#c6e5b2,color:#000000
    style n2dsqd114aa5sahrbl91kfrf6i36lf0p5_nixos_common_nix fill:#c6e5b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_global_nix fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_docker_nix fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_networkmanager_nix fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_tmux_nix fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_boot_nix fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_networking_nix fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_services_nix fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_configurations_schokoladenelch_persistence_nix fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_modules_stacks_default_nix fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos fill:#e5b6b2,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#e5b6b2,color:#000000
    style n9v9s7k8znqw4klbb490aygxsibpvzqfr_nixos_modules_installer_scan_not_detected_nix fill:#d4b2e5,color:#000000
    style nna0hsddgf70mn0v07ilaj05p5xc64jvx_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#e5b6b2,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_flake_nix["`**flake.nix**

_jyv1wjfx1y334fdcl4hkf3ia4pd00ivw_`"]
    nmysvqabszx7ss1g42h9xs7ljcvq79jpp_module_nix["`**module.nix**

_mysvqabszx7ss1g42h9xs7ljcvq79jpp_`"]
    nmysvqabszx7ss1g42h9xs7ljcvq79jpp_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_mysvqabszx7ss1g42h9xs7ljcvq79jpp_`"]
    n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops["`**modules/sops**

_3jbsprz265szsw8pi73qjhvk66ks5i5s_`"]
    n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops_templates["`**modules/sops/templates**

_3jbsprz265szsw8pi73qjhvk66ks5i5s_`"]
    n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_3jbsprz265szsw8pi73qjhvk66ks5i5s_`"]
    n7d773326pgdzhygihpqi8cqxgjxwkpb6_nixos["`**nixos**

_7d773326pgdzhygihpqi8cqxgjxwkpb6_`"]
    n7d773326pgdzhygihpqi8cqxgjxwkpb6_nixos_common_nix["`**nixos/common.nix**

_7d773326pgdzhygihpqi8cqxgjxwkpb6_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_global_nix["`**global.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico["`**configurations/nico**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_docker_nix["`**modules/docker.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_networkmanager_nix["`**modules/networkmanager.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_pipewire_nix["`**modules/pipewire.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_services_nix["`**configurations/nico/services.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_avahi_nix["`**modules/avahi.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_jyv1wjfx1y334fdcl4hkf3ia4pd00ivw_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_eden["`**modules/eden**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_xone_dongle["`**modules/xone-dongle**

_k1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_`"]
    njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_flake_nix --> nmysvqabszx7ss1g42h9xs7ljcvq79jpp_module_nix
    njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_flake_nix --> n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops
    njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_flake_nix --> n7d773326pgdzhygihpqi8cqxgjxwkpb6_nixos
    njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_flake_nix --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_global_nix
    njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_flake_nix --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico
    njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_flake_nix --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos
    nmysvqabszx7ss1g42h9xs7ljcvq79jpp_module_nix --> nmysvqabszx7ss1g42h9xs7ljcvq79jpp_lib_make_disk_image_nix
    n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops --> n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops_templates
    n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops --> n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops_secrets_for_users
    n7d773326pgdzhygihpqi8cqxgjxwkpb6_nixos --> n7d773326pgdzhygihpqi8cqxgjxwkpb6_nixos_common_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_docker_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_networkmanager_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_boot_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_desktop_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_audio_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_virtualisation_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_services_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_packages_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_rclone_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_audio_nix --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_pipewire_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_services_nix --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_avahi_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos_hardware_configuration_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_eden
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos --> nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_xone_dongle
    nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos_hardware_configuration_nix --> njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_nixos_modules_installer_scan_not_detected_nix
    style njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_flake_nix fill:#c4b2e5,color:#000000
    style nmysvqabszx7ss1g42h9xs7ljcvq79jpp_module_nix fill:#bdb2e5,color:#000000
    style nmysvqabszx7ss1g42h9xs7ljcvq79jpp_lib_make_disk_image_nix fill:#bdb2e5,color:#000000
    style n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops fill:#b2b2e5,color:#000000
    style n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops_templates fill:#b2b2e5,color:#000000
    style n3jbsprz265szsw8pi73qjhvk66ks5i5s_modules_sops_secrets_for_users fill:#b2b2e5,color:#000000
    style n7d773326pgdzhygihpqi8cqxgjxwkpb6_nixos fill:#bbe5b2,color:#000000
    style n7d773326pgdzhygihpqi8cqxgjxwkpb6_nixos_common_nix fill:#bbe5b2,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_global_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_docker_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_networkmanager_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_boot_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_desktop_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_audio_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_pipewire_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_virtualisation_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_services_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_avahi_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_packages_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_configurations_nico_rclone_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#c7b2e5,color:#000000
    style njyv1wjfx1y334fdcl4hkf3ia4pd00ivw_nixos_modules_installer_scan_not_detected_nix fill:#c4b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_eden fill:#c7b2e5,color:#000000
    style nk1aw3mqg8ya2rgxpj2bxbfam0nrmiz7s_modules_xone_dongle fill:#c7b2e5,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_flake_nix["`**flake.nix**

_2dnf0ahpdiwgkyvk1z62glax2kxy9n08_`"]
    n7cvm9qqp0npnvxjrxwwrgwbs1y6vv34d_module_nix["`**module.nix**

_7cvm9qqp0npnvxjrxwwrgwbs1y6vv34d_`"]
    n7cvm9qqp0npnvxjrxwwrgwbs1y6vv34d_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_7cvm9qqp0npnvxjrxwwrgwbs1y6vv34d_`"]
    n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops["`**modules/sops**

_1gqlf58n394ydx7a1i9ncb6pqklndqk1_`"]
    n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops_templates["`**modules/sops/templates**

_1gqlf58n394ydx7a1i9ncb6pqklndqk1_`"]
    n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_1gqlf58n394ydx7a1i9ncb6pqklndqk1_`"]
    nrw2lfgyma241g58nvxrgfzcfycbyq7b8_nixos["`**nixos**

_rw2lfgyma241g58nvxrgfzcfycbyq7b8_`"]
    nrw2lfgyma241g58nvxrgfzcfycbyq7b8_nixos_common_nix["`**nixos/common.nix**

_rw2lfgyma241g58nvxrgfzcfycbyq7b8_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_global_nix["`**global.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico["`**configurations/nico**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_docker_nix["`**modules/docker.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_networkmanager_nix["`**modules/networkmanager.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_pipewire_nix["`**modules/pipewire.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_services_nix["`**configurations/nico/services.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_avahi_nix["`**modules/avahi.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_2dnf0ahpdiwgkyvk1z62glax2kxy9n08_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_x5y7plqlyhakyx7mzx4ws7mgpwac4nf2_`"]
    n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_flake_nix --> n7cvm9qqp0npnvxjrxwwrgwbs1y6vv34d_module_nix
    n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_flake_nix --> n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops
    n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_flake_nix --> nrw2lfgyma241g58nvxrgfzcfycbyq7b8_nixos
    n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_flake_nix --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_global_nix
    n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_flake_nix --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico
    n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_flake_nix --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos
    n7cvm9qqp0npnvxjrxwwrgwbs1y6vv34d_module_nix --> n7cvm9qqp0npnvxjrxwwrgwbs1y6vv34d_lib_make_disk_image_nix
    n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops --> n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops_templates
    n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops --> n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops_secrets_for_users
    nrw2lfgyma241g58nvxrgfzcfycbyq7b8_nixos --> nrw2lfgyma241g58nvxrgfzcfycbyq7b8_nixos_common_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_docker_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_networkmanager_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_boot_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_desktop_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_audio_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_virtualisation_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_services_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_packages_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_rclone_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_audio_nix --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_pipewire_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_services_nix --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_avahi_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_hardware_configuration_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos --> nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_mobile_network_nix
    nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_hardware_configuration_nix --> n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_nixos_modules_installer_scan_not_detected_nix
    style n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_flake_nix fill:#d2e5b2,color:#000000
    style n7cvm9qqp0npnvxjrxwwrgwbs1y6vv34d_module_nix fill:#deb2e5,color:#000000
    style n7cvm9qqp0npnvxjrxwwrgwbs1y6vv34d_lib_make_disk_image_nix fill:#deb2e5,color:#000000
    style n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops fill:#b2e5b4,color:#000000
    style n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops_templates fill:#b2e5b4,color:#000000
    style n1gqlf58n394ydx7a1i9ncb6pqklndqk1_modules_sops_secrets_for_users fill:#b2e5b4,color:#000000
    style nrw2lfgyma241g58nvxrgfzcfycbyq7b8_nixos fill:#e5b5b2,color:#000000
    style nrw2lfgyma241g58nvxrgfzcfycbyq7b8_nixos_common_nix fill:#e5b5b2,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_global_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_docker_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_networkmanager_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_boot_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_desktop_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_audio_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_pipewire_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_virtualisation_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_services_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_modules_avahi_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_packages_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_configurations_nico_rclone_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#c1b2e5,color:#000000
    style n2dnf0ahpdiwgkyvk1z62glax2kxy9n08_nixos_modules_installer_scan_not_detected_nix fill:#d2e5b2,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#c1b2e5,color:#000000
    style nx5y7plqlyhakyx7mzx4ws7mgpwac4nf2_machines_nico_thinkpad_nixos_mobile_network_nix fill:#c1b2e5,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    naxrg7ap8iw0fndr79nly9hk84102wpk0_flake_nix["`**flake.nix**

_axrg7ap8iw0fndr79nly9hk84102wpk0_`"]
    n6kjbs4mi6dz35a6wmpmw3nh0758pd695_module_nix["`**module.nix**

_6kjbs4mi6dz35a6wmpmw3nh0758pd695_`"]
    n6kjbs4mi6dz35a6wmpmw3nh0758pd695_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_6kjbs4mi6dz35a6wmpmw3nh0758pd695_`"]
    nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops["`**modules/sops**

_ya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_`"]
    nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops_templates["`**modules/sops/templates**

_ya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_`"]
    nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_ya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_`"]
    nzswk9i4pf5yzzd0nbvaic6lcpm0ps2f8_nixos["`**nixos**

_zswk9i4pf5yzzd0nbvaic6lcpm0ps2f8_`"]
    nzswk9i4pf5yzzd0nbvaic6lcpm0ps2f8_nixos_common_nix["`**nixos/common.nix**

_zswk9i4pf5yzzd0nbvaic6lcpm0ps2f8_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_global_nix["`**global.nix**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_configurations_nixos["`**configurations/nixos**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_modules_docker_nix["`**modules/docker.nix**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_modules_headlamp_nix["`**modules/headlamp.nix**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_modules_tmux_nix["`**modules/tmux.nix**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_281msqz0xqi356fl3z1afc4dx9bkbzfp_`"]
    naxrg7ap8iw0fndr79nly9hk84102wpk0_flake_nix --> n6kjbs4mi6dz35a6wmpmw3nh0758pd695_module_nix
    naxrg7ap8iw0fndr79nly9hk84102wpk0_flake_nix --> nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops
    naxrg7ap8iw0fndr79nly9hk84102wpk0_flake_nix --> nzswk9i4pf5yzzd0nbvaic6lcpm0ps2f8_nixos
    naxrg7ap8iw0fndr79nly9hk84102wpk0_flake_nix --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_global_nix
    naxrg7ap8iw0fndr79nly9hk84102wpk0_flake_nix --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_configurations_nixos
    naxrg7ap8iw0fndr79nly9hk84102wpk0_flake_nix --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos
    n6kjbs4mi6dz35a6wmpmw3nh0758pd695_module_nix --> n6kjbs4mi6dz35a6wmpmw3nh0758pd695_lib_make_disk_image_nix
    nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops --> nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops_templates
    nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops --> nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops_secrets_for_users
    nzswk9i4pf5yzzd0nbvaic6lcpm0ps2f8_nixos --> nzswk9i4pf5yzzd0nbvaic6lcpm0ps2f8_nixos_common_nix
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_configurations_nixos --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_modules_docker_nix
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_configurations_nixos --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_modules_headlamp_nix
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_configurations_nixos --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_modules_tmux_nix
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_disk_configuration_nix
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_boot_nix
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_desktop_nix
    n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos --> n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_persistence_nix
    style naxrg7ap8iw0fndr79nly9hk84102wpk0_flake_nix fill:#b2b5e5,color:#000000
    style n6kjbs4mi6dz35a6wmpmw3nh0758pd695_module_nix fill:#e5b2c0,color:#000000
    style n6kjbs4mi6dz35a6wmpmw3nh0758pd695_lib_make_disk_image_nix fill:#e5b2c0,color:#000000
    style nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops fill:#dab2e5,color:#000000
    style nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops_templates fill:#dab2e5,color:#000000
    style nya9qfpha6hyhjsmkc9ai7k2pjcb0gkxw_modules_sops_secrets_for_users fill:#dab2e5,color:#000000
    style nzswk9i4pf5yzzd0nbvaic6lcpm0ps2f8_nixos fill:#cbb2e5,color:#000000
    style nzswk9i4pf5yzzd0nbvaic6lcpm0ps2f8_nixos_common_nix fill:#cbb2e5,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_global_nix fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_configurations_nixos fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_modules_docker_nix fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_modules_headlamp_nix fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_modules_tmux_nix fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_boot_nix fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_desktop_nix fill:#e5ceb2,color:#000000
    style n281msqz0xqi356fl3z1afc4dx9bkbzfp_machines_nixos_virtualbox_nixos_persistence_nix fill:#e5ceb2,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    n49i1idwy31jx29vgxkrdizqpsparjahd_flake_nix["`**flake.nix**

_49i1idwy31jx29vgxkrdizqpsparjahd_`"]
    npska1li8yahb8wjwsimc6h3004c3803b_module_nix["`**module.nix**

_pska1li8yahb8wjwsimc6h3004c3803b_`"]
    npska1li8yahb8wjwsimc6h3004c3803b_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_pska1li8yahb8wjwsimc6h3004c3803b_`"]
    n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops["`**modules/sops**

_0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_`"]
    n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops_templates["`**modules/sops/templates**

_0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_`"]
    n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_`"]
    nr1dfnqc0p60fhc01xb7xf8811ncxqbxg_nixos["`**nixos**

_r1dfnqc0p60fhc01xb7xf8811ncxqbxg_`"]
    nr1dfnqc0p60fhc01xb7xf8811ncxqbxg_nixos_common_nix["`**nixos/common.nix**

_r1dfnqc0p60fhc01xb7xf8811ncxqbxg_`"]
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_global_nix["`**global.nix**

_8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_`"]
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_configurations_nixos["`**configurations/nixos**

_8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_`"]
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_modules_docker_nix["`**modules/docker.nix**

_8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_`"]
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_modules_headlamp_nix["`**modules/headlamp.nix**

_8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_`"]
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_modules_tmux_nix["`**modules/tmux.nix**

_8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_`"]
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_`"]
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules["`**modules**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_build_tarball_nix["`**modules/build-tarball.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_interop_nix["`**modules/interop.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_recovery_nix["`**modules/recovery.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd["`**modules/systemd**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd_native["`**modules/systemd/native**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_usbip_nix["`**modules/usbip.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_version_nix["`**modules/version.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_welcome_nix["`**modules/welcome.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_payxk6dam4vjdzg8irfxjmlm2ksrgvld_`"]
    n49i1idwy31jx29vgxkrdizqpsparjahd_flake_nix --> npska1li8yahb8wjwsimc6h3004c3803b_module_nix
    n49i1idwy31jx29vgxkrdizqpsparjahd_flake_nix --> n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops
    n49i1idwy31jx29vgxkrdizqpsparjahd_flake_nix --> nr1dfnqc0p60fhc01xb7xf8811ncxqbxg_nixos
    n49i1idwy31jx29vgxkrdizqpsparjahd_flake_nix --> n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_global_nix
    n49i1idwy31jx29vgxkrdizqpsparjahd_flake_nix --> n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_configurations_nixos
    n49i1idwy31jx29vgxkrdizqpsparjahd_flake_nix --> n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_machines_nixos_wsl_nixos
    npska1li8yahb8wjwsimc6h3004c3803b_module_nix --> npska1li8yahb8wjwsimc6h3004c3803b_lib_make_disk_image_nix
    n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops --> n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops_templates
    n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops --> n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops_secrets_for_users
    nr1dfnqc0p60fhc01xb7xf8811ncxqbxg_nixos --> nr1dfnqc0p60fhc01xb7xf8811ncxqbxg_nixos_common_nix
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_configurations_nixos --> n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_modules_docker_nix
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_configurations_nixos --> n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_modules_headlamp_nix
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_configurations_nixos --> n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_modules_tmux_nix
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_machines_nixos_wsl_nixos --> n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_machines_nixos_wsl_nixos_hardware_configuration_nix
    n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_machines_nixos_wsl_nixos --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_build_tarball_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_docker_desktop_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_interop_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_recovery_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_ssh_agent_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_usbip_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_version_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_welcome_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_wsl_conf_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_wsl_distro_nix
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd_native
    npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd_native --> npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd_native_wrap_shell_nix
    style n49i1idwy31jx29vgxkrdizqpsparjahd_flake_nix fill:#b2e5c6,color:#000000
    style npska1li8yahb8wjwsimc6h3004c3803b_module_nix fill:#e5b9b2,color:#000000
    style npska1li8yahb8wjwsimc6h3004c3803b_lib_make_disk_image_nix fill:#e5b9b2,color:#000000
    style n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops fill:#e2e5b2,color:#000000
    style n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops_templates fill:#e2e5b2,color:#000000
    style n0d0v53gy1gcgi4m0hs2c8hcrpsi4f33q_modules_sops_secrets_for_users fill:#e2e5b2,color:#000000
    style nr1dfnqc0p60fhc01xb7xf8811ncxqbxg_nixos fill:#b2e5b2,color:#000000
    style nr1dfnqc0p60fhc01xb7xf8811ncxqbxg_nixos_common_nix fill:#b2e5b2,color:#000000
    style n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_global_nix fill:#b2b4e5,color:#000000
    style n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_configurations_nixos fill:#b2b4e5,color:#000000
    style n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_modules_docker_nix fill:#b2b4e5,color:#000000
    style n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_modules_headlamp_nix fill:#b2b4e5,color:#000000
    style n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_modules_tmux_nix fill:#b2b4e5,color:#000000
    style n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_machines_nixos_wsl_nixos fill:#b2b4e5,color:#000000
    style n8m0rq6k9g8hq6m3ajf1l27ggipiznxyn_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#b2b4e5,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_build_tarball_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_docker_desktop_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_interop_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_recovery_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_ssh_agent_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd_native fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_systemd_native_wrap_shell_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_usbip_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_version_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_welcome_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_wsl_conf_nix fill:#e1e5b2,color:#000000
    style npayxk6dam4vjdzg8irfxjmlm2ksrgvld_modules_wsl_distro_nix fill:#e1e5b2,color:#000000
```
