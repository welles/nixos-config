{
  lib,
  buildPythonApplication,
  callPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  asciitree,
  bcrypt,
  colorama,
  cryptography,
  fido2,
  flask,
  flask-limiter,
  fpdf2,
  googleapis-common-protos,
  keyring,
  packaging,
  platformdirs,
  prompt-toolkit,
  protobuf,
  psutil,
  pycryptodomex,
  pydantic,
  pyngrok,
  pyperclip,
  python-dotenv,
  requests,
  tabulate,
  textual,
  tzlocal,
  websockets,
  zxcvbn,
}:
buildPythonApplication (finalAttrs: {
  pname = "keepercommander";
  version = "18.1.8";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-e76iSl09AYRmf18rc1yUKhiAegsXwLw4hD51Zos6GVo=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    asciitree
    bcrypt
    colorama
    cryptography
    fido2
    flask
    flask-limiter
    fpdf2
    googleapis-common-protos
    keyring
    packaging
    platformdirs
    prompt-toolkit
    protobuf
    psutil
    pycryptodomex
    pydantic
    pyngrok
    pyperclip
    python-dotenv
    requests
    tabulate
    textual
    tzlocal
    websockets
    zxcvbn
    (callPackage ./keeper-mlkem.nix {})
    (callPackage ./keeper-pam-webrtc-rs.nix {})
    (callPackage ./keeper-secrets-manager-core.nix {})
  ];

  pythonRelaxDeps = ["protobuf"];

  pythonImportsCheck = ["keepercommander"];

  meta = {
    description = "Command-line and SDK interface to Keeper Password Manager";
    homepage = "https://github.com/Keeper-Security/Commander";
    license = lib.licenses.mit;
    mainProgram = "keeper";
    platforms = ["x86_64-linux"];
  };
})
