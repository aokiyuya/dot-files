" it is settings for markdown


augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" set to open browser
let g:previm_open_cmd = 'open -a Safari'

" open preview type Ctrl - p
nnoremap <silent><C-p> :PrevimOpen<CR>

" 
let g:vim_markdown_folding_disabled=1




