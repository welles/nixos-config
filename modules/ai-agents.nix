{
  lib,
  pkgs,
  user,
  persistRoot ? null,
  ...
}: {
  environment.systemPackages = [
    pkgs.antigravity-ide
    pkgs.claude-code
    pkgs.codex
    pkgs.gemini-cli
  ];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user} = {
      files = [".claude.json"];
      directories = [
        ".antigravity"
        ".antigravity-ide"
        ".antigravity-server"
        ".claude"
        ".codex"
        ".config/Antigravity"
        ".config/Antigravity IDE"
        ".gemini"
      ];
    };
  };
}
