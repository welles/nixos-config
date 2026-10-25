{
  inputs,
  pkgs,
  ...
}: {
  # Taken from stable nixpkgs: on unstable, mcp 2.x marks fastmcp-slim (a
  # dependency of mcp-nixos) as broken. Switch back to pkgs.mcp-nixos once
  # unstable builds it again.
  environment.systemPackages = [
    inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mcp-nixos
  ];
}
