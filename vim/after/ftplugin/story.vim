function! Replace_punctuationA() abort
	execute ":%s/．/。/g"
	execute ":%s/，/、/g"
endfunction

nnoremap <Leader>@ :call Replace_punctuation()<CR>


