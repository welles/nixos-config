{pkgs, ...}: {
  environment.systemPackages = [pkgs.sqlcmd];
}
