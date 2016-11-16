#!/bin/sh
cp ~/.vimrc ~/dot-files/
cp -rf ~/.vim/ ~/dot-files/.vim/
cp ~/.latexmkrc ~/dot-files/
cd ~/dot-files/
git add .
git add -u
if [ -z $# ]; then
  git commit -a -m "change vimrc"
else
  git commit -a -m "$*"
fi
git push origin master
