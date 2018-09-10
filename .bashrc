#! /bin/bash

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
  return
fi

export IDEA_HOME=~/bin/idea-IU-181.5281.24
export PATH=$PATH:~/bin:.:$IDEA_HOME/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/bin:~/.cargo/bin

if [ -f ~/.cargo/bin/bat ]; then
  export BAT_CONFIG_DIR="$(bat cache --config-dir)"
fi

if [ -f /etc/bashrc ]; then
    source /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

export USER=${USER:-$LOGNAME}

set -o vi
set -o ignoreeof
set -o notify

# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

stty erase 
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
if [[ "$TERM" =~ 256color ]]; then
  if [ $(id -u) -eq 0 ]
  then
    PS1='\[\e[38;5;214m\][\[\e[1;31m\]\u@\h\[\e[38;5;214m\]]\[\e[1;31m\]: \[\e[1;34m\]\w $\[\e[m\] '
  else
    if [ -n "$SSH_CLIENT" ];
    then
      PS1='\[\e[38;5;214m\][\[\e[1;32m\]\u@\[\e[1;31m\]\h\[\e[38;5;214m\]]\[\e[1;32m\]: \[\e[1;34m\]\w $\[\e[m\] '
    else
      source ~/.git-prompt.sh
      PS1='\[\e[38;5;214m\][\[\e[1;32m\]\u@\h\[\e[38;5;214m\]]\[\e[1;32m\]: \[\e[1;34m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
      # PS1='\[\e[38;5;214m\][\[\e[1;32m\]\u@\h\[\e[38;5;214m\]]\[\e[1;32m\]: \[\e[1;34m\]\w $\[\e[m\] '
    fi
  fi
else
  export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

export OS=`/bin/uname`
# export OSNAME=`/bin/uname -s`
export PROC=`/bin/uname -m`

# export JBOSS_HOME=/usr/share/wildfly
export JAVA_HOME=/usr/java/latest
export PATH=$JAVA_HOME/bin:$PATH
export ANT_HOME=/usr/share/ant

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
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE=exit:ls*:cd:vi:
export HISTSIZE=500
export HISTFILESIZE=500
export HISTAPPEND=TRUE
export PROMPT_COMMAND="history -a; history -n;"
# export PROMPT_COMMAND="history -n; history -w; history -c; history -r;"
# tac $HISTFILE | awk '!x[$0]++' | tac > ~/tmpfile ; ~/tmpfile > $HISTFILE
# rm ~/tmpfile


