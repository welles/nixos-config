{
  lib,
  pkgs,
  user,
  ...
}: let
  nuke = pkgs.buildDotnetGlobalTool {
    pname = "nuke";
    version = "10.1.0";
    nugetName = "nuke.globaltool";

    dotnet-sdk = pkgs.dotnetCorePackages.sdk_10_0;
    nugetHash = "sha256-/7ET0onBQzCmqFzr64XlaS5gE7WD/lhGSRN9jbUdKHw=";

    meta = {
      description = "Cross-platform build automation system";
      homepage = "https://nuke.build";
      downloadPage = "https://www.nuget.org/packages/nuke.globaltool";
      license = pkgs.lib.licenses.mit;
      mainProgram = "nuke";
    };
  };
in {
  environment.systemPackages = [nuke];

  # Prefer the immutable package over a mutable global tool in ~/.dotnet/tools.
  home-manager.users.${user}.home.sessionPath = lib.mkBefore ["${nuke}/bin"];
}
