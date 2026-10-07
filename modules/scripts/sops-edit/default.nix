{
  pkgs,
  sopsAgeKeyFile ? (builtins.throw "sops-edit: set `_module.args.sopsAgeKeyFile` to the sops age key file"),
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
