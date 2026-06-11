_: {
  xdg.configFile."lazygit/config.yml".text = ''
    disableStartupPopups: true
    gui:
      nerdFontsVersion: "3"
      promptToReturnFromSubprocess: false
      showIcons: true
    git:
      pagers:
        - colorArg: always
          pager: delta --dark --paging=never
      log:
        showGraph: always
  '';
}
