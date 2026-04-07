# NixOS Configuration Graphs

## eltern-asus-nixos

```mermaid
flowchart TD
    nvf11abdk0qnfiziv8a6qr8niri43bhln_flake_nix["`**flake.nix**

_vf11abdk0qnfiziv8a6qr8niri43bhln_`"]
    n3sp8k7ffad9w1gzrknkbdgvwwyh78h9v_module_nix["`**module.nix**

_3sp8k7ffad9w1gzrknkbdgvwwyh78h9v_`"]
    n3sp8k7ffad9w1gzrknkbdgvwwyh78h9v_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_3sp8k7ffad9w1gzrknkbdgvwwyh78h9v_`"]
    n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops["`**modules/sops**

_2xfgzhii8wisvpd9rpvm980wjj9kmcsv_`"]
    n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops_templates["`**modules/sops/templates**

_2xfgzhii8wisvpd9rpvm980wjj9kmcsv_`"]
    n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_2xfgzhii8wisvpd9rpvm980wjj9kmcsv_`"]
    nan6k8za84ilqj6lbmjd9pmv546q7j2jd_nixos["`**nixos**

_an6k8za84ilqj6lbmjd9pmv546q7j2jd_`"]
    nan6k8za84ilqj6lbmjd9pmv546q7j2jd_nixos_common_nix["`**nixos/common.nix**

_an6k8za84ilqj6lbmjd9pmv546q7j2jd_`"]
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_global_nix["`**global.nix**

_n5vrxh7sijq27lcx7i4617sb8faxx9lc_`"]
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_configurations_eltern["`**configurations/eltern**

_n5vrxh7sijq27lcx7i4617sb8faxx9lc_`"]
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_modules_networkmanager_nix["`**modules/networkmanager.nix**

_n5vrxh7sijq27lcx7i4617sb8faxx9lc_`"]
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_modules_avahi_nix["`**modules/avahi.nix**

_n5vrxh7sijq27lcx7i4617sb8faxx9lc_`"]
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos["`**machines/eltern-asus-nixos**

_n5vrxh7sijq27lcx7i4617sb8faxx9lc_`"]
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos_hardware_configuration_nix["`**machines/eltern-asus-nixos/hardware-configuration.nix**

_n5vrxh7sijq27lcx7i4617sb8faxx9lc_`"]
    nvf11abdk0qnfiziv8a6qr8niri43bhln_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_vf11abdk0qnfiziv8a6qr8niri43bhln_`"]
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos_disk_configuration_nix["`**machines/eltern-asus-nixos/disk-configuration.nix**

_n5vrxh7sijq27lcx7i4617sb8faxx9lc_`"]
    nvf11abdk0qnfiziv8a6qr8niri43bhln_flake_nix --> n3sp8k7ffad9w1gzrknkbdgvwwyh78h9v_module_nix
    nvf11abdk0qnfiziv8a6qr8niri43bhln_flake_nix --> n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops
    nvf11abdk0qnfiziv8a6qr8niri43bhln_flake_nix --> nan6k8za84ilqj6lbmjd9pmv546q7j2jd_nixos
    nvf11abdk0qnfiziv8a6qr8niri43bhln_flake_nix --> nn5vrxh7sijq27lcx7i4617sb8faxx9lc_global_nix
    nvf11abdk0qnfiziv8a6qr8niri43bhln_flake_nix --> nn5vrxh7sijq27lcx7i4617sb8faxx9lc_configurations_eltern
    nvf11abdk0qnfiziv8a6qr8niri43bhln_flake_nix --> nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos
    n3sp8k7ffad9w1gzrknkbdgvwwyh78h9v_module_nix --> n3sp8k7ffad9w1gzrknkbdgvwwyh78h9v_lib_make_disk_image_nix
    n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops --> n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops_templates
    n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops --> n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops_secrets_for_users
    nan6k8za84ilqj6lbmjd9pmv546q7j2jd_nixos --> nan6k8za84ilqj6lbmjd9pmv546q7j2jd_nixos_common_nix
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_configurations_eltern --> nn5vrxh7sijq27lcx7i4617sb8faxx9lc_modules_networkmanager_nix
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_configurations_eltern --> nn5vrxh7sijq27lcx7i4617sb8faxx9lc_modules_avahi_nix
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos --> nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos_hardware_configuration_nix
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos --> nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos_disk_configuration_nix
    nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos_hardware_configuration_nix --> nvf11abdk0qnfiziv8a6qr8niri43bhln_nixos_modules_installer_scan_not_detected_nix
    style nvf11abdk0qnfiziv8a6qr8niri43bhln_flake_nix fill:#e5b2d3,color:#000000
    style n3sp8k7ffad9w1gzrknkbdgvwwyh78h9v_module_nix fill:#bfb2e5,color:#000000
    style n3sp8k7ffad9w1gzrknkbdgvwwyh78h9v_lib_make_disk_image_nix fill:#bfb2e5,color:#000000
    style n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops fill:#b2e5b9,color:#000000
    style n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops_templates fill:#b2e5b9,color:#000000
    style n2xfgzhii8wisvpd9rpvm980wjj9kmcsv_modules_sops_secrets_for_users fill:#b2e5b9,color:#000000
    style nan6k8za84ilqj6lbmjd9pmv546q7j2jd_nixos fill:#b2b2e5,color:#000000
    style nan6k8za84ilqj6lbmjd9pmv546q7j2jd_nixos_common_nix fill:#b2b2e5,color:#000000
    style nn5vrxh7sijq27lcx7i4617sb8faxx9lc_global_nix fill:#e5d4b2,color:#000000
    style nn5vrxh7sijq27lcx7i4617sb8faxx9lc_configurations_eltern fill:#e5d4b2,color:#000000
    style nn5vrxh7sijq27lcx7i4617sb8faxx9lc_modules_networkmanager_nix fill:#e5d4b2,color:#000000
    style nn5vrxh7sijq27lcx7i4617sb8faxx9lc_modules_avahi_nix fill:#e5d4b2,color:#000000
    style nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos fill:#e5d4b2,color:#000000
    style nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos_hardware_configuration_nix fill:#e5d4b2,color:#000000
    style nvf11abdk0qnfiziv8a6qr8niri43bhln_nixos_modules_installer_scan_not_detected_nix fill:#e5b2d3,color:#000000
    style nn5vrxh7sijq27lcx7i4617sb8faxx9lc_machines_eltern_asus_nixos_disk_configuration_nix fill:#e5d4b2,color:#000000
```

## nico-schokoladenelch-nixos

```mermaid
flowchart TD
    nbdhln140mh3gny4r5p35l47c7pr6x2x7_flake_nix["`**flake.nix**

_bdhln140mh3gny4r5p35l47c7pr6x2x7_`"]
    nyqxlhpykpffh38pd5rvk26wy76k57zlj_module_nix["`**module.nix**

_yqxlhpykpffh38pd5rvk26wy76k57zlj_`"]
    nyqxlhpykpffh38pd5rvk26wy76k57zlj_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_yqxlhpykpffh38pd5rvk26wy76k57zlj_`"]
    nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops["`**modules/sops**

_lq64kv01p20s4kl2b5003f6ychqnzwqi_`"]
    nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops_templates["`**modules/sops/templates**

_lq64kv01p20s4kl2b5003f6ychqnzwqi_`"]
    nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_lq64kv01p20s4kl2b5003f6ychqnzwqi_`"]
    nckmk2fg440cwx4sq1f2992525v5nylm0_nixos["`**nixos**

_ckmk2fg440cwx4sq1f2992525v5nylm0_`"]
    nckmk2fg440cwx4sq1f2992525v5nylm0_nixos_common_nix["`**nixos/common.nix**

_ckmk2fg440cwx4sq1f2992525v5nylm0_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_global_nix["`**global.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch["`**configurations/schokoladenelch**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_docker_nix["`**modules/docker.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_networkmanager_nix["`**modules/networkmanager.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_tmux_nix["`**modules/tmux.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_boot_nix["`**configurations/schokoladenelch/boot.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_networking_nix["`**configurations/schokoladenelch/networking.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_services_nix["`**configurations/schokoladenelch/services.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_persistence_nix["`**configurations/schokoladenelch/persistence.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_stacks_default_nix["`**modules/stacks/default.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos["`**machines/nico-schokoladenelch-nixos**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos_hardware_configuration_nix["`**machines/nico-schokoladenelch-nixos/hardware-configuration.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nbdhln140mh3gny4r5p35l47c7pr6x2x7_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_bdhln140mh3gny4r5p35l47c7pr6x2x7_`"]
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos_disk_configuration_nix["`**machines/nico-schokoladenelch-nixos/disk-configuration.nix**

_q7ppp40a0s7vdyzhngz5hqshqgz1g8qp_`"]
    nbdhln140mh3gny4r5p35l47c7pr6x2x7_flake_nix --> nyqxlhpykpffh38pd5rvk26wy76k57zlj_module_nix
    nbdhln140mh3gny4r5p35l47c7pr6x2x7_flake_nix --> nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops
    nbdhln140mh3gny4r5p35l47c7pr6x2x7_flake_nix --> nckmk2fg440cwx4sq1f2992525v5nylm0_nixos
    nbdhln140mh3gny4r5p35l47c7pr6x2x7_flake_nix --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_global_nix
    nbdhln140mh3gny4r5p35l47c7pr6x2x7_flake_nix --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch
    nbdhln140mh3gny4r5p35l47c7pr6x2x7_flake_nix --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos
    nyqxlhpykpffh38pd5rvk26wy76k57zlj_module_nix --> nyqxlhpykpffh38pd5rvk26wy76k57zlj_lib_make_disk_image_nix
    nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops --> nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops_templates
    nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops --> nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops_secrets_for_users
    nckmk2fg440cwx4sq1f2992525v5nylm0_nixos --> nckmk2fg440cwx4sq1f2992525v5nylm0_nixos_common_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_docker_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_networkmanager_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_tmux_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_boot_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_networking_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_services_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_persistence_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_stacks_default_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos_hardware_configuration_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos --> nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos_disk_configuration_nix
    nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos_hardware_configuration_nix --> nbdhln140mh3gny4r5p35l47c7pr6x2x7_nixos_modules_installer_scan_not_detected_nix
    style nbdhln140mh3gny4r5p35l47c7pr6x2x7_flake_nix fill:#e5b2e0,color:#000000
    style nyqxlhpykpffh38pd5rvk26wy76k57zlj_module_nix fill:#e5bfb2,color:#000000
    style nyqxlhpykpffh38pd5rvk26wy76k57zlj_lib_make_disk_image_nix fill:#e5bfb2,color:#000000
    style nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops fill:#e5ddb2,color:#000000
    style nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops_templates fill:#e5ddb2,color:#000000
    style nlq64kv01p20s4kl2b5003f6ychqnzwqi_modules_sops_secrets_for_users fill:#e5ddb2,color:#000000
    style nckmk2fg440cwx4sq1f2992525v5nylm0_nixos fill:#e5b2c7,color:#000000
    style nckmk2fg440cwx4sq1f2992525v5nylm0_nixos_common_nix fill:#e5b2c7,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_global_nix fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_docker_nix fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_networkmanager_nix fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_tmux_nix fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_boot_nix fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_networking_nix fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_services_nix fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_configurations_schokoladenelch_persistence_nix fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_modules_stacks_default_nix fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos fill:#e5b2e3,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos_hardware_configuration_nix fill:#e5b2e3,color:#000000
    style nbdhln140mh3gny4r5p35l47c7pr6x2x7_nixos_modules_installer_scan_not_detected_nix fill:#e5b2e0,color:#000000
    style nq7ppp40a0s7vdyzhngz5hqshqgz1g8qp_machines_nico_schokoladenelch_nixos_disk_configuration_nix fill:#e5b2e3,color:#000000
```

## nico-thinkbook-nixos

```mermaid
flowchart TD
    n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_flake_nix["`**flake.nix**

_32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_`"]
    nfwcyn5jg7m034fy162jxkwq16cvinkk8_module_nix["`**module.nix**

_fwcyn5jg7m034fy162jxkwq16cvinkk8_`"]
    nfwcyn5jg7m034fy162jxkwq16cvinkk8_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_fwcyn5jg7m034fy162jxkwq16cvinkk8_`"]
    ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops["`**modules/sops**

_griynbf1ihr7l9i13hj10b4rjfh0d97q_`"]
    ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops_templates["`**modules/sops/templates**

_griynbf1ihr7l9i13hj10b4rjfh0d97q_`"]
    ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_griynbf1ihr7l9i13hj10b4rjfh0d97q_`"]
    nnqm6zn84bjks7pwdgyjaf2g5dncdfpaz_nixos["`**nixos**

_nqm6zn84bjks7pwdgyjaf2g5dncdfpaz_`"]
    nnqm6zn84bjks7pwdgyjaf2g5dncdfpaz_nixos_common_nix["`**nixos/common.nix**

_nqm6zn84bjks7pwdgyjaf2g5dncdfpaz_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_global_nix["`**global.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico["`**configurations/nico**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_docker_nix["`**modules/docker.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_networkmanager_nix["`**modules/networkmanager.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_pipewire_nix["`**modules/pipewire.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_services_nix["`**configurations/nico/services.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_avahi_nix["`**modules/avahi.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos["`**machines/nico-thinkbook-nixos**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos_hardware_configuration_nix["`**machines/nico-thinkbook-nixos/hardware-configuration.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos_nvidia_gpu_nix["`**machines/nico-thinkbook-nixos/nvidia-gpu.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_eden_nix["`**modules/eden.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_xone_dongle_nix["`**modules/xone-dongle.nix**

_54xasf9kgg0zzjk3aj129m0gc9lklhi6_`"]
    n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_flake_nix --> nfwcyn5jg7m034fy162jxkwq16cvinkk8_module_nix
    n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_flake_nix --> ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops
    n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_flake_nix --> nnqm6zn84bjks7pwdgyjaf2g5dncdfpaz_nixos
    n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_flake_nix --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_global_nix
    n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_flake_nix --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico
    n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_flake_nix --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos
    nfwcyn5jg7m034fy162jxkwq16cvinkk8_module_nix --> nfwcyn5jg7m034fy162jxkwq16cvinkk8_lib_make_disk_image_nix
    ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops --> ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops_templates
    ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops --> ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops_secrets_for_users
    nnqm6zn84bjks7pwdgyjaf2g5dncdfpaz_nixos --> nnqm6zn84bjks7pwdgyjaf2g5dncdfpaz_nixos_common_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_docker_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_networkmanager_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_boot_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_desktop_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_audio_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_virtualisation_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_services_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_packages_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_rclone_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_audio_nix --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_pipewire_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_services_nix --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_avahi_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos_hardware_configuration_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos_nvidia_gpu_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_eden_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos --> n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_xone_dongle_nix
    n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos_hardware_configuration_nix --> n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_nixos_modules_installer_scan_not_detected_nix
    style n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_flake_nix fill:#e5b2c5,color:#000000
    style nfwcyn5jg7m034fy162jxkwq16cvinkk8_module_nix fill:#b2e5c2,color:#000000
    style nfwcyn5jg7m034fy162jxkwq16cvinkk8_lib_make_disk_image_nix fill:#b2e5c2,color:#000000
    style ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops fill:#e5b2cd,color:#000000
    style ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops_templates fill:#e5b2cd,color:#000000
    style ngriynbf1ihr7l9i13hj10b4rjfh0d97q_modules_sops_secrets_for_users fill:#e5b2cd,color:#000000
    style nnqm6zn84bjks7pwdgyjaf2g5dncdfpaz_nixos fill:#b2d1e5,color:#000000
    style nnqm6zn84bjks7pwdgyjaf2g5dncdfpaz_nixos_common_nix fill:#b2d1e5,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_global_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_docker_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_networkmanager_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_boot_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_desktop_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_audio_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_pipewire_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_virtualisation_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_services_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_avahi_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_packages_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_configurations_nico_rclone_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos_hardware_configuration_nix fill:#e5b2bc,color:#000000
    style n32bnv1v1xqgjba5kxgpzfj3a2fccr2nj_nixos_modules_installer_scan_not_detected_nix fill:#e5b2c5,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_machines_nico_thinkbook_nixos_nvidia_gpu_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_eden_nix fill:#e5b2bc,color:#000000
    style n54xasf9kgg0zzjk3aj129m0gc9lklhi6_modules_xone_dongle_nix fill:#e5b2bc,color:#000000
```

## nico-thinkpad-nixos

```mermaid
flowchart TD
    nphbp274f2fkbf7iyps05kxfcall1p1a9_flake_nix["`**flake.nix**

_phbp274f2fkbf7iyps05kxfcall1p1a9_`"]
    nmaglfpag0jq8mn81ddw27qv9scvpmpjp_module_nix["`**module.nix**

_maglfpag0jq8mn81ddw27qv9scvpmpjp_`"]
    nmaglfpag0jq8mn81ddw27qv9scvpmpjp_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_maglfpag0jq8mn81ddw27qv9scvpmpjp_`"]
    najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops["`**modules/sops**

_ajrf7pgqsnm99vywfj84hp30lzx30y3k_`"]
    najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops_templates["`**modules/sops/templates**

_ajrf7pgqsnm99vywfj84hp30lzx30y3k_`"]
    najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_ajrf7pgqsnm99vywfj84hp30lzx30y3k_`"]
    n54w58dvkg91ijlq8mzgg8kf93fqhz9np_nixos["`**nixos**

_54w58dvkg91ijlq8mzgg8kf93fqhz9np_`"]
    n54w58dvkg91ijlq8mzgg8kf93fqhz9np_nixos_common_nix["`**nixos/common.nix**

_54w58dvkg91ijlq8mzgg8kf93fqhz9np_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_global_nix["`**global.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico["`**configurations/nico**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_modules_docker_nix["`**modules/docker.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_modules_networkmanager_nix["`**modules/networkmanager.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_boot_nix["`**configurations/nico/boot.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_desktop_nix["`**configurations/nico/desktop.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_audio_nix["`**configurations/nico/audio.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_modules_pipewire_nix["`**modules/pipewire.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_virtualisation_nix["`**configurations/nico/virtualisation.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_services_nix["`**configurations/nico/services.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_modules_avahi_nix["`**modules/avahi.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_packages_nix["`**configurations/nico/packages.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_rclone_nix["`**configurations/nico/rclone.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos["`**machines/nico-thinkpad-nixos**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_hardware_configuration_nix["`**machines/nico-thinkpad-nixos/hardware-configuration.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    nphbp274f2fkbf7iyps05kxfcall1p1a9_nixos_modules_installer_scan_not_detected_nix["`**nixos/modules/installer/scan/not-detected.nix**

_phbp274f2fkbf7iyps05kxfcall1p1a9_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix["`**machines/nico-thinkpad-nixos/fritzbox-wireguard.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_mobile_network_nix["`**machines/nico-thinkpad-nixos/mobile-network.nix**

_jybk5dpdcx04nbggyyjggk8601imcswf_`"]
    nphbp274f2fkbf7iyps05kxfcall1p1a9_flake_nix --> nmaglfpag0jq8mn81ddw27qv9scvpmpjp_module_nix
    nphbp274f2fkbf7iyps05kxfcall1p1a9_flake_nix --> najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops
    nphbp274f2fkbf7iyps05kxfcall1p1a9_flake_nix --> n54w58dvkg91ijlq8mzgg8kf93fqhz9np_nixos
    nphbp274f2fkbf7iyps05kxfcall1p1a9_flake_nix --> njybk5dpdcx04nbggyyjggk8601imcswf_global_nix
    nphbp274f2fkbf7iyps05kxfcall1p1a9_flake_nix --> njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico
    nphbp274f2fkbf7iyps05kxfcall1p1a9_flake_nix --> njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos
    nmaglfpag0jq8mn81ddw27qv9scvpmpjp_module_nix --> nmaglfpag0jq8mn81ddw27qv9scvpmpjp_lib_make_disk_image_nix
    najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops --> najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops_templates
    najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops --> najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops_secrets_for_users
    n54w58dvkg91ijlq8mzgg8kf93fqhz9np_nixos --> n54w58dvkg91ijlq8mzgg8kf93fqhz9np_nixos_common_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico --> njybk5dpdcx04nbggyyjggk8601imcswf_modules_docker_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico --> njybk5dpdcx04nbggyyjggk8601imcswf_modules_networkmanager_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico --> njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_boot_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico --> njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_desktop_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico --> njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_audio_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico --> njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_virtualisation_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico --> njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_services_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico --> njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_packages_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico --> njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_rclone_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_audio_nix --> njybk5dpdcx04nbggyyjggk8601imcswf_modules_pipewire_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_services_nix --> njybk5dpdcx04nbggyyjggk8601imcswf_modules_avahi_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos --> njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_hardware_configuration_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos --> njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos --> njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_mobile_network_nix
    njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_hardware_configuration_nix --> nphbp274f2fkbf7iyps05kxfcall1p1a9_nixos_modules_installer_scan_not_detected_nix
    style nphbp274f2fkbf7iyps05kxfcall1p1a9_flake_nix fill:#b6b2e5,color:#000000
    style nmaglfpag0jq8mn81ddw27qv9scvpmpjp_module_nix fill:#e5bbb2,color:#000000
    style nmaglfpag0jq8mn81ddw27qv9scvpmpjp_lib_make_disk_image_nix fill:#e5bbb2,color:#000000
    style najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops fill:#b2e5b5,color:#000000
    style najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops_templates fill:#b2e5b5,color:#000000
    style najrf7pgqsnm99vywfj84hp30lzx30y3k_modules_sops_secrets_for_users fill:#b2e5b5,color:#000000
    style n54w58dvkg91ijlq8mzgg8kf93fqhz9np_nixos fill:#c6e5b2,color:#000000
    style n54w58dvkg91ijlq8mzgg8kf93fqhz9np_nixos_common_nix fill:#c6e5b2,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_global_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_modules_docker_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_modules_networkmanager_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_boot_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_desktop_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_audio_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_modules_pipewire_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_virtualisation_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_services_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_modules_avahi_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_packages_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_configurations_nico_rclone_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_hardware_configuration_nix fill:#d1b2e5,color:#000000
    style nphbp274f2fkbf7iyps05kxfcall1p1a9_nixos_modules_installer_scan_not_detected_nix fill:#b6b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_fritzbox_wireguard_nix fill:#d1b2e5,color:#000000
    style njybk5dpdcx04nbggyyjggk8601imcswf_machines_nico_thinkpad_nixos_mobile_network_nix fill:#d1b2e5,color:#000000
```

## nixos-virtualbox-nixos

```mermaid
flowchart TD
    ndwy4dchpcb7mqkq9iimsjrzfyvidnjrg_flake_nix["`**flake.nix**

_dwy4dchpcb7mqkq9iimsjrzfyvidnjrg_`"]
    nf7vzgschlnv7sxk4s2ggb48n7lf3pn5k_module_nix["`**module.nix**

_f7vzgschlnv7sxk4s2ggb48n7lf3pn5k_`"]
    nf7vzgschlnv7sxk4s2ggb48n7lf3pn5k_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_f7vzgschlnv7sxk4s2ggb48n7lf3pn5k_`"]
    nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops["`**modules/sops**

_sssn645f4rmp2rvg8zqrbp0jwx5yvd1y_`"]
    nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops_templates["`**modules/sops/templates**

_sssn645f4rmp2rvg8zqrbp0jwx5yvd1y_`"]
    nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_sssn645f4rmp2rvg8zqrbp0jwx5yvd1y_`"]
    ni8i67zc46bhsj9cahyrly7lc5d0hkx9c_nixos["`**nixos**

_i8i67zc46bhsj9cahyrly7lc5d0hkx9c_`"]
    ni8i67zc46bhsj9cahyrly7lc5d0hkx9c_nixos_common_nix["`**nixos/common.nix**

_i8i67zc46bhsj9cahyrly7lc5d0hkx9c_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_global_nix["`**global.nix**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_configurations_nixos["`**configurations/nixos**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_modules_docker_nix["`**modules/docker.nix**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_modules_headlamp_nix["`**modules/headlamp.nix**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_modules_tmux_nix["`**modules/tmux.nix**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos["`**machines/nixos-virtualbox-nixos**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_hardware_configuration_nix["`**machines/nixos-virtualbox-nixos/hardware-configuration.nix**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_disk_configuration_nix["`**machines/nixos-virtualbox-nixos/disk-configuration.nix**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_boot_nix["`**machines/nixos-virtualbox-nixos/boot.nix**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_desktop_nix["`**machines/nixos-virtualbox-nixos/desktop.nix**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_persistence_nix["`**machines/nixos-virtualbox-nixos/persistence.nix**

_rfihacgdzd9l0f4aiinn23zrbq86wbws_`"]
    ndwy4dchpcb7mqkq9iimsjrzfyvidnjrg_flake_nix --> nf7vzgschlnv7sxk4s2ggb48n7lf3pn5k_module_nix
    ndwy4dchpcb7mqkq9iimsjrzfyvidnjrg_flake_nix --> nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops
    ndwy4dchpcb7mqkq9iimsjrzfyvidnjrg_flake_nix --> ni8i67zc46bhsj9cahyrly7lc5d0hkx9c_nixos
    ndwy4dchpcb7mqkq9iimsjrzfyvidnjrg_flake_nix --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_global_nix
    ndwy4dchpcb7mqkq9iimsjrzfyvidnjrg_flake_nix --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_configurations_nixos
    ndwy4dchpcb7mqkq9iimsjrzfyvidnjrg_flake_nix --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos
    nf7vzgschlnv7sxk4s2ggb48n7lf3pn5k_module_nix --> nf7vzgschlnv7sxk4s2ggb48n7lf3pn5k_lib_make_disk_image_nix
    nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops --> nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops_templates
    nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops --> nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops_secrets_for_users
    ni8i67zc46bhsj9cahyrly7lc5d0hkx9c_nixos --> ni8i67zc46bhsj9cahyrly7lc5d0hkx9c_nixos_common_nix
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_configurations_nixos --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_modules_docker_nix
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_configurations_nixos --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_modules_headlamp_nix
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_configurations_nixos --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_modules_tmux_nix
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_hardware_configuration_nix
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_disk_configuration_nix
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_boot_nix
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_desktop_nix
    nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos --> nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_persistence_nix
    style ndwy4dchpcb7mqkq9iimsjrzfyvidnjrg_flake_nix fill:#e5ceb2,color:#000000
    style nf7vzgschlnv7sxk4s2ggb48n7lf3pn5k_module_nix fill:#b2e3e5,color:#000000
    style nf7vzgschlnv7sxk4s2ggb48n7lf3pn5k_lib_make_disk_image_nix fill:#b2e3e5,color:#000000
    style nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops fill:#bdb2e5,color:#000000
    style nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops_templates fill:#bdb2e5,color:#000000
    style nsssn645f4rmp2rvg8zqrbp0jwx5yvd1y_modules_sops_secrets_for_users fill:#bdb2e5,color:#000000
    style ni8i67zc46bhsj9cahyrly7lc5d0hkx9c_nixos fill:#e2e5b2,color:#000000
    style ni8i67zc46bhsj9cahyrly7lc5d0hkx9c_nixos_common_nix fill:#e2e5b2,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_global_nix fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_configurations_nixos fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_modules_docker_nix fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_modules_headlamp_nix fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_modules_tmux_nix fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_hardware_configuration_nix fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_disk_configuration_nix fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_boot_nix fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_desktop_nix fill:#b2e5c5,color:#000000
    style nrfihacgdzd9l0f4aiinn23zrbq86wbws_machines_nixos_virtualbox_nixos_persistence_nix fill:#b2e5c5,color:#000000
```

## nixos-wsl-nixos

```mermaid
flowchart TD
    n1cpm94sp73w0fzw09w5g5gc7yjyia9sz_flake_nix["`**flake.nix**

_1cpm94sp73w0fzw09w5g5gc7yjyia9sz_`"]
    nfx7ms7xz6w6yj1b2dr9jxscm6sy6qnq0_module_nix["`**module.nix**

_fx7ms7xz6w6yj1b2dr9jxscm6sy6qnq0_`"]
    nfx7ms7xz6w6yj1b2dr9jxscm6sy6qnq0_lib_make_disk_image_nix["`**lib/make-disk-image.nix**

_fx7ms7xz6w6yj1b2dr9jxscm6sy6qnq0_`"]
    nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops["`**modules/sops**

_kbywx8xgw3av1h8a0495gf9fvvas2vx3_`"]
    nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops_templates["`**modules/sops/templates**

_kbywx8xgw3av1h8a0495gf9fvvas2vx3_`"]
    nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops_secrets_for_users["`**modules/sops/secrets-for-users**

_kbywx8xgw3av1h8a0495gf9fvvas2vx3_`"]
    n95fm9x3fi5yjas7fivi3dszwjzg7v1c2_nixos["`**nixos**

_95fm9x3fi5yjas7fivi3dszwjzg7v1c2_`"]
    n95fm9x3fi5yjas7fivi3dszwjzg7v1c2_nixos_common_nix["`**nixos/common.nix**

_95fm9x3fi5yjas7fivi3dszwjzg7v1c2_`"]
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_global_nix["`**global.nix**

_0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_`"]
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_configurations_nixos["`**configurations/nixos**

_0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_`"]
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_modules_docker_nix["`**modules/docker.nix**

_0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_`"]
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_modules_headlamp_nix["`**modules/headlamp.nix**

_0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_`"]
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_modules_tmux_nix["`**modules/tmux.nix**

_0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_`"]
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_machines_nixos_wsl_nixos["`**machines/nixos-wsl-nixos**

_0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_`"]
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_machines_nixos_wsl_nixos_hardware_configuration_nix["`**machines/nixos-wsl-nixos/hardware-configuration.nix**

_0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules["`**modules**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_build_tarball_nix["`**modules/build-tarball.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_docker_desktop_nix["`**modules/docker-desktop.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_interop_nix["`**modules/interop.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_recovery_nix["`**modules/recovery.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_ssh_agent_nix["`**modules/ssh-agent.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd["`**modules/systemd**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd_native["`**modules/systemd/native**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd_native_wrap_shell_nix["`**modules/systemd/native/wrap-shell.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_usbip_nix["`**modules/usbip.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_version_nix["`**modules/version.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_welcome_nix["`**modules/welcome.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_wsl_conf_nix["`**modules/wsl-conf.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_wsl_distro_nix["`**modules/wsl-distro.nix**

_fg8792kj1c37nx2ciq6pqz8831wqgr30_`"]
    n1cpm94sp73w0fzw09w5g5gc7yjyia9sz_flake_nix --> nfx7ms7xz6w6yj1b2dr9jxscm6sy6qnq0_module_nix
    n1cpm94sp73w0fzw09w5g5gc7yjyia9sz_flake_nix --> nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops
    n1cpm94sp73w0fzw09w5g5gc7yjyia9sz_flake_nix --> n95fm9x3fi5yjas7fivi3dszwjzg7v1c2_nixos
    n1cpm94sp73w0fzw09w5g5gc7yjyia9sz_flake_nix --> n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_global_nix
    n1cpm94sp73w0fzw09w5g5gc7yjyia9sz_flake_nix --> n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_configurations_nixos
    n1cpm94sp73w0fzw09w5g5gc7yjyia9sz_flake_nix --> n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_machines_nixos_wsl_nixos
    nfx7ms7xz6w6yj1b2dr9jxscm6sy6qnq0_module_nix --> nfx7ms7xz6w6yj1b2dr9jxscm6sy6qnq0_lib_make_disk_image_nix
    nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops --> nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops_templates
    nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops --> nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops_secrets_for_users
    n95fm9x3fi5yjas7fivi3dszwjzg7v1c2_nixos --> n95fm9x3fi5yjas7fivi3dszwjzg7v1c2_nixos_common_nix
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_configurations_nixos --> n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_modules_docker_nix
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_configurations_nixos --> n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_modules_headlamp_nix
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_configurations_nixos --> n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_modules_tmux_nix
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_machines_nixos_wsl_nixos --> n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_machines_nixos_wsl_nixos_hardware_configuration_nix
    n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_machines_nixos_wsl_nixos --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_build_tarball_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_docker_desktop_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_interop_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_recovery_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_ssh_agent_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_usbip_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_version_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_welcome_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_wsl_conf_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_wsl_distro_nix
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd_native
    nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd_native --> nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd_native_wrap_shell_nix
    style n1cpm94sp73w0fzw09w5g5gc7yjyia9sz_flake_nix fill:#e5b2d0,color:#000000
    style nfx7ms7xz6w6yj1b2dr9jxscm6sy6qnq0_module_nix fill:#e3e5b2,color:#000000
    style nfx7ms7xz6w6yj1b2dr9jxscm6sy6qnq0_lib_make_disk_image_nix fill:#e3e5b2,color:#000000
    style nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops fill:#e5cbb2,color:#000000
    style nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops_templates fill:#e5cbb2,color:#000000
    style nkbywx8xgw3av1h8a0495gf9fvvas2vx3_modules_sops_secrets_for_users fill:#e5cbb2,color:#000000
    style n95fm9x3fi5yjas7fivi3dszwjzg7v1c2_nixos fill:#b2e5c4,color:#000000
    style n95fm9x3fi5yjas7fivi3dszwjzg7v1c2_nixos_common_nix fill:#b2e5c4,color:#000000
    style n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_global_nix fill:#e5b2d7,color:#000000
    style n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_configurations_nixos fill:#e5b2d7,color:#000000
    style n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_modules_docker_nix fill:#e5b2d7,color:#000000
    style n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_modules_headlamp_nix fill:#e5b2d7,color:#000000
    style n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_modules_tmux_nix fill:#e5b2d7,color:#000000
    style n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_machines_nixos_wsl_nixos fill:#e5b2d7,color:#000000
    style n0q2rgfbb0y3jdl7gz1pn3gdskw1agcyb_machines_nixos_wsl_nixos_hardware_configuration_nix fill:#e5b2d7,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_build_tarball_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_docker_desktop_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_interop_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_recovery_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_ssh_agent_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd_native fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_systemd_native_wrap_shell_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_usbip_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_version_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_welcome_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_wsl_conf_nix fill:#e5b2d3,color:#000000
    style nfg8792kj1c37nx2ciq6pqz8831wqgr30_modules_wsl_distro_nix fill:#e5b2d3,color:#000000
```
