_: {
  programs.zsh.enable = true;

  users.users.eltern = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "Moni & Gerri";
    extraGroups = ["wheel"];
  };
}
