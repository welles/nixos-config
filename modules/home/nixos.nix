{config, ...}: {
  imports = [
    ./cli-tools.nix
    ./git.nix
    ../scripts/npm-global-install
  ];

  home = {
    file.".npmrc".text = ''
      prefix=${config.home.homeDirectory}/.npm-global
      prefer-offline=true
      save-exact=true
      save-prefix=
    '';

    sessionPath = [
      "${config.home.homeDirectory}/.npm-global/bin"
      "${config.home.homeDirectory}/.dotnet/tools"
    ];
  };
}
