{user, ...}: {
  wsl = {
    enable = true;
    defaultUser = user;
    interop.includePath = false;
    ssh-agent.enable = true;
  };
}
