#!/bin/sh
cp ~/.vimrc ~/dot-files/vimrc
cp -rf ~/dot-files/vim/template ~/
rm -rf ~/dot-files/vim/
cp -rf ~/.vim ~/dot-files/vim
cp -rf ~/template ~/dot-files/vim/
rm -rf ~/template
cp ~/.latexmkrc ~/dot-files/latexmkrc
cd ~/dot-files/
git add .
git add -u
if $* -eq 0 ; then
  git commit -a -m "change vimrc"
else
  git commit -a -m "$@"
fi
git push origin master
