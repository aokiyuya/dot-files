" it is settings for markdown
" syntax on
" au BufRead,BufNewFile *.md set filetype=markdown
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/markdown.toml'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if has('vim_starting')
   if &compatible
      set nocompatible " Be iMproved
   endif
   let &runtimepath = s:dein_repo_dir .",". &runtimepath
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif


let g:previm_open_cmd = 'open -a Safari'

