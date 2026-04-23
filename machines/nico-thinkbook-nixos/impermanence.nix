# Impermanence Configuration
{user, ...}: {
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
    users.${user} = {
      files = [
        ".claude.json"
        ".config/dolphinrc"
        ".config/lazygit/config.yml"
        ".zsh_history"
      ];
      directories = [
        ".ssh"
        ".claude"
        ".gemini"
        ".config/Bitwarden"
        ".config/Code"
        ".config/google-chrome"
        ".config/mozilla/firefox"
        ".config/smartgit"
        ".local/share/dolphin"
        ".local/share/kwalletd"
        ".local/share/Steam"
        ".local/share/bottles"
        ".local/share/PrismLauncher"
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
