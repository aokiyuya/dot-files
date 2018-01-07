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
syntax on
syntax keyword pythonEscape self
syntax match pythonFunction /\.*[A-Z]*[a-z_2]\+\ze(/
syntax match pythonOperator /\s*=\s*/
syntax match pythonOperator /\(\.\|,\)/

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
    call Preserve(':silent %!autopep8 -')
endfunction

nnoremap <Leader>: :call Autopep8()<CR>

