{pkgs, ...}: {
  imports = [../../modules/steam.nix];

  environment.systemPackages = with pkgs; [
    openttd-jgrpp
    prismlauncher
    streamcontroller
  ];
}
