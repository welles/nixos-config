# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_flake_nix["`**flake.nix**

_f4rvkf2nb4cyn066h02cx0qahcfj7wsi_`"]
    nx73sgzqlxl1pghjkqpkrjb8ng1d99m2f_module_nix["`**module.nix**

_x73sgzqlxl1pghjkqpkrjb8ng1d99m2f_`"]
    nx73sgzqlxl1pghjkqpkrjb8ng1d99m2f_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_x73sgzqlxl1pghjkqpkrjb8ng1d99m2f_`"]
    nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops["`**modules/sops**

_imgnvjgydz3hznrg9x6k50si8i6mfb4q_`"]
    nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops_templates["`**modules/sops/templates**

_imgnvjgydz3hznrg9x6k50si8i6mfb4q_`"]
    nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_imgnvjgydz3hznrg9x6k50si8i6mfb4q_`"]
    nyll28894pzg1djcz77l11wrqa7s08syl_nixos["`**nixos**

_yll28894pzg1djcz77l11wrqa7s08syl_`"]
    nyll28894pzg1djcz77l11wrqa7s08syl_nixos_common_nix["`**nixos/common.nix**

_yll28894pzg1djcz77l11wrqa7s08syl_`"]
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_global_nix["`**global.nix**

_a1kz34gjszamjzf5cb0zpy60ykd19ckv_`"]
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_configurations_eltern["`**configurations/eltern**

_a1kz34gjszamjzf5cb0zpy60ykd19ckv_`"]
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_modules_networkmanager_nix["`**modules/networkmanager.nix**

_a1kz34gjszamjzf5cb0zpy60ykd19ckv_`"]
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_modules_avahi_nix["`**modules/avahi.nix**

_a1kz34gjszamjzf5cb0zpy60ykd19ckv_`"]
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_a1kz34gjszamjzf5cb0zpy60ykd19ckv_`"]
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_a1kz34gjszamjzf5cb0zpy60ykd19ckv_`"]
    nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_f4rvkf2nb4cyn066h02cx0qahcfj7wsi_`"]
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_a1kz34gjszamjzf5cb0zpy60ykd19ckv_`"]
    nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_flake_nix --> nx73sgzqlxl1pghjkqpkrjb8ng1d99m2f_module_nix
    nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_flake_nix --> nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops
    nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_flake_nix --> nyll28894pzg1djcz77l11wrqa7s08syl_nixos
    nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_flake_nix --> na1kz34gjszamjzf5cb0zpy60ykd19ckv_global_nix
    nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_flake_nix --> na1kz34gjszamjzf5cb0zpy60ykd19ckv_configurations_eltern
    nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_flake_nix --> na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos
    nx73sgzqlxl1pghjkqpkrjb8ng1d99m2f_module_nix --> nx73sgzqlxl1pghjkqpkrjb8ng1d99m2f_lib_make_disk_image_nix
    nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops --> nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops_templates
    nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops --> nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops_secrets_for_users
    nyll28894pzg1djcz77l11wrqa7s08syl_nixos --> nyll28894pzg1djcz77l11wrqa7s08syl_nixos_common_nix
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_configurations_eltern --> na1kz34gjszamjzf5cb0zpy60ykd19ckv_modules_networkmanager_nix
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_configurations_eltern --> na1kz34gjszamjzf5cb0zpy60ykd19ckv_modules_avahi_nix
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos --> na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos_hardware_configuration_nix
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos --> na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos_disk_configuration_nix
    na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos_hardware_configuration_nix --> nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_nixos_modules_installer_scan_not_detected_nix
    style nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_flake_nix fill:#e5b2cf,color:#000000
    style nx73sgzqlxl1pghjkqpkrjb8ng1d99m2f_module_nix fill:#e5b2be,color:#000000
    style nx73sgzqlxl1pghjkqpkrjb8ng1d99m2f_lib_make_disk_image_nix fill:#e5b2be,color:#000000
    style nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops fill:#b5e5b2,color:#000000
    style nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops_templates fill:#b5e5b2,color:#000000
    style nimgnvjgydz3hznrg9x6k50si8i6mfb4q_modules_sops_secrets_for_users fill:#b5e5b2,color:#000000
    style nyll28894pzg1djcz77l11wrqa7s08syl_nixos fill:#e5deb2,color:#000000
    style nyll28894pzg1djcz77l11wrqa7s08syl_nixos_common_nix fill:#e5deb2,color:#000000
    style na1kz34gjszamjzf5cb0zpy60ykd19ckv_global_nix fill:#e5ddb2,color:#000000
    style na1kz34gjszamjzf5cb0zpy60ykd19ckv_configurations_eltern fill:#e5ddb2,color:#000000
    style na1kz34gjszamjzf5cb0zpy60ykd19ckv_modules_networkmanager_nix fill:#e5ddb2,color:#000000
    style na1kz34gjszamjzf5cb0zpy60ykd19ckv_modules_avahi_nix fill:#e5ddb2,color:#000000
    style na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos fill:#e5ddb2,color:#000000
    style na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos_hardware_configuration_nix fill:#e5ddb2,color:#000000
    style nf4rvkf2nb4cyn066h02cx0qahcfj7wsi_nixos_modules_installer_scan_not_detected_nix fill:#e5b2cf,color:#000000
    style na1kz34gjszamjzf5cb0zpy60ykd19ckv_machines_eltern_asus_nixos_disk_configuration_nix fill:#e5ddb2,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_flake_nix["`**flake.nix**

_kfhz2byzyh4lrmcnvqpcdljzi6irgb3s_`"]
    n3v9cy590mqca92hv6yjpc6m93pqkmr9m_module_nix["`**module.nix**

_3v9cy590mqca92hv6yjpc6m93pqkmr9m_`"]
    n3v9cy590mqca92hv6yjpc6m93pqkmr9m_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_3v9cy590mqca92hv6yjpc6m93pqkmr9m_`"]
    nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops["`**modules/sops**

_vmzmifviz2mbypbyjpc3q1qvrc0s4lzw_`"]
    nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops_templates["`**modules/sops/templates**

_vmzmifviz2mbypbyjpc3q1qvrc0s4lzw_`"]
    nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_vmzmifviz2mbypbyjpc3q1qvrc0s4lzw_`"]
    nf9x34qkh0jrsw5k27r8grswllghsi63z_nixos["`**nixos**

_f9x34qkh0jrsw5k27r8grswllghsi63z_`"]
    nf9x34qkh0jrsw5k27r8grswllghsi63z_nixos_common_nix["`**nixos/common.nix**

_f9x34qkh0jrsw5k27r8grswllghsi63z_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_global_nix["`**global.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch["`**configurations/schokoladenelch**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_docker_nix["`**modules/docker.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_networkmanager_nix["`**modules/networkmanager.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_tmux_nix["`**modules/tmux.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_stacks_default_nix["`**modules/stacks/default.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_kfhz2byzyh4lrmcnvqpcdljzi6irgb3s_`"]
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_417y3lrvrzpkj45id7gw9bkf9ivw7ssl_`"]
    nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_flake_nix --> n3v9cy590mqca92hv6yjpc6m93pqkmr9m_module_nix
    nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_flake_nix --> nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops
    nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_flake_nix --> nf9x34qkh0jrsw5k27r8grswllghsi63z_nixos
    nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_flake_nix --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_global_nix
    nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_flake_nix --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch
    nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_flake_nix --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos
    n3v9cy590mqca92hv6yjpc6m93pqkmr9m_module_nix --> n3v9cy590mqca92hv6yjpc6m93pqkmr9m_lib_make_disk_image_nix
    nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops --> nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops_templates
    nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops --> nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops_secrets_for_users
    nf9x34qkh0jrsw5k27r8grswllghsi63z_nixos --> nf9x34qkh0jrsw5k27r8grswllghsi63z_nixos_common_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_docker_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_networkmanager_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_tmux_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_boot_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_networking_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_services_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_persistence_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_stacks_default_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos --> n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_nixos_modules_installer_scan_not_detected_nix
    style nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_flake_nix fill:#c4b2e5,color:#000000
    style n3v9cy590mqca92hv6yjpc6m93pqkmr9m_module_nix fill:#d5b2e5,color:#000000
    style n3v9cy590mqca92hv6yjpc6m93pqkmr9m_lib_make_disk_image_nix fill:#d5b2e5,color:#000000
    style nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops fill:#b2e5cd,color:#000000
    style nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops_templates fill:#b2e5cd,color:#000000
    style nvmzmifviz2mbypbyjpc3q1qvrc0s4lzw_modules_sops_secrets_for_users fill:#b2e5cd,color:#000000
    style nf9x34qkh0jrsw5k27r8grswllghsi63z_nixos fill:#e5c8b2,color:#000000
    style nf9x34qkh0jrsw5k27r8grswllghsi63z_nixos_common_nix fill:#e5c8b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_global_nix fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_docker_nix fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_networkmanager_nix fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_tmux_nix fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_boot_nix fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_networking_nix fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_services_nix fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_configurations_schokoladenelch_persistence_nix fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_modules_stacks_default_nix fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos fill:#d5e5b2,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#d5e5b2,color:#000000
    style nkfhz2byzyh4lrmcnvqpcdljzi6irgb3s_nixos_modules_installer_scan_not_detected_nix fill:#c4b2e5,color:#000000
    style n417y3lrvrzpkj45id7gw9bkf9ivw7ssl_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#d5e5b2,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    n865981fmz9miv88i9lgg95blz79ynb1n_flake_nix["`**flake.nix**

_865981fmz9miv88i9lgg95blz79ynb1n_`"]
    nd81jri5k3nvl04qmsf1d9iyfs0j3y1xv_module_nix["`**module.nix**

_d81jri5k3nvl04qmsf1d9iyfs0j3y1xv_`"]
    nd81jri5k3nvl04qmsf1d9iyfs0j3y1xv_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_d81jri5k3nvl04qmsf1d9iyfs0j3y1xv_`"]
    ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops["`**modules/sops**

_dipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_`"]
    ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops_templates["`**modules/sops/templates**

_dipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_`"]
    ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_dipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_`"]
    nvwy0683bggna8x24zj3x2d74ih5gw1w0_nixos["`**nixos**

_vwy0683bggna8x24zj3x2d74ih5gw1w0_`"]
    nvwy0683bggna8x24zj3x2d74ih5gw1w0_nixos_common_nix["`**nixos/common.nix**

_vwy0683bggna8x24zj3x2d74ih5gw1w0_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_global_nix["`**global.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico["`**configurations/nico**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_docker_nix["`**modules/docker.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_networkmanager_nix["`**modules/networkmanager.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_pipewire_nix["`**modules/pipewire.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_services_nix["`**configurations/nico/services.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_avahi_nix["`**modules/avahi.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n865981fmz9miv88i9lgg95blz79ynb1n_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_865981fmz9miv88i9lgg95blz79ynb1n_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_eden_nix["`**modules/eden.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_`"]
    n865981fmz9miv88i9lgg95blz79ynb1n_flake_nix --> nd81jri5k3nvl04qmsf1d9iyfs0j3y1xv_module_nix
    n865981fmz9miv88i9lgg95blz79ynb1n_flake_nix --> ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops
    n865981fmz9miv88i9lgg95blz79ynb1n_flake_nix --> nvwy0683bggna8x24zj3x2d74ih5gw1w0_nixos
    n865981fmz9miv88i9lgg95blz79ynb1n_flake_nix --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_global_nix
    n865981fmz9miv88i9lgg95blz79ynb1n_flake_nix --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico
    n865981fmz9miv88i9lgg95blz79ynb1n_flake_nix --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos
    nd81jri5k3nvl04qmsf1d9iyfs0j3y1xv_module_nix --> nd81jri5k3nvl04qmsf1d9iyfs0j3y1xv_lib_make_disk_image_nix
    ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops --> ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops_templates
    ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops --> ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops_secrets_for_users
    nvwy0683bggna8x24zj3x2d74ih5gw1w0_nixos --> nvwy0683bggna8x24zj3x2d74ih5gw1w0_nixos_common_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_docker_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_networkmanager_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_boot_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_desktop_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_audio_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_virtualisation_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_services_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_packages_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_rclone_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_audio_nix --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_pipewire_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_services_nix --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_avahi_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos_hardware_configuration_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_eden_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos --> n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_xone_dongle_nix
    n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos_hardware_configuration_nix --> n865981fmz9miv88i9lgg95blz79ynb1n_nixos_modules_installer_scan_not_detected_nix
    style n865981fmz9miv88i9lgg95blz79ynb1n_flake_nix fill:#c9e5b2,color:#000000
    style nd81jri5k3nvl04qmsf1d9iyfs0j3y1xv_module_nix fill:#b2bbe5,color:#000000
    style nd81jri5k3nvl04qmsf1d9iyfs0j3y1xv_lib_make_disk_image_nix fill:#b2bbe5,color:#000000
    style ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops fill:#e5b2b5,color:#000000
    style ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops_templates fill:#e5b2b5,color:#000000
    style ndipyq1vrh0ap0s2yjn22m6iwzwc6jlgx_modules_sops_secrets_for_users fill:#e5b2b5,color:#000000
    style nvwy0683bggna8x24zj3x2d74ih5gw1w0_nixos fill:#e5c2b2,color:#000000
    style nvwy0683bggna8x24zj3x2d74ih5gw1w0_nixos_common_nix fill:#e5c2b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_global_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_docker_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_networkmanager_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_boot_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_desktop_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_audio_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_pipewire_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_virtualisation_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_services_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_avahi_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_packages_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_configurations_nico_rclone_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#bae5b2,color:#000000
    style n865981fmz9miv88i9lgg95blz79ynb1n_nixos_modules_installer_scan_not_detected_nix fill:#c9e5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_eden_nix fill:#bae5b2,color:#000000
    style n6mqwm23sc50vbnqv4jfxc4fj02kh5rdv_modules_xone_dongle_nix fill:#bae5b2,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    nfil1v742pbf3vv61qn51q9ydlz4438yg_flake_nix["`**flake.nix**

_fil1v742pbf3vv61qn51q9ydlz4438yg_`"]
    n8914dk81lmbh06pjf2cpf8x4wki22571_module_nix["`**module.nix**

_8914dk81lmbh06pjf2cpf8x4wki22571_`"]
    n8914dk81lmbh06pjf2cpf8x4wki22571_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_8914dk81lmbh06pjf2cpf8x4wki22571_`"]
    nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops["`**modules/sops**

_hvam327gvkal7bv2pvypg6cnc2wjsrl8_`"]
    nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops_templates["`**modules/sops/templates**

_hvam327gvkal7bv2pvypg6cnc2wjsrl8_`"]
    nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_hvam327gvkal7bv2pvypg6cnc2wjsrl8_`"]
    n0b328pfpsc2hsbjwyhr2cak2csdp6llk_nixos["`**nixos**

_0b328pfpsc2hsbjwyhr2cak2csdp6llk_`"]
    n0b328pfpsc2hsbjwyhr2cak2csdp6llk_nixos_common_nix["`**nixos/common.nix**

_0b328pfpsc2hsbjwyhr2cak2csdp6llk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_global_nix["`**global.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico["`**configurations/nico**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_docker_nix["`**modules/docker.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_networkmanager_nix["`**modules/networkmanager.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_pipewire_nix["`**modules/pipewire.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_services_nix["`**configurations/nico/services.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_avahi_nix["`**modules/avahi.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    nfil1v742pbf3vv61qn51q9ydlz4438yg_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_fil1v742pbf3vv61qn51q9ydlz4438yg_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_`"]
    nfil1v742pbf3vv61qn51q9ydlz4438yg_flake_nix --> n8914dk81lmbh06pjf2cpf8x4wki22571_module_nix
    nfil1v742pbf3vv61qn51q9ydlz4438yg_flake_nix --> nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops
    nfil1v742pbf3vv61qn51q9ydlz4438yg_flake_nix --> n0b328pfpsc2hsbjwyhr2cak2csdp6llk_nixos
    nfil1v742pbf3vv61qn51q9ydlz4438yg_flake_nix --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_global_nix
    nfil1v742pbf3vv61qn51q9ydlz4438yg_flake_nix --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico
    nfil1v742pbf3vv61qn51q9ydlz4438yg_flake_nix --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos
    n8914dk81lmbh06pjf2cpf8x4wki22571_module_nix --> n8914dk81lmbh06pjf2cpf8x4wki22571_lib_make_disk_image_nix
    nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops --> nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops_templates
    nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops --> nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops_secrets_for_users
    n0b328pfpsc2hsbjwyhr2cak2csdp6llk_nixos --> n0b328pfpsc2hsbjwyhr2cak2csdp6llk_nixos_common_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_docker_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_networkmanager_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_boot_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_desktop_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_audio_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_virtualisation_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_services_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_packages_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_rclone_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_audio_nix --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_pipewire_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_services_nix --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_avahi_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_hardware_configuration_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos --> n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_mobile_network_nix
    n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_hardware_configuration_nix --> nfil1v742pbf3vv61qn51q9ydlz4438yg_nixos_modules_installer_scan_not_detected_nix
    style nfil1v742pbf3vv61qn51q9ydlz4438yg_flake_nix fill:#b8e5b2,color:#000000
    style n8914dk81lmbh06pjf2cpf8x4wki22571_module_nix fill:#b2e5bb,color:#000000
    style n8914dk81lmbh06pjf2cpf8x4wki22571_lib_make_disk_image_nix fill:#b2e5bb,color:#000000
    style nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops fill:#c1e5b2,color:#000000
    style nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops_templates fill:#c1e5b2,color:#000000
    style nhvam327gvkal7bv2pvypg6cnc2wjsrl8_modules_sops_secrets_for_users fill:#c1e5b2,color:#000000
    style n0b328pfpsc2hsbjwyhr2cak2csdp6llk_nixos fill:#b4e5b2,color:#000000
    style n0b328pfpsc2hsbjwyhr2cak2csdp6llk_nixos_common_nix fill:#b4e5b2,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_global_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_docker_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_networkmanager_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_boot_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_desktop_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_audio_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_pipewire_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_virtualisation_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_services_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_modules_avahi_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_packages_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_configurations_nico_rclone_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#e5b2e5,color:#000000
    style nfil1v742pbf3vv61qn51q9ydlz4438yg_nixos_modules_installer_scan_not_detected_nix fill:#b8e5b2,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#e5b2e5,color:#000000
    style n3mnfbg2vmp8vywi2f6h6ibdc2ik31vkk_machines_nico_thinkpad_nixos_mobile_network_nix fill:#e5b2e5,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    n5mray4qxqmc7rl796l7ll059h3rc51mg_flake_nix["`**flake.nix**

_5mray4qxqmc7rl796l7ll059h3rc51mg_`"]
    nnd1vd9cp7lxmz1zkjmg2v4jai9wcn1f2_module_nix["`**module.nix**

_nd1vd9cp7lxmz1zkjmg2v4jai9wcn1f2_`"]
    nnd1vd9cp7lxmz1zkjmg2v4jai9wcn1f2_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_nd1vd9cp7lxmz1zkjmg2v4jai9wcn1f2_`"]
    nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops["`**modules/sops**

_zh9ps5f5ym4abydh97mi1d5p6h8bs896_`"]
    nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops_templates["`**modules/sops/templates**

_zh9ps5f5ym4abydh97mi1d5p6h8bs896_`"]
    nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_zh9ps5f5ym4abydh97mi1d5p6h8bs896_`"]
    n0kyh8phj3qzmagijzz4dnrnhkrrhj1vc_nixos["`**nixos**

_0kyh8phj3qzmagijzz4dnrnhkrrhj1vc_`"]
    n0kyh8phj3qzmagijzz4dnrnhkrrhj1vc_nixos_common_nix["`**nixos/common.nix**

_0kyh8phj3qzmagijzz4dnrnhkrrhj1vc_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_global_nix["`**global.nix**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_configurations_nixos["`**configurations/nixos**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_modules_docker_nix["`**modules/docker.nix**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_modules_headlamp_nix["`**modules/headlamp.nix**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_modules_tmux_nix["`**modules/tmux.nix**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_aqw93pcn63q27zar6sqs8y9b3x11mm4f_`"]
    n5mray4qxqmc7rl796l7ll059h3rc51mg_flake_nix --> nnd1vd9cp7lxmz1zkjmg2v4jai9wcn1f2_module_nix
    n5mray4qxqmc7rl796l7ll059h3rc51mg_flake_nix --> nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops
    n5mray4qxqmc7rl796l7ll059h3rc51mg_flake_nix --> n0kyh8phj3qzmagijzz4dnrnhkrrhj1vc_nixos
    n5mray4qxqmc7rl796l7ll059h3rc51mg_flake_nix --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_global_nix
    n5mray4qxqmc7rl796l7ll059h3rc51mg_flake_nix --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_configurations_nixos
    n5mray4qxqmc7rl796l7ll059h3rc51mg_flake_nix --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos
    nnd1vd9cp7lxmz1zkjmg2v4jai9wcn1f2_module_nix --> nnd1vd9cp7lxmz1zkjmg2v4jai9wcn1f2_lib_make_disk_image_nix
    nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops --> nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops_templates
    nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops --> nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops_secrets_for_users
    n0kyh8phj3qzmagijzz4dnrnhkrrhj1vc_nixos --> n0kyh8phj3qzmagijzz4dnrnhkrrhj1vc_nixos_common_nix
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_configurations_nixos --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_modules_docker_nix
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_configurations_nixos --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_modules_headlamp_nix
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_configurations_nixos --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_modules_tmux_nix
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_disk_configuration_nix
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_boot_nix
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_desktop_nix
    naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos --> naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_persistence_nix
    style n5mray4qxqmc7rl796l7ll059h3rc51mg_flake_nix fill:#e5b2d3,color:#000000
    style nnd1vd9cp7lxmz1zkjmg2v4jai9wcn1f2_module_nix fill:#c5e5b2,color:#000000
    style nnd1vd9cp7lxmz1zkjmg2v4jai9wcn1f2_lib_make_disk_image_nix fill:#c5e5b2,color:#000000
    style nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops fill:#e5bbb2,color:#000000
    style nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops_templates fill:#e5bbb2,color:#000000
    style nzh9ps5f5ym4abydh97mi1d5p6h8bs896_modules_sops_secrets_for_users fill:#e5bbb2,color:#000000
    style n0kyh8phj3qzmagijzz4dnrnhkrrhj1vc_nixos fill:#b2c6e5,color:#000000
    style n0kyh8phj3qzmagijzz4dnrnhkrrhj1vc_nixos_common_nix fill:#b2c6e5,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_global_nix fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_configurations_nixos fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_modules_docker_nix fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_modules_headlamp_nix fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_modules_tmux_nix fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_boot_nix fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_desktop_nix fill:#d7e5b2,color:#000000
    style naqw93pcn63q27zar6sqs8y9b3x11mm4f_machines_nixos_virtualbox_nixos_persistence_nix fill:#d7e5b2,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    nyhlmpkjvrq70mh2kmg8d9bnzg93pwqia_flake_nix["`**flake.nix**

_yhlmpkjvrq70mh2kmg8d9bnzg93pwqia_`"]
    nj7y1iz0mz04jgvg8x7skqszv3yhs2ma4_module_nix["`**module.nix**

_j7y1iz0mz04jgvg8x7skqszv3yhs2ma4_`"]
    nj7y1iz0mz04jgvg8x7skqszv3yhs2ma4_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_j7y1iz0mz04jgvg8x7skqszv3yhs2ma4_`"]
    n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops["`**modules/sops**

_10kb907xqx9ccbq1smz2kzc45xqsj1h0_`"]
    n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops_templates["`**modules/sops/templates**

_10kb907xqx9ccbq1smz2kzc45xqsj1h0_`"]
    n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_10kb907xqx9ccbq1smz2kzc45xqsj1h0_`"]
    nf0mhsmc31kldm4b8b9fp9ncavzvs4f66_nixos["`**nixos**

_f0mhsmc31kldm4b8b9fp9ncavzvs4f66_`"]
    nf0mhsmc31kldm4b8b9fp9ncavzvs4f66_nixos_common_nix["`**nixos/common.nix**

_f0mhsmc31kldm4b8b9fp9ncavzvs4f66_`"]
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_global_nix["`**global.nix**

_2zzzl5zan4r4f63dc2rpykacwdq53ya2_`"]
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_configurations_nixos["`**configurations/nixos**

_2zzzl5zan4r4f63dc2rpykacwdq53ya2_`"]
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_modules_docker_nix["`**modules/docker.nix**

_2zzzl5zan4r4f63dc2rpykacwdq53ya2_`"]
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_modules_headlamp_nix["`**modules/headlamp.nix**

_2zzzl5zan4r4f63dc2rpykacwdq53ya2_`"]
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_modules_tmux_nix["`**modules/tmux.nix**

_2zzzl5zan4r4f63dc2rpykacwdq53ya2_`"]
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_2zzzl5zan4r4f63dc2rpykacwdq53ya2_`"]
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_2zzzl5zan4r4f63dc2rpykacwdq53ya2_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules["`**modules**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_build_tarball_nix["`**modules/build-tarball.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_interop_nix["`**modules/interop.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_recovery_nix["`**modules/recovery.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd["`**modules/systemd**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd_native["`**modules/systemd/native**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_usbip_nix["`**modules/usbip.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_version_nix["`**modules/version.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_welcome_nix["`**modules/welcome.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_w564ly7c5pyqdrq90jspfl8298cdsd04_`"]
    nyhlmpkjvrq70mh2kmg8d9bnzg93pwqia_flake_nix --> nj7y1iz0mz04jgvg8x7skqszv3yhs2ma4_module_nix
    nyhlmpkjvrq70mh2kmg8d9bnzg93pwqia_flake_nix --> n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops
    nyhlmpkjvrq70mh2kmg8d9bnzg93pwqia_flake_nix --> nf0mhsmc31kldm4b8b9fp9ncavzvs4f66_nixos
    nyhlmpkjvrq70mh2kmg8d9bnzg93pwqia_flake_nix --> n2zzzl5zan4r4f63dc2rpykacwdq53ya2_global_nix
    nyhlmpkjvrq70mh2kmg8d9bnzg93pwqia_flake_nix --> n2zzzl5zan4r4f63dc2rpykacwdq53ya2_configurations_nixos
    nyhlmpkjvrq70mh2kmg8d9bnzg93pwqia_flake_nix --> n2zzzl5zan4r4f63dc2rpykacwdq53ya2_machines_nixos_wsl_nixos
    nj7y1iz0mz04jgvg8x7skqszv3yhs2ma4_module_nix --> nj7y1iz0mz04jgvg8x7skqszv3yhs2ma4_lib_make_disk_image_nix
    n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops --> n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops_templates
    n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops --> n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops_secrets_for_users
    nf0mhsmc31kldm4b8b9fp9ncavzvs4f66_nixos --> nf0mhsmc31kldm4b8b9fp9ncavzvs4f66_nixos_common_nix
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_configurations_nixos --> n2zzzl5zan4r4f63dc2rpykacwdq53ya2_modules_docker_nix
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_configurations_nixos --> n2zzzl5zan4r4f63dc2rpykacwdq53ya2_modules_headlamp_nix
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_configurations_nixos --> n2zzzl5zan4r4f63dc2rpykacwdq53ya2_modules_tmux_nix
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_machines_nixos_wsl_nixos --> n2zzzl5zan4r4f63dc2rpykacwdq53ya2_machines_nixos_wsl_nixos_hardware_configuration_nix
    n2zzzl5zan4r4f63dc2rpykacwdq53ya2_machines_nixos_wsl_nixos --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_build_tarball_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_docker_desktop_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_interop_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_recovery_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_ssh_agent_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_usbip_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_version_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_welcome_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_wsl_conf_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_wsl_distro_nix
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd_native
    nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd_native --> nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd_native_wrap_shell_nix
    style nyhlmpkjvrq70mh2kmg8d9bnzg93pwqia_flake_nix fill:#e5c6b2,color:#000000
    style nj7y1iz0mz04jgvg8x7skqszv3yhs2ma4_module_nix fill:#bde5b2,color:#000000
    style nj7y1iz0mz04jgvg8x7skqszv3yhs2ma4_lib_make_disk_image_nix fill:#bde5b2,color:#000000
    style n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops fill:#bde5b2,color:#000000
    style n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops_templates fill:#bde5b2,color:#000000
    style n10kb907xqx9ccbq1smz2kzc45xqsj1h0_modules_sops_secrets_for_users fill:#bde5b2,color:#000000
    style nf0mhsmc31kldm4b8b9fp9ncavzvs4f66_nixos fill:#b2e5d0,color:#000000
    style nf0mhsmc31kldm4b8b9fp9ncavzvs4f66_nixos_common_nix fill:#b2e5d0,color:#000000
    style n2zzzl5zan4r4f63dc2rpykacwdq53ya2_global_nix fill:#e5b2d3,color:#000000
    style n2zzzl5zan4r4f63dc2rpykacwdq53ya2_configurations_nixos fill:#e5b2d3,color:#000000
    style n2zzzl5zan4r4f63dc2rpykacwdq53ya2_modules_docker_nix fill:#e5b2d3,color:#000000
    style n2zzzl5zan4r4f63dc2rpykacwdq53ya2_modules_headlamp_nix fill:#e5b2d3,color:#000000
    style n2zzzl5zan4r4f63dc2rpykacwdq53ya2_modules_tmux_nix fill:#e5b2d3,color:#000000
    style n2zzzl5zan4r4f63dc2rpykacwdq53ya2_machines_nixos_wsl_nixos fill:#e5b2d3,color:#000000
    style n2zzzl5zan4r4f63dc2rpykacwdq53ya2_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#e5b2d3,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_build_tarball_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_docker_desktop_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_interop_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_recovery_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_ssh_agent_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd_native fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_systemd_native_wrap_shell_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_usbip_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_version_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_welcome_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_wsl_conf_nix fill:#c8b2e5,color:#000000
    style nw564ly7c5pyqdrq90jspfl8298cdsd04_modules_wsl_distro_nix fill:#c8b2e5,color:#000000
```
