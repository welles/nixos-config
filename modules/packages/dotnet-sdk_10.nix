{pkgs, ...}: {
  environment = {
    systemPackages = [pkgs.dotnet-sdk_10];
    sessionVariables.DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
  };

  # Global tools installed with `dotnet tool install -g`.
  home-manager.sharedModules = [
    ({config, ...}: {
      home.sessionPath = ["${config.home.homeDirectory}/.dotnet/tools"];
    })
  ];
}
