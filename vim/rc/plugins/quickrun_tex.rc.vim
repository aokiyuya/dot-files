
""
"" quickrun
""
set visualbell
set vb t_vb=
autocmd FileType plaintex setlocal filetype=tex

if has('vim-quickrun')
  autocmd MyAutoCmd BufWritePost *.tex call quickrun#run()
endif
let g:quickrun_config = {}
let g:quickrun_config.tex = {
            \ 'command' : 'latexmk',
            \ 'cmdopt' : '-pvc',
            \ 'outputter/error/error' : 'quickfix',
            \ 'runner' : 'vimproc',
            \ 'runner/vimproc/updatetime' : 40,
            \ 'exec'      : '%c %o %s',
            \ }
