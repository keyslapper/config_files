#!/bin/bash

git_dir=$PWD

mkdir BAK

cd

#TODO: We can probably be smarter about this ...
if [ -f .ackrc ]; then
  mv .ackrc $git_dir/BAK/.
fi
if [ -f .agignore ]; then
  mv .agignore $git_dir/BAK/.
fi
if [ -f .alias ]; then
  mv .alias $git_dir/BAK/.
fi
if [ -f .bashrc ]; then
  mv .bashrc $git_dir/BAK/.
fi
if [ -f .gitconfig ]; then
  mv .gitconfig $git_dir/BAK/.
fi
if [ -f .gitignore ]; then
  mv .gitignore $git_dir/BAK/.
fi
if [ -f .git-prompt.sh ]; then
  mv .git-prompt.sh $git_dir/BAK/.
fi
if [ -f .inputrc ]; then
  mv .inputrc $git_dir/BAK/.
fi
if [ -d .config ]; then
  if [ -d .config/terminator ]; then
    mv .config/terminator $git_dir/BAK/.
  fi
fi
if [ -d .vim ]; then
  mv .vim $git_dir/BAK/.
fi
if [ -f .vimrc ]; then
  mv .vimrc $git_dir/BAK/.
fi

if [ -d .local/share/gnome-shell/icons ]; then
  mv .local/share/gnome-shell/icons $git_dir/BAK/.
fi


ln -s $git_dir/ackrc .ackrc
ln -s $git_dir/agignore .agignore
ln -s $git_dir/alias .alias
ln -s $git_dir/bashrc .bashrc
ln -s $git_dir/gitconfig .gitconfig
ln -s $git_dir/gitignore .gitignore
ln -s $git_dir/git-prompt.sh .git-prompt.sh
ln -s $git_dir/inputrc .inputrc
ln -s $git_dir/vim .vim
ln -s $git_dir/vimrc .vimrc

if [ -d .config ]; then
  cd ~/.config
  ln -s $git_dir/terminator terminator
  cd -
fi

if [ -d bin ]; then
  cd ~/bin
  ln -s $git_dir/bin/* .
  cd -
fi

if [ -d .local/share/gnome-shell ]; then
  cd ~/.local/share/gnome-shell
  ln -s $git_dir/icons .
  cd -
fi


# TODO: take arguments, include an undo, etc.
