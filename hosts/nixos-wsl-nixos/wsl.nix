{user, ...}: {
  wsl = {
    enable = true;
    defaultUser = user;
    interop.includePath = false;
  };

  environment.sessionVariables.DONT_PROMPT_WSL_INSTALL = "true";
}
