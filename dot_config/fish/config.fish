fish_vi_key_bindings
source ~/.config/fish/tide.fish

abbr -a -- cm chezmoi
abbr -a -- dbm bin/rails db:migrate
abbr -a -- dbsd bin/rails db:schema:dump
abbr -a -- dc docker compose
abbr -a -- dep "bundle && yarn && bin/rails db:migrate"
abbr -a -- ds devspace
abbr -a -- g git
abbr -a -- gap git add -p
abbr -a -- grh git reset --hard
abbr -a -- glo git log --oneline --graph -20
abbr -a -- gcaa git commit -a --amend
abbr -a -- gcaf git commit -a --fixup
abbr -a -- gcf git commit --fixup
abbr -a -- gcm "git checkout (git_main_branch)"
abbr -a -- cr checkout_recent_branches
abbr -a -- prc gh pr create
abbr -a -- gpu git push -u origin HEAD
abbr -a -- grim "git rebase -i (git_origin_main_branch)"
abbr -a -- grc git rebase --continue
abbr -a -- grm "git rebase (git_origin_main_branch)"
abbr -a -- rc bin/rails console
abbr -a -- rs bin/rails server
abbr -a -- tgs tmuxp load gs
abbr -a -- tpl tmuxp load
abbr -a -- tzp tmuxp load zp
abbr -a -- v vim
abbr -a -- y yarn

# I install packages at different places in arch
if test -e /usr/bin/pacman
  set -U CHRUBY_ROOT /usr
else if test -e /opt/homebrew/bin/brew
  # rbenv on macos
else
  set -U CHRUBY_ROOT $HOME/.local
end

set fish_greeting
fzf_configure_bindings --git_status=\cs --git_log=\ch --directory=\cf

set -gx GPG_TTY (tty)
set -gx FZF_DEFAULT_COMMAND "fd --type file"
set -gx EDITOR nvim
set -gx AWS_OKTA_BACKEND pass
set -gx RIPGREP_CONFIG_PATH ~/.config/ripgrep/rc

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.deno/bin
fish_add_path $HOME/.local/bin

alias vim="nvim"
alias vf="vim -c ':Telescope find_files'"
alias checkout_recent_branches="git checkout (git recentbranches | fzf --ansi --cycle --layout=reverse --border --height=85% --preview-window=right,80 --preview=\"git log -10 --stat --color (echo {} | cut -d ' ' -f1)\" | cut -d ' ' -f1)"
alias review="gh pr checkout (gh pr list -S 'review-requested:@me' | cat | column -t -s \t | fzf | cut -d' ' -f1)"

function git_main_branch
  if test $GIT_MAIN_BRANCH_NAME
    echo $GIT_MAIN_BRANCH_NAME
  else
    git branch | cut -c 3- | grep -E '^main$|^master$' | head -n 1
  end
end

function git_origin_main_branch
  echo "origin/"(git_main_branch)
end

if test -e /opt/homebrew/opt/mise/bin/mise
  /opt/homebrew/opt/mise/bin/mise activate fish | source
else
  mise activate fish | source
end
