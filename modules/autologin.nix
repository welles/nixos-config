{user, ...}: {
  services.displayManager.autoLogin = {
    enable = true;
    inherit user;
  };
}
