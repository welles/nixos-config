_: {
  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-39.8.10"
      ];
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
