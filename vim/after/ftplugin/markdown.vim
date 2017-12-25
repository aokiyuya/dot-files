" it is settings for markdown


augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" set to open browser
let g:previm_open_cmd = 'open -a Safari'

" open preview type Ctrl - p
" nnoremap <silent><C-p> :PrevimOpen<CR>

let g:vim_markdown_folding_disabled=0

function! BashOut() abort
	let s:cmd = getline('.')
	if s:cmd[0] == '>'
		let s:cmd = s:cmd[1:]
	endif
	normal! o
	execute ":r! ".s:cmd
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
python3 << PYTHON
prev = history.get_prev_hist()
vim.command('let s:prev = ' + prev)
print(prev)

PYTHON
	execute ":normal S" . s:prev
	normal! $
endfunction

function! InitCommandHist() abort
python3 << PYTHON
import vim
import sys
import os
sys.path.append(os.path.expanduser('~') + '/.vim/after/ftplugin')
import shellnotelib as sn
history = sn.ShellNote()
PYTHON
endfunction

augroup shellnote
	autocmd!
	autocmd VimEnter :call InitCommandHist()<CR>
augroup END

nnoremap <Leader>@ :call BashOut()<CR>
nnoremap <C-p> <C-o>:call Previous_command()<CR>
" inoremap <Leader>[ :call Previous_command()<CR>
