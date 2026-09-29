{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  mercurial,
}:
buildPythonPackage (finalAttrs: {
  pname = "mercurial-extension-utils";
  version = "1.5.3";
  pyproject = true;

  src = fetchPypi {
    pname = "mercurial_extension_utils";
    inherit (finalAttrs) version;
    hash = "sha256-f1P+DdzYk5cIyNYN+j0HCE1SOr8L0mYOW8/OpNH1EqM=";
  };

  build-system = [setuptools];

  # Mercurial itself is provided by whichever `hg` loads the extension.
  nativeCheckInputs = [mercurial];
  pythonImportsCheck = ["mercurial_extension_utils"];

  meta = {
    description = "Mercurial Extension Utils";
    homepage = "https://foss.heptapod.net/mercurial/mercurial-extension_utils";
    license = lib.licenses.bsd3;
  };
})
