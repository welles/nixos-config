{config, ...}: {
  home.sessionPath = ["${config.home.homeDirectory}/.dotnet/tools"];
}
