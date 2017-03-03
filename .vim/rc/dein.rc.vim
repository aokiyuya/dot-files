" shougo-s-githubを参考に改善してみた
" dein settings -----------------------------------------------------
" set cache path
let $CACHE = expand('~/.cache')

" Load dein
" まずは dein の path を通す
set runtimepath+=$CACHE/dein/repos/github.com/Shougo/dein.vim
let s:path = expand('$CACHE/dein')

" deinなければ自動install
if s:path != '' || &runtimepath !~ '/dein.vim'
  if s:path == '' && &runtimepath !~ '/dein.vim'
     let s:path = expand('$CACHE/dein')
    \. '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:path)
      execute '!git clone https://github.com/Shougo/dein.vim' s:path
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:path, ':p') , '/$', '', '')
endif

let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notificiation = 1

" vimrc や toml に更新があれば実行
if !dein#load_state(s:path)
	finish
endif

call dein#begin(s:path, expand('<sfile>'))
call dein#load_toml('~/.vim/rc/dein.toml', {'lazy': 0})
call dein#load_toml('~/.vim/rc/deinlazy.toml', {'lazy': 1})
if has('nvim')
	call dein#load_toml('~/.vim/rc/deineo.toml', {'lazy': 0})
endif

call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"End dein settings------------------------

