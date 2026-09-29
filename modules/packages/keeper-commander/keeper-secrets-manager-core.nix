{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cryptography,
  requests,
  urllib3,
}:
buildPythonPackage (finalAttrs: {
  pname = "keeper-secrets-manager-core";
  version = "17.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "keeper_secrets_manager_core";
    inherit (finalAttrs) version;
    hash = "sha256-29PCshYKkq7UbC9TVcvXk0kvQ7omA3nXiVfnrXWpas8=";
  };

  build-system = [setuptools];

  dependencies = [
    cryptography
    requests
    urllib3
  ];

  pythonImportsCheck = ["keeper_secrets_manager_core"];

  meta = {
    description = "Keeper Secrets Manager Python SDK";
    homepage = "https://github.com/Keeper-Security/secrets-manager";
    license = lib.licenses.mit;
  };
})
