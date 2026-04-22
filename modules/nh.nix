{hostname, ...}: {
  programs.nh = {
    enable = true;
    # Pull config from GitHub, matching the nixos-switch / nixos-boot aliases.
    flake = "github:welles/nixos-config";
  };

  environment.shellAliases = {
    nh-switch = "nh os switch github:welles/nixos-config#${hostname}";
    nh-boot = "nh os boot github:welles/nixos-config#${hostname}";
  };
}
