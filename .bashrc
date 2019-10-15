# For git
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
# $(__git_ps1)

function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="\n$GREENBOLD\D{} $PURPLE@ $BLUEBOLD\w $CYAN$(parse_git_branch_and_add_brackets)\n $RESETCOLOR → "
  export PS2=" | → $RESETCOLOR"

  # use \$(parse_git_branch_and_add_brackets) for macOS (backslash at the beginning)
  #export PS1="$GREENBOLD\u@\h$RESETCOLOR:$BLUEBOLD\w$CYAN$(parse_git_branch_and_add_brackets)$RESETCOLOR\$ "
  # or
  #export PS1="${debian_chroot:+($debian_chroot)}$GREENBOLD[\u@\h$WHITEBOLD \W$GREENBOLD]\$$RESETCOLOR "
  #export PS1="${debian_chroot:+($debian_chroot)}$GREENBOLD\u@\h$RESETCOLOR:$BLUEBOLD \W$CYAN$(parse_git_branch_and_add_brackets) $RESETCOLOR>> "
}
prompt

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

HISTSIZE=1000
HISTCONTROL=erasedups
PROMPT_COMMAND="history -a"
export HISTSIZE HISTCONTROL PROMPT_COMMAND
shopt -s histappend

# Add Golang to PATH
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

# export GOPATH=$HOME/golang:$HOME/Downloads/goeg

# Add Rebar to PATH                                                                                                     
export PATH=$PATH:$HOME/.cache/rebar3/bin

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
source $HOME/.rvm/scripts/rvm

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

pstrace() {
  ps auxw | fgrep -i "$1" | fgrep -v "fgrep" | awk '{print"-p " $2}' | xargs sudo strace -v -ttt -f ${*:2} 2>&1
}
