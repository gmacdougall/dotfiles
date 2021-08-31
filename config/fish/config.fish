starship init fish | source
fish_vi_key_bindings

abbr -a -U -- dc docker-compose
abbr -a -U -- g git
abbr -a -U -- gp git push -u origin HEAD

set -U CHRUBY_ROOT $HOME/.local
set -gx GPG_TTY (tty)
set -gx FZF_DEFAULT_COMMAND "fd --type f"
set -gx EDITOR vim

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

alias vf="vim (fzf)"
