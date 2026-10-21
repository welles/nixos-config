{
  pkgs,
  sopsAgeKeyFile,
  ...
}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "sops-edit" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.sops pkgs.coreutils]}:$PATH
      key_file=${pkgs.lib.escapeShellArg sopsAgeKeyFile}
      ${builtins.readFile ./sops-edit.sh}
    '')
  ];
}
