" it is settings for markdown


augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" set to open browser
let g:previm_open_cmd = 'open -a Safari'

" open preview type Ctrl - p
" nnoremap <silent><C-p> :PrevimOpen<CR>

" 
let g:vim_markdown_folding_disabled=0




function! BashOut() abort
	let s:cmd = getline('.')
	if s:cmd[0] == '>'
		let s:cmd = s:cmd[1:]
	endif
	let s:result = system(s:cmd)
	execute ":normal o" . s:result
	call append('.', "> ")
	let s:pos = getpos('.')
	let s:pos[1] = s:pos[1] + 1
	call setpos('.', s:pos)
	normal! $
endfunction

function! Previous_command() abort
	let s:now = getline('.')
	echo search(s:now)
	" let s:prev = getline('.')
	execute ":normal S" . s:now
	normal! $
endfunction

nnoremap <Leader>@ :call BashOut()<CR>
nnoremap <C-p> <C-o>:call Previous_command()<CR>
inoremap <C-p> :call Previous_command()<CR>
