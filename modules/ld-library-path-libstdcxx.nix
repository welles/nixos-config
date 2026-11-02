# Global LD_LIBRARY_PATH with the C++ runtime (libstdc++), e.g. for .NET
# tooling that loads native libraries outside of nix-ld. A global
# LD_LIBRARY_PATH can break unrelated programs, so this is its own module
# instead of part of dotnet-sdk_10.nix.
{pkgs, ...}: {
  environment.sessionVariables.LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
}
