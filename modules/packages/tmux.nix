_: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g mouse on
    '';
  };

  environment.interactiveShellInit = ''
    tmux-run() {
      local prog="$1"
      if ! tmux has-session -t "$prog" 2>/dev/null; then
        tmux new-session -d -s "$prog" "$prog"
      fi
      if [ -n "$TMUX" ]; then
        tmux switch-client -t "$prog"
      else
        tmux attach-session -t "$prog"
      fi
    }
  '';
}
