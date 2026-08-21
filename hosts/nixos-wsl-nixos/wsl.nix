{user, ...}: {
  wsl = {
    enable = true;
    defaultUser = user;
    interop.includePath = false;
  };
}
