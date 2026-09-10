{...}: {
  imports = [
    ../../modules/removable-media.nix
    ../../modules/autologin.nix
    ../../modules/packages/steam.nix
    ../../modules/packages/prismlauncher.nix
  ];
}
