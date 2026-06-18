{
  pkgs,
  lib,
  ...
}: let
  pname = "occt";

  src = pkgs.fetchurl {
    url = "https://dl.ocbase.com/linux/per/stable/OCCT";
    hash = "sha256-yvKg/ariuICx5obWzWynbKSl47AL0A/gXsmoPYaaiek=";
    name = "OCCT";
  };

  # OCCT is a self-contained ELF binary that checks for flag files under
  # /opt/occt/ at runtime. We bundle the binary and flags together so the
  # FHS env exposes them at the expected absolute paths.
  occt-env = pkgs.runCommand "occt-env" {} ''
    mkdir -p $out/opt/occt
    install -m 755 ${src} $out/opt/occt/OCCT
    touch $out/opt/occt/disable_update
    touch $out/opt/occt/app_folder_in_home
  '';

  occt = pkgs.buildFHSEnv {
    name = pname;
    targetPkgs = _: [occt-env];
    runScript = "/opt/occt/OCCT";

    meta = with lib; {
      description = "All-in-one stability, stress test, benchmark and monitoring tool for PC";
      homepage = "https://www.ocbase.com/";
      license = licenses.unfree;
      platforms = ["x86_64-linux"];
      mainProgram = pname;
    };
  };
in {
  environment.systemPackages = [occt];
}
