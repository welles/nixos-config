{
  lib,
  buildPythonPackage,
  callPackage,
  fetchPypi,
  setuptools,
  keyring,
  mercurial,
}:
buildPythonPackage (finalAttrs: {
  pname = "mercurial-keyring";
  version = "1.4.4";
  pyproject = true;

  src = fetchPypi {
    pname = "mercurial_keyring";
    inherit (finalAttrs) version;
    hash = "sha256-HRE5VcV+MjCVfL5x6JKdl9LH7cg9FjIbe9lfoTvk8wI=";
  };

  build-system = [setuptools];

  dependencies = [
    keyring
    (callPackage ./mercurial-extension-utils.nix {})
  ];

  # Mercurial itself is provided by whichever `hg` loads the extension.
  nativeCheckInputs = [mercurial];
  pythonImportsCheck = ["mercurial_keyring"];

  meta = {
    description = "Mercurial extension to securely save HTTP and SMTP passwords in the system keyring";
    homepage = "https://foss.heptapod.net/mercurial/mercurial_keyring";
    license = lib.licenses.bsd3;
  };
})
