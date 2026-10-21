_: {
  home-manager.sharedModules = [
    ({config, ...}: {
      home.sessionPath = ["${config.home.homeDirectory}/.dotnet/tools"];
    })
  ];
}
