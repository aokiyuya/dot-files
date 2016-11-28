" my vim settings
" Author: Fujie lab members

set number
set noswapfile
set cmdheight=2
set title
set wildmenu
set smartcase
set hlsearch
set background=dark
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
set list
set listchars=tab:>-,extends:<,trail:-
set backspace=indent,eol,start
set tabstop=4
set ambiwidth=double

set runtimepath+=~/.vim/:~/.vim/ftplugin/
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
let mapleader = ","
autocmd BufNewFile *.py 0r $HOME/.vim/template/template.py
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/template.cpp
autocmd BufNewFile *.sh 0r $HOME/.vim/template/template.sh
autocmd BufNewFile *.tex 0r $HOME/.vim/template/template.tex

nmap	<Space>u [unite]

" OSの判定
if has('win32')
	let ostype = "Win"
elseif has('mac')
	let ostype = "Mac"
else
	let ostype = system("uname")
endif

" put esc-key for delete highlight
nmap <silent> <Esc><Esc> :nohlsearch<CR>

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings -----------------------------------------------------
" dein自体の自動インストール
let s:dein_enabled = 1
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
    call dein#load_toml(s:toml_file)
"    call dein#add('Shougo/unite.vim', {
"        \ 'depends': ['vimproc'],
"        \ 'on_cmd': ['Unite'],
"        \ 'lazy': 1})
    if has('lua')
      call dein#add('Shougo/neocomplete.vim', {
            \ 'on_i': 1,
            \ 'lazy': 1})

      call dein#add('ujihisa/neco-look', {
            \ 'depends': ['neocomplete.vim']})
	endif
      call dein#add('davidhalter/jedi-vim', {
			\ 'autoload': {'filetypes': ['python','python3','djangohtml']}})

  call dein#end()
  call dein#save_state()
endif

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif



" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

if s:dein_enabled && dein#tap("unite.vim")
  nnoremap [unite] <Nop>
  nmap <Leader>u [unite]
  nnoremap <silent> [unite]b :Unite buffer<CR>
endif

"End dein Scripts-------------------------

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree ./
endif

highlight Normal ctermbg=none



" ---------- neocomplete.vim設定 ----------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    " return neocomplete#close_popup() . '\<CR>'
" For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :"\<Space>"

let g:precious_enable_switch_CursorMoved = { '*': 0, 'help': 1 }
autocmd MyAutoCmd InsertEnter * :PreciousSwitch
autocmd MyAutoCmd InsertLeave * :PreciousReset

""
"" quickrun
""
set visualbell
set vb t_vb=
autocmd FileType plaintex setlocal filetype=tex

if has("vim-quickrun")
  autocmd MyAutoCmd BufWritePost *.tex call quickrun#run() 
endif
let g:quickrun_config = {}
let g:quickrun_config.tex = {
            \ 'command' : 'latexmk',
            \ 'cmdopt' : '-pvc',
            \ 'outputter/error/error' : 'quickfix',
            \ "runner" : "vimproc",
            \ "runner/vimproc/updatetime" : 40,
            \ 'exec'      : '%c %o %s',
            \ }



set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 2
let g:nyan_modoki_animation_enabled = 1

colorscheme badwolf
syntax on
