#!/usr/bin/bash

trap 'echo err' ERR

mkdir -p ~/.cache/dein/
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein/


exit 0

