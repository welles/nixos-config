# FCC unlock for the Quectel RM520N-GL modem (USB ID 2c7c:030a): the modem
# stays offline until the unlock script that ModemManager ships has run.
{pkgs, ...}: {
  imports = [./modemmanager.nix];

  environment.etc."ModemManager/fcc-unlock.d/2c7c:030a" = {
    mode = "0755";
    text = ''
      #!/bin/sh
      export PATH=${pkgs.libmbim}/bin:$PATH
      exec ${pkgs.modemmanager}/share/ModemManager/fcc-unlock.available.d/2c7c:030a "$@"
    '';
  };
}
