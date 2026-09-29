{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:
buildPythonPackage (finalAttrs: {
  pname = "keeper-mlkem";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    pname = "keeper_mlkem";
    inherit (finalAttrs) version;
    hash = "sha256-UvRy3yx+vK1kdwzfvBMhu0AUAJ7DL3MaP6oq/Uhw2Dc=";
  };

  build-system = [setuptools];

  pythonImportsCheck = ["mlkem"];

  meta = {
    description = "Fast ML-KEM implementation with C extensions";
    homepage = "https://github.com/Keeper-Security/commander-qrc";
    license = lib.licenses.mit;
  };
})
