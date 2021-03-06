#! /bin/bash

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
  return
fi

export PATH=$PATH:/bin:~/bin:.:~/.cargo/bin

if [ -f /etc/bashrc ]; then
    . /etc/bashrc   # --> Read /etc/bashrc, if present.
elif [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc   # --> Read /etc/bash.bashrc, if present.
fi

export USER=${USER:-$LOGNAME}

set -o vi
set -o ignoreeof
set -o notify
# BOLD='\e[1'
# GREEN='\e[38;5;82m\]'
# RED='\e[38;5;196m\]'
# GOLD='\e[38;5;220m\]'
# BLUE='\e[38;5;27m\]'
# CYAN='\e[38;5;51m\]'
# RESET='\e[0m\]'

stty erase 

unset PROMPT_COMMAND
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

if [[ "$TERM" =~ 256color ]]; then
  if [ $(id -u) -eq 0 ]
  then
    PS1='\[\e[38;5;220m\][\[\e[0m\]\[\e[38;5;196m\]\u\[\e[0m\]\[\e[38;5;220m\]@\[\e[0m\]\[\e[38;5;196m\]\h\[\e[0m\]\[\e[38;5;220m\]]\[\e[0m\]\[\e[38;5;34m\]: \[\e[0m\]\[\e[38;5;27m\]\w\[\e[0m\] $ '
    export PROMPT_COMMAND="history -n; history -w; history -c; history -r;"
  else
    if [ -n "$SSH_CLIENT" ];
    then
      PROMPT_COMMAND='history -n; history -w; history -c; history -r; __git_ps1 "\[\e[38;5;220m\][\[\e[0m\]\[\e[38;5;34m\]\u\[\e[0m\]\[\e[38;5;220m\]@\[\e[0m\]\[\e[38;5;196m\]\h\[\e[0m\]\[\e[38;5;220m\]]\[\e[0m\]\[\e[38;5;34m\]: \[\e[0m\]\[\e[38;5;27m\]\w\[\e[0m\]\[\e[38;5;51m\]" "\[\e[0m\]\n$ "'
    else
      # The comment below shows the equivalent PS1 that we're going for here.
      # The prompt_pre and prompt_post strings below will be passed to the
      # __git_ps1 function by the PROMPT_COMMAND.
      # Updating the prompt in PROMPT_COMMAND is considerably faster than just
      # setting PS1 to call __git_ps1 directly.

      # \[\e[38;5;220m\][<-           gold "["
      # \[\e[0m\]<-                   Reset
      # \[\e[38;5;34m\]\u<-           Green "\u"
      # \[\e[38;5;220m\]@<-           gold "@"
      # \[\e[0m\]                     Reset
      # \[\e[38;5;34m\]\h<-           Green "\u"
      # \[\e[38;5;220m\]]<-           gold "]"
      # \[\e[0m\]                     Reset
      # \[\e[38;5;34m\]: <-           Green ": "
      # \[\e[38;5;27m\]\w <-          Blue "\w "
      # \[\e[38;5;51m\]__git_ps1<-    Cyan "Git Status"
      # \[\e[0m\]                     Reset
      # \n$ <-                        "\n$ "

      PROMPT_COMMAND='history -n; history -w; history -c; history -r; __git_ps1 "\[\e[38;5;220m\][\[\e[0m\]\[\e[38;5;34m\]\u\[\e[0m\]\[\e[38;5;220m\]@\[\e[0m\]\[\e[38;5;34m\]\h\[\e[0m\]\[\e[38;5;220m\]]\[\e[0m\]\[\e[38;5;34m\]: \[\e[0m\]\[\e[38;5;27m\]\w\[\e[0m\]\[\e[38;5;51m\]" "\[\e[0m\]\n$ "'
    fi
  fi
else
  PS1='\[\e[034m\]\u@\h\[\e[00m\]:\[\e[034m\]\w\[\e[0m\]\$ '
  export PROMPT_COMMAND="history -n; history -w; history -c; history -r;"
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export PS1
# These seem to break color coding ...
# export GIT_PS1_SHOWCOLORHINTS=1
# export GIT_PS1_SHOWDIRTYSTATE=1

export OS=`/bin/uname`
# export OSNAME=`/bin/uname -s`
export PROC=`/bin/uname -m`

# export JBOSS_HOME=/usr/share/wildfly
# export JAVA_HOME=/usr/lib/jvm/java
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
# export PATH=$JAVA_HOME/bin:$PATH:~/.linuxbrew/bin
# export PATH=$JAVA_HOME/bin:$PATH
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
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f  ~/.todo/todo_completion ]; then
  source ~/.todo/todo_completion
fi

unset MAILCHECK        # Don't want my shell to warn me of incoming mail.
# umask 022

# configs specific to the work environment that I neither need nor want elsewhere.
if [ -f ~/.workrc ]; then
    . ~/.workrc   # --> Read /etc/bashrc, if present.
fi

# Different distros install this in different places.
if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
  source /usr/share/fzf/shell/key-bindings.bash
else
  if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
  else
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  fi
fi


shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize
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

