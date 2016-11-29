" Configuration for python
" Author: Yuya Aoki


syntax on
set modeline
set nobackup
set showmatch
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set tabstop=4
set columns=80
set expandtab shiftwidth=4
set softtabstop=4
set path+=":/usr/local/Cellar/opencv/2.4.12_2/lib/python2.7/site-packages/"
set listchars=tab:>-,extends:<,trail:-


" <F5>で編集中のファイルを実行
" MATLABと同じショートカット
nmap <F5> :!python %

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.python.toml'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif
   let &runtimepath = s:dein_repo_dir .",". &runtimepath
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#add('davidhalter/jedi-vim', {
			\ 'autoload': {'filetypes': ['python', 'python3', 'djangohtml']}})
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" end of dein code

let python_highlight_all = 1




let g:syntastic_python_checkers = ['pyflakes']

"保存時に自動でチェック
let g:PyFlakeOnWrite = 1

"解析種別を設定
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'

"McCabe複雑度の最大値
let g:PyFlakeDefaultComplexity=10

"visualモードでQを押すと自動で修正
let g:PyFlakeRangeCommand = 'Q'




" autopep 
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    "--ignote=E501: 一行の長さの補正を無視"
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction

" Shift + F でautopep自動修正
nnoremap <S-f> :call Autopep8()<CR>

function! Python_fold_on()
	let s:python_fold_path = ':source ' . g:my_dot_files . '/bundle/jpythonfold.vim/syntax/jpythonfold.vim'
	let s:python_fold_path = ':source ~/anaconda/bin/python'
	execute s:python_fold_path
endfunction


"jedi setting
let python_major_version = system("python -c 'import sys; print(sys.version_info[0])'")
if python_major_version == 2 && has('python')
    python None
elseif python_major_version == 3 && has('python3')
    python3 None
endif


let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1

nnoremap [jedi] <Nop>
xnoremap [jedi] <Nop>
nmap <Leader>j [jedi]
xmap <Leader>j [jedi]

let g:jedi#completions_command = "<C-Space>"    " 補完キーの設定この場合はCtrl+Space
let g:jedi#goto_assignments_command = "<C-g>"   " 変数の宣言場所へジャンプ（Ctrl + g)
let g:jedi#goto_definitions_command = "<C-d>"   " クラス、関数定義にジャンプ（Gtrl + d）
let g:jedi#documentation_command = "<C-k>"      " Pydocを表示（Ctrl + k）
let g:jedi#rename_command = "[jedi]r"
let g:jedi#usages_command = "[jedi]n"
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0

autocmd FileType python setlocal completeopt-=preview

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'


" for w/ neocomplete
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python =
  \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'


