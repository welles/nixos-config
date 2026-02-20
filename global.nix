{
  inputs,
  hostname,
  user,
  stateVersion,
  ...
}: {
  networking.hostName = hostname;
  system.stateVersion = stateVersion;

  time = {
    timeZone = "Europe/Berlin";
    hardwareClockInLocalTime = true;
  };
  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs user stateVersion;};
    users.${user} = import ./configurations/${user}/home.nix;
    backupFileExtension = "backup";
    sharedModules = [
      {
        home.username = user;
        home.homeDirectory = "/home/${user}";
        home.stateVersion = stateVersion;
      }
    ];
  };
}
