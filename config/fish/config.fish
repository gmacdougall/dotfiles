starship init fish | source
fish_vi_key_bindings

abbr -a -U -- dc docker-compose
abbr -a -U -- g git

set -U CHRUBY_ROOT $HOME/.local

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
