source /usr/share/zplug/init.zsh
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  #host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  node          # Node.js section
  ruby          # Ruby section
)

export SPACESHIP_GIT_BRANCH_PREFIX=""
export SPACESHIP_NODE_SYMBOL="node-"
export SPACESHIP_RUBY_SYMBOL=""
zplug "denysdovhan/spaceship-prompt", \
  use:"spaceship.zsh", \
  from:"github", \
  as:"theme"

zplug "bobsoppe/zsh-ssh-agent", \
  use:"ssh-agent.zsh", \
  from:"github"

zplug load

spaceship_vi_mode_enable

alias ls="ls --color=auto"
alias vf="vim \$(rg . --color never -l -g '' | fzy)"
alias dc="docker-compose"
alias dcr="docker-compose run"
alias g="git"

export DB_USER='gregor'
export TERM='screen-256color'
export EDITOR='/usr/bin/vim'
eval "$(direnv hook zsh)"
