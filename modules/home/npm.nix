{config, ...}: {
  imports = [
    ../scripts/npm-global-install
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.npm-global/bin"
  ];

  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm-global
    save-exact=true
    save-prefix=
  '';
}
