# Opens the Claude Desktop instance of every account in `claudeAccounts`
# (claude-desktop-accounts.nix) when the desktop session starts, so each
# account is ready for Remote Control sessions from claude.ai without
# opening the app by hand. The multi-account counterpart of
# claude-desktop-autostart.nix; import only one of the two. On hosts used
# only over RDP, combine with xrdp-boot-session.nix, which starts the
# session at boot.
{
  lib,
  claudeAccounts,
  ...
}: {
  imports = [./claude-desktop-accounts.nix];

  environment.etc = lib.listToAttrs (map (account: {
      name = "xdg/autostart/claude-desktop-${account.id}.desktop";
      value.text = ''
        [Desktop Entry]
        Type=Application
        Name=Claude (${account.name})
        Exec=claude-desktop-${account.id}
        StartupNotify=false
        Terminal=false
      '';
    })
    claudeAccounts);
}
