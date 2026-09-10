{
  lib,
  user,
  persistRoot ? null,
  ...
}: {
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [
      "Desktop"
      "Documents"
      "Downloads"
      "Music"
      "Pictures"
      "Videos"
    ];
  };

  home-manager.sharedModules = [
    {
      xdg.userDirs = {
        enable = true;
        createDirectories = true;
        setSessionVariables = false;
        documents = "$HOME/Documents";
        download = "$HOME/Downloads";
        music = "$HOME/Music";
        pictures = "$HOME/Pictures";
        videos = "$HOME/Videos";
        desktop = "$HOME/Desktop";
        publicShare = "$HOME/Public";
        templates = "$HOME/Templates";
      };
    }
  ];
}
