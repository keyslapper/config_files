#! /bin/bash

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
  return
fi

export PATH=$PATH:/bin:~/bin:.:~/.cargo/bin

if [ -f /etc/bashrc ]; then
    source /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

export USER=${USER:-$LOGNAME}

set -o vi
set -o ignoreeof
set -o notify
# BOLD='\e[1m'
# GREEN='\e[38;5;82m'
# RED='\e[38;5;196m'
# GOLD='\e[38;5;214m'
# BLUE='\e[34m'
# CYAN='\e[38;5;14m'
# RESET='\e[0m'

    # PS1='\[\e[1;38;5;214m\][\[\e[1;31m\]\u@\h\[\e[1;38;5;214m\]]\[\e[1;31m\]: \[\e[1;34m\]\w $\[\e[m\] '

stty erase 

unset PROMPT_COMMAND
source ~/.git-prompt.sh
# export PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
if [[ "$TERM" =~ 256color ]]; then
  if [ $(id -u) -eq 0 ]
  then
    PS1='\[\e[1;38;5;214m\][\[\e[1;31m\]\u@\h\[\e[1;38;5;214m\]]\[\e[1;31m\]: \[\e[1;34m\]\w $\[\e[m\] '
    export PROMPT_COMMAND="history -n; history -w; history -c; history -r;"
  else
    if [ -n "$SSH_CLIENT" ];
    then
      # The PS1 comment below shows the equivalent PS1 that we're going for here.
      # The prompt_pre and prompt_post strings below will be passed to the
      # __git_ps1 function by the PROMPT_COMMAND.
      # Updating the prompt in PROMPT_COMMAND is considerably faster than just
      # setting PS1 to call __git_ps1 directly.
      # PS1='\[\e[1;38;5;214m\][\[\e[1;32m\]\u\[\e[1;38;5;214m\]@\[\e[1;31m\]\h\[\e[38;5;214m\]]\[\e[38;5;82m\]: \[\e[34m\]\w\[\e[38;5;14m\]`__git_ps1`\[\e[0m\]\n$ '
      PROMPT_COMMAND='history -n; history -w; history -c; history -r; __git_ps1 "\[\e[1;38;5;214m\][\[\e[1;32m\]\u\[\e[1;38;5;214m\]@\[\e[1;31m\]\h\[\e[38;5;214m\]]\[\e[38;5;82m\]: \[\e[34m\]\w\[\e[38;5;14m\]" "\[\e[0m\]\n$ "'
    else
      # The PS1 comment below shows the equivalent PS1 that we're going for here.
      # PS1='\[\e[1;38;5;214m\][\[\e[38;5;82m\]\u\[\e[1;38;5;214m\]@\[\e[38;5;82m\]\h\[\e[38;5;214m\]]\[\e[38;5;82m\]: \[\e[34m\]\w\[\e[38;5;14m\]`__git_ps1`\[\e[0m\]\n$ '
      PROMPT_COMMAND='history -n; history -w; history -c; history -r; __git_ps1 "\[\e[1;38;5;214m\][\[\e[38;5;82m\]\u\[\e[1;38;5;214m\]@\[\e[38;5;82m\]\h\[\e[38;5;214m\]]\[\e[38;5;82m\]: \[\e[34m\]\w\[\e[38;5;14m\]" "\[\e[0m\]\n$ "'
    fi
  fi
else
  PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
  export PROMPT_COMMAND="history -n; history -w; history -c; history -r;"
fi

export PS1
# These seem to break color coding ...
# export GIT_PS1_SHOWCOLORHINTS=1
# export GIT_PS1_SHOWDIRTYSTATE=1

export OS=`/bin/uname`
# export OSNAME=`/bin/uname -s`
export PROC=`/bin/uname -m`

# export JBOSS_HOME=/usr/share/wildfly
export JAVA_HOME=/etc/alternatives/jre
# export PATH=$JAVA_HOME/bin:$PATH:~/.linuxbrew/bin
export PATH=$JAVA_HOME/bin:$PATH
# export ANT_HOME=/usr/share/ant

host=`hostname`

# Source local aliases
if [ -f  ~/.alias ]; then
        . ~/.alias
fi

if [ -f /usr/bin/vim ]; then
  export EDITOR=vim
  alias vi='vim'
else
  export EDITOR=vi
fi

if [ -f  /bin/less ]; then
  export PAGER=less
fi

if [ -f  ~/.todo/todo_completion ]; then
  source ~/.todo/todo_completion
fi

unset MAILCHECK        # Don't want my shell to warn me of incoming mail.
# umask 022

# configs specific to the work environment that I neither need nor want elsewhere.
if [ -f ~/.workrc ]; then
    . ~/.workrc   # --> Read /etc/bashrc, if present.
fi

if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
  source /usr/share/fzf/shell/key-bindings.bash
fi


shopt -s histappend
shopt -s cmdhist
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTIGNORE=exit:ls:cd:vi:history*:p4*:su*:
export HISTSIZE=500
export HISTFILESIZE=500
# export HISTAPPEND=TRUE

# tac $HISTFILE | awk '!x[$0]++' | tac > ~/tmpfile ; ~/tmpfile > $HISTFILE
# rm ~/tmpfile

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[5~": history-search-backward'
bind '"\e[6~": history-search-forward'
bind '"\ek": history-search-backward'
bind '"\ej": history-search-forward'

set editing-mode vi
set keymap vi

set blink-matching-paren on
set completion-ignore-case on

cd ~
