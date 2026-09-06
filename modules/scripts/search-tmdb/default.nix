{
  pkgs,
  config,
  ...
}: let
  search-tmdb-bin = pkgs.writeShellScriptBin "search-tmdb" ''
    export PATH=${pkgs.lib.makeBinPath [pkgs.curl pkgs.jq pkgs.gnused pkgs.coreutils]}:$PATH
    export TMDB_TOKEN_FILE=${config.sops.secrets."tmdb-api-token".path}
    ${builtins.readFile ./search-tmdb.sh}
  '';
  search-tmdb-completion = pkgs.writeTextFile {
    name = "search-tmdb-completion";
    destination = "/share/zsh/site-functions/_search-tmdb";
    text = builtins.readFile ./search-tmdb.zsh-completion;
  };
in {
  sops.secrets."tmdb-api-token" = {
    sopsFile = ./secrets.yaml;
    mode = "0444";
  };

  environment.systemPackages = [
    (pkgs.symlinkJoin {
      name = "search-tmdb";
      paths = [search-tmdb-bin search-tmdb-completion];
    })
  ];
}
