{
  config,
  pkgs,
  user,
  ...
}: {
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  environment.persistence."/mnt/bucket/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/systemd/timers"
      "/etc/ssh"
    ];
    files = [
      "/etc/machine-id"
      "/etc/adjtime"
    ];
    users.${user} = {
      directories = [
      ];
      files = [
        ".zsh_history"
      ];
    };
  };

  programs.zsh.enable = true;

  users.users.${user} = {
    description = "Schokoladenelch";
    extraGroups = ["networkmanager" "wheel"];
    hashedPassword = "$6$Zb.Cx7FJDZo/huz/$ZcGBfYXbCxpmBEeJd10XSYobATn3AhHY76GsDt/bVBi2ciu3vgAl2tMvFZo.41S9BOv2xDLKSG9t/.wcn2qA11";
    isNormalUser = true;
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
    ];
  };
}
