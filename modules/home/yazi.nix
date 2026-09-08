{pkgs, ...}: {
  home-manager.sharedModules = [
    {
      programs.yazi = {
        enable = true;
        package = pkgs.yazi;
        enableZshIntegration = true;
        shellWrapperName = "yy";

        extraPackages = with pkgs; [
          chafa
          fd
          ffmpegthumbnailer
          file
          git
          jq
          poppler-utils
          ripgrep
        ];

        keymap.manager.prepend_keymap = [
          {
            on = "<Enter>";
            run = "plugin smart-enter";
            desc = "Enter directory or open file";
          }
          {
            on = "<C-s>";
            run = "shell --block --interactive";
            desc = "Open shell here";
          }
        ];

        plugins = {
          smart-enter = pkgs.yaziPlugins.smart-enter;
          git = {
            package = pkgs.yaziPlugins.git;
            setup = true;
            settings.order = 1500;
          };
        };

        settings = {
          mgr.show_hidden = true;

          plugin.prepend_fetchers = [
            {
              url = "*";
              run = "git";
              group = "git";
            }
            {
              url = "*/";
              run = "git";
              group = "git";
            }
          ];
        };
      };
    }
  ];
}
