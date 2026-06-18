# Impermanence Configuration
_: {
  fileSystems."/persist".neededForBoot = true;

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/bluetooth"
      "/var/lib/NetworkManager"
      "/var/lib/nixos"
      "/var/lib/sops-nix"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
      "/var/log"
    ];
    files = [
      "/etc/adjtime"
      "/etc/machine-id"
    ];
    users.nico = {
      files = [
        ".claude.json"
        ".zsh_history"
        ".config/mimeapps.list"
      ];
      directories = [
        ".ssh"
        ".claude"
        ".gemini"
        ".sourcegit"
        ".config/1Password"
        ".config/Bitwarden"
        ".config/Code"
        ".config/discord"
        ".config/easyeffects"
        ".config/fsearch"
        ".config/google-chrome"
        ".config/kde.org"
        ".config/mozilla/firefox"
        ".local/share/applications"
        ".local/share/dolphin"
        ".local/share/kwalletd"
        ".local/share/remmina"
        ".local/share/Steam"
        ".local/state/wireplumber"
        ".npm-global"
        ".vscode"
        "Desktop"
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Videos"
      ];
    };
  };
}
