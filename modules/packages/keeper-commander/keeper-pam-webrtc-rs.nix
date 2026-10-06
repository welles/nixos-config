{
  lib,
  stdenv,
  autoPatchelfHook,
  buildPythonPackage,
  fetchPypi,
}:
buildPythonPackage (finalAttrs: {
  pname = "keeper-pam-webrtc-rs";
  version = "2.2.7";
  format = "wheel";

  src = fetchPypi {
    pname = "keeper_pam_webrtc_rs";
    inherit (finalAttrs) version;
    format = "wheel";
    dist = "cp38";
    python = "cp38";
    abi = "abi3";
    platform = "manylinux_2_28_x86_64";
    hash = "sha256-O4Y2eJMfUbMOV727nrqrsv9IzE1F9d1gJn8NoF+CJL4=";
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
