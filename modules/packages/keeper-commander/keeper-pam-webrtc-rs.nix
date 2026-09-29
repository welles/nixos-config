{
  lib,
  stdenv,
  autoPatchelfHook,
  buildPythonPackage,
  fetchPypi,
}:
buildPythonPackage (finalAttrs: {
  pname = "keeper-pam-webrtc-rs";
  version = "2.2.4";
  format = "wheel";

  src = fetchPypi {
    pname = "keeper_pam_webrtc_rs";
    inherit (finalAttrs) version;
    format = "wheel";
    dist = "cp38";
    python = "cp38";
    abi = "abi3";
    platform = "manylinux_2_28_x86_64";
    hash = "sha256-fCEm1tby0etYd2eXIv5NEEBAaiBAukPC93QgbXqzEBA=";
  };

  nativeBuildInputs = [autoPatchelfHook];

  buildInputs = [stdenv.cc.cc.lib];

  pythonImportsCheck = ["keeper_pam_webrtc_rs"];

  meta = {
    description = "WebRTC tunnelling library for Keeper PAM";
    homepage = "https://pypi.org/project/keeper-pam-webrtc-rs/";
    license = lib.licenses.mit;
    platforms = ["x86_64-linux"];
    sourceProvenance = [lib.sourceTypes.binaryNativeCode];
  };
})
