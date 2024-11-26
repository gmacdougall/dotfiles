function refresh_tmux_vars --on-event="fish_preexec"
  if set -q TMUX
    tmux showenv -s | string replace -rf '^((?:SSH|DISPLAY).*?)=(".*?"); export.*' 'set -gx $1 $2' | source
  end
end
