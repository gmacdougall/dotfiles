fish_vi_key_bindings
source ~/.config/fish/tide.fish

abbr -a -U -- dc docker-compose
abbr -a -U -- ds devspace
abbr -a -U -- g git
abbr -a -U -- gaa git commit -a --amend
abbr -a -U -- gcm "git checkout (git_main_branch)"
abbr -a -U -- cr checkout_recent_branches
abbr -a -U -- gp git push -u origin HEAD
abbr -a -U -- grim "git rebase -i (git_origin_main_branch)"
abbr -a -U -- grm "git rebase (git_origin_main_branch)"
abbr -a -U -- rc bin/rails console
abbr -a -U -- rs bin/rails server
abbr -a -U -- v vagrant
abbr -a -U -- vp vagrant provision
abbr -a -U -- vs vagrant ssh
abbr -a -U -- vu vagrant up
abbr -a -U -- y yarn

# I install packages at different places in arch
if test -e /usr/bin/pacman
  set -U CHRUBY_ROOT /usr
else
  set -U CHRUBY_ROOT $HOME/.local
end

set fish_greeting
fzf_configure_bindings --git_status=\cs --git_log=\ch --directory=\cf

set -gx GPG_TTY (tty)
set -gx FZF_DEFAULT_COMMAND "fd --type f"
set -gx EDITOR vim

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.deno/bin
fish_add_path $HOME/.local/bin

alias vf="vim -c ':Telescope find_files'"
alias checkout_recent_branches="git checkout (git recentb | fzf --ansi --cycle --layout=reverse --border --height=85% --preview=\"git log -10 --stat --color (echo {} | cut -d ' ' -f1)\" | cut -d ' ' -f1)"

function git_main_branch
  if test $GIT_MAIN_BRANCH_NAME
    echo $GIT_MAIN_BRANCH_NAME
  else
    git branch | cut -c 3- | grep -E '^development$|^main$|^master$' | head -n 1
  end
end

function git_origin_main_branch
  echo "origin/"(git_main_branch)
end
