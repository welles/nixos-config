# Impermanence Configuration
{user, ...}: {
  fileSystems."/persist".neededForBoot = true;

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
      "/var/lib/sops-nix"
      "/var/lib/bluetooth"
      "/var/lib/NetworkManager"
    ];
    files = [
      "/etc/machine-id"
      "/etc/adjtime"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
    users.${user} = {
      directories = [
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Videos"
        ".config/Bitwarden"
        ".local/share/kwalletd"
        ".config/mozilla/firefox"
        ".config/google-chrome"
        ".local/share/zsh"
        ".npm-global"
        ".claude"
        ".config/Code"
        ".config/.gemini"
        ".vscode"
      ];
    };
  };
}
