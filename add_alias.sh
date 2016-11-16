#!/usr/local/bin/bash

trap 'echo err' ERR

echo alias pullvimrc=\'sh ~/dot-files/pull_vimrc.sh\' >> ~/.bash_profile
echo alias pushvimrc=\'sh ~/dot-files/push_vimrc.sh\' >> ~/.bash_profile
exit 0

