{
  pkgs,
  config,
  ...
}: {
  sops.secrets."tmdb-api-token" = {
    sopsFile = ./secrets.yaml;
    mode = "0444";
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "search-tmdb" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.curl pkgs.jq pkgs.gnused pkgs.coreutils]}:$PATH
      export TMDB_TOKEN_FILE=${config.sops.secrets."tmdb-api-token".path}
      ${builtins.readFile ./search-tmdb.sh}
    '')
  ];
}
