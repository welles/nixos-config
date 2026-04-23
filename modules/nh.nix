_: {
  programs.nh = {
    enable = true;
    flake = "github:welles/nixos-config";
  };

  environment.variables.NH_ARGS = "--refresh";
}
