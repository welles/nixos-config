{pkgs, ...}: {
  environment.systemPackages = [pkgs.lazygit pkgs.delta];

  home-manager.sharedModules = [
    {
      xdg.configFile."lazygit/config.yml".text = ''
        disableStartupPopups: true
        gui:
          nerdFontsVersion: "3"
          promptToReturnFromSubprocess: false
          showIcons: true
        git:
          diffRenderers:
            - colorArg: always
              command: delta --dark --paging=never
          log:
            showGraph: always
      '';
    }
  ];
}
