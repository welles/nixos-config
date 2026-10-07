{sopsAgeKeyFile ? (builtins.throw "sops-env.nix: set `_module.args.sopsAgeKeyFile` to the sops age key file"), ...}: {
  home.sessionVariables = {
    EDITOR = "code";
    SOPS_EDITOR = "nano";
    SOPS_AGE_KEY_FILE = sopsAgeKeyFile;
  };
}
