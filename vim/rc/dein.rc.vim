" dein settings -----------------------------------------------------
" set cache path
let $CACHE = expand('~/.cache')

" Load dein
set runtimepath+=$CACHE/dein/repos/github.com/Shougo/dein.vim
let s:path = expand('$CACHE/dein')

" auto install dein
if s:path !=? '' || &runtimepath !~? '/dein.vim'
	if s:path ==? '' && &runtimepath !~? '/dein.vim'
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

" update when vimrc (or dein) changed
" if dein#load_state(s:path)
call dein#begin(s:path, expand('<sfile>'))
call dein#load_toml('~/.vim/rc/dein.toml', {'lazy': 0})
call dein#load_toml('~/.vim/rc/deinlazy.toml', {'lazy': 1})
if has('nvim')
	call dein#load_toml('~/.vim/rc/deineo.toml', {'lazy': 0})
	call dein#load_toml('~/.vim/rc/deineolazy.toml', {'lazy': 1})
	" if dein#tap('deoplete.nvim') && has('nvim')
	if dein#tap('deoplete.nvim')
		call dein#disable('neocomplete.vim')
	endif
endif
call dein#end()
call dein#save_state()
if has('vim_starting') && dein#check_install()
	call dein#install()
endif
" endif

"End dein settings------------------------

