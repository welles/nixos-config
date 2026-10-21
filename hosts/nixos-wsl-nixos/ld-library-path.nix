# Global LD_LIBRARY_PATH for the .NET tooling on this host. Kept host-local
# on purpose: a global LD_LIBRARY_PATH can break unrelated programs, so it
# is not part of the dotnet-sdk_10 package module.
{pkgs, ...}: {
  environment.sessionVariables.LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
}
