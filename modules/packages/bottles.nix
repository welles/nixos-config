{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  # StreamFab and other DVDFab programs need a real system UUID
  imports = [../wine-machine-id.nix];

  environment.systemPackages = [
    (pkgs.bottles.override {
      removeWarningPopup = true;
    })
  ];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/bottles"];
  };
}
