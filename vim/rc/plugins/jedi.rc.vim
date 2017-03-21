"jedi setting
let python_major_version = system("python -c 'import sys; print(sys.version_info[0])'")
if python_major_version == 2 && has('python')
    python None
elseif python_major_version == 3 && has('python3')
    python3 None
endif

let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1

" for w/ neocomplete
setlocal omnifunc=jedi#completions
" docstring非表示
setlocal completeopt-=preview
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1
let g:jedi#show_call_signatures = 0
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0

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


if !(has('nvim'))
	if !exists('g:neocomplete#force_omni_input_patterns')
		let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_omni_input_patterns.python =
	  \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
endif


