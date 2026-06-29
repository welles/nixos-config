{hostname, ...}: {
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    dates = "daily";
    flake = "github:welles/nixos-config#${hostname}";
  };
}
