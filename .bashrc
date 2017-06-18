# For git
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
# $(__git_ps1)

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[0;36m\]$(parse_git_branch_and_add_brackets)\[\033[00m\]\$ '
# or
# export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
# export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\] \W\[\033[0;36m\]$(parse_git_branch_and_add_brackets) \[\033[00m\]>> '

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

