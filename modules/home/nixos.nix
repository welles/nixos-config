{
  lib,
  config,
  ...
}: {
  imports = [
    ./cli-tools.nix
    ./git.nix
    ../scripts/npm-global-install
  ];

  home = {
    file.".npmrc".text = ''
      prefix=${config.home.homeDirectory}/.npm-global
      save-exact=true
      save-prefix=
    '';

    sessionPath = [
      "${config.home.homeDirectory}/.npm-global/bin"
      "${config.home.homeDirectory}/.dotnet/tools"
    ];
  };

  programs.git.settings.user.email = lib.mkForce "welles@mentz.net";
}
