#!/bin/sh
cd ~/dot-files/
git fetch
git merge origin/master

cp ~/dot-files/vimrc ~/.vimrc
cp -rf ~/.vim/template/ ~/template/
rm -rf ~/.vim/
cp -rf ~/dot-files/vim/ ~/.vim/
cp -rf ~/template/ ~/.vim/template/
cp ~/dot-files/latexmkrc ~/.latexmkrc
rm -rf ~/template
