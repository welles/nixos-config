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
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
    ];
    users.${user} = {
      files = [
        ".claude.json"
        ".config/lazygit/config.toml"
        ".ssh/known_hosts"
        ".zsh_history"
      ];
      directories = [
        ".claude"
        ".gemini"
        ".config/Bitwarden"
        ".config/Code"
        ".config/google-chrome"
        ".config/mozilla/firefox"
        ".local/share/kwalletd"
        ".npm-global"
        ".vscode"
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Videos"
      ];
    };
  };
}
