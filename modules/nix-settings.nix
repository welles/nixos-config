_: {
  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://welles-nixos-config.cachix.org"];
      trusted-public-keys = ["welles-nixos-config.cachix.org-1:vCSK0/NERCDRPEsW6yCjweDx4Xw7O11j7nEUkwvUA5o="];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };
}
