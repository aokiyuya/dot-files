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
syntax match pythonOperator /\s*=\s*/
syntax match pythonFunction /\.*[a-z_2]\+\%((\)\@=/

