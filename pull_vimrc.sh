#!/bin/sh
cd ~/dot-files/
git fetch
git merge origin/master

cp ~/dot-files/.vimrc ~/.vimrc
cp -rf ~/dot-files/.vim/ ~/.vim/
cp ~/dot-files/.latexmkrc ~/.latexmkrc
