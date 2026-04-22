{hostname, ...}: {
  programs.nh.enable = true;

  environment.shellAliases = {
    nh-switch = "nh os switch github:welles/nixos-config#${hostname}";
    nh-boot = "nh os boot github:welles/nixos-config#${hostname}";
  };
}
