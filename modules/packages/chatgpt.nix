# ChatGPT desktop app (Linux preview): ChatGPT, ChatGPT Work and Codex.
#
# The app brings its own Codex (nixpkgs points it at pkgs.codex), so it does
# not need the CLI module; it only shares ~/.codex with it.
{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  imports = [../codex-state.nix];

  environment.systemPackages = [pkgs.chatgpt];

  # Electron profile; the app is named "Codex" internally.
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".config/Codex"];
  };
}
