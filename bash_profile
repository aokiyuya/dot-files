# added by Anaconda2 4.0.0 installer
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/Users/aoki/anaconda/bin:$PATH:/usr/local/Cellar/opencv3/3.1.0_3/lib/python2.7/site-packages/"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH:/usr/local/Cellar/opencv3/3.1.0_3/lib/python2.7/site-packages/:/Users/aoki/anaconda/lib/"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman::$MANPATH"

# virtualenv settings
# export WORKON_HOME=~/.virtualenvs
# . /Users/aoki/anaconda/bin/virtualenvwrapper.sh
# export PATH=/usr/local/share/python:${PATH}
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -la --color'



eval "$(hub alias -s)"
alias vi='/usr/local/bin/vim'
alias tcompile='sh ~/tmp/texCompile.sh'
alias ipython='ipython --colors=linux'

alias mocho_echo='sh ~/mocho_commands/mocho_echo.sh'
alias mocho_init='sh ~/mocho_commands/mocho_init.sh ~/mocho_commands/'
alias mocho_face='cat ~/.face'
alias mocho_talk='sh ~/mocho_commands/mocho_talk.sh'
alias mocho_exit='sh ~/mocho_commands/mocho_exit.sh'

eval $(thefuck --alias)

export CC=clang
export CXX=clang++
export FFLAGS=-ff2c
export PYLINK="import sys; import os; print('-L' + os.path.abspath(os.__file__ + '/../..') + ' -lpython2.' + str(sys.version_info[1]))"
export DYLD_LIBRARY_PATH="/opt/intel/lib/intel64:/opt/intel/lib:/opt/intel/mkl/lib:$DYLD_LIBRARY_PATH"

alias grep='grep --color'


##
# Your previous /Users/aoki/.bash_profile file was backed up as /Users/aoki/.bash_profile.macports-saved_2016-09-09_at_20:53:06
##

# for NeoVim settings
export XDG_CONFIG_HOME="$HOME/.config"

alias MMDAgent='/Users/aoki/MMDAgent_test/MMDAgent-1.6.1/Release/MMDAgent.app/Contents/MacOS/MMDAgent'
alias pullvimrc='sh /Users/aoki/dot-files/pull_vimrc.sh'
alias pushvimrc='sh /Users/aoki/dot-files/push_vimrc.sh'


export HISTSIZE=2000
export HISTCONTROL=ignoredups 



