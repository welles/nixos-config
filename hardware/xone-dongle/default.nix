# Xbox One Wireless Dongle Firmware
#
# Enables the xone kernel driver for Xbox One controllers and
# downloads the official Microsoft firmware for 4 dongle hardware
# revisions (02e6, 02fe, 02f9, 091e) from Windows Update. The
# firmware .cab files are extracted and installed to /lib/firmware/.
{pkgs, ...}: {
  hardware.xone.enable = true;

  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "xone-dongle-firmware";
      nativeBuildInputs = [pkgs.cabextract];
      dontBuild = true;
      dontConfigure = true;
      dontUnpack = true;

      installPhase = let
        firmwareList = [
          {
            url = "https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/03/2ea9591b-f751-442c-80ce-8f4692cdc67b_6b555a3a288153cf04aec6e03cba360afe2fce34.cab";
            hash = "sha256-2Jpy6NwQt8TxbVyIf+f1TDTCIAWsHzYHBNXZRiJY7zI=";
            fileName = "FW_ACC_00U.bin";
            targetName = "xone_dongle_02e6.bin";
          }
          {
            url = "https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab";
            hash = "sha256-ZXNqhP9ANmRbj47GAr7ZGrY1MBnJyzIz3sq5/uwPbwQ=";
            fileName = "FW_ACC_00U.bin";
            targetName = "xone_dongle_02fe.bin";
          }
          {
            url = "https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/06/1dbd7cb4-53bc-4857-a5b0-5955c8acaf71_9081931e7d664429a93ffda0db41b7545b7ac257.cab";
            hash = "sha256-kN2R+2dGDTh0B/2BCcDn0PGPS2Wb4PYtuFihhJ6tLuA=";
            fileName = "FW_ACC_CL.bin";
            targetName = "xone_dongle_02f9.bin";
          }
          {
            url = "https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/08/aeff215c-3bc4-4d36-a3ea-e14bfa8fa9d2_e58550c4f74a27e51e5cb6868b10ff633fa77164.cab";
            hash = "sha256-Wo+62VIeWMxpeoc0cgykl2cwmAItYdkaiL5DMALM2PI=";
            fileName = "FW_ACC_BR.bin";
            targetName = "xone_dongle_091e.bin";
          }
        ];

        processFirmware = item: ''
          mkdir -p workdir
          pushd workdir

          echo "Verarbeite ${item.targetName}..."
          cabextract "${pkgs.fetchurl {
            url = item.url;
            hash = item.hash;
          }}"

          mkdir -p $out/lib/firmware
          cp "${item.fileName}" "$out/lib/firmware/${item.targetName}"

          popd
          rm -rf workdir
        '';
      in ''
        ${builtins.concatStringsSep "\n" (map processFirmware firmwareList)}
      '';
    })
  ];
}
