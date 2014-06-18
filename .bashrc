#! /bin/bash

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
  return
fi

export PATH=~/bin:.:/bin:/usr/bin:/usr/local/bin:/emc/symsw/bin

if [ -f /etc/bashrc ]; then
    . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

export USER=${USER:-$LOGNAME}

set -o vi
set -o ignoreeof
set -o notify

export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE=exit:ls:cd:vi
export HISTSIZE=400
export HISTAPPEND=TRUE
# export PROMPT_COMMAND="history -n; history -w; history -c; history -r;"
export PROMPT_COMMAND="history -n; history -w;"

stty erase 
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# export PS1='\h:\w\$ '
# export PS1="<\u>:\w/$ "
export OS=`/bin/uname`
# export OSNAME=`/bin/uname -s`
export PROC=`/bin/uname -m`

host=`hostname`

# Source local aliases
if [ -f  ~/.alias ]; then
        . ~/.alias
fi

if [ -f /usr/bin/vim ]; then
  export CVSEDITOR=vim
  export EDITOR=vim
  alias vi='vim'
else
  export CVSEDITOR=vi
  export EDITOR=vi
fi

export DB_FLAG=-ggdb
export DBG_CMP_FLAG=-g3

export PAGER=less

unset MAILCHECK        # Don't want my shell to warn me of incoming mail.
umask 022

# configs specific to the work environment that I neither need nor want elsewhere.
if [ -f ~/.workrc ]; then
    . ~/.workrc   # --> Read /etc/bashrc, if present.
fi

