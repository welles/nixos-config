{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  # fabric (imported by `az webapp`) is marked broken with invoke >= 3
  # (https://github.com/fabric/fabric/issues/2376), so pin invoke to 2.x.
  # It has to be pinned for the whole package set, since paramiko depends on
  # invoke too and duplicate versions fail pythonCatchConflictsPhase.
  # pythonPackagesExtensions also reaches azure-cli's own python package set.
  # Drop once fabric supports invoke 3.
  nixpkgs.overlays = [
    (_final: prev: {
      pythonPackagesExtensions =
        prev.pythonPackagesExtensions
        ++ [
          (_pyfinal: pyprev: {
            invoke = pyprev.invoke.overridePythonAttrs {
              version = "2.2.1";
              src = pyprev.fetchPypi {
                pname = "invoke";
                version = "2.2.1";
                hash = "sha256-UVv0m0pIkyt5sCRZA0jaIvOcSULf+ZGtH7i4uuob5wc=";
              };
            };
          })
        ];
    })
  ];

  environment.systemPackages = [pkgs.azure-cli];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".azure"];
  };
}
