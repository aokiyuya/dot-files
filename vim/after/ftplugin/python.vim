" Configuration for python
" Author: Yuya Aoki

set modeline
set nobackup
set showmatch
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set tabstop=4
" set columns=80
set expandtab shiftwidth=4
set softtabstop=4
set path+=":/usr/local/Cellar/opencv/2.4.12_2/lib/python2.7/site-packages/"
set listchars=tab:>-,extends:<,trail:-

if has('python3')
  setlocal omnifunc=python3complete#Complete
endif
if has('python')
  setlocal omnifunc=pythoncomplete#Complete
endif



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
	execute s:python_fold_path
endfunction

