" jedi setting
let python_major_version = system("python -c 'import sys; print(sys.version_info[0])'")
if python_major_version == 2 && has('python')
    python None
elseif python_major_version == 3 && has('python3')
    python3 None
endif

let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 2
let g:jedi#auto_close_doc = 0


setlocal omnifunc=jedi#completions
setlocal completeopt-=preview

let g:jedi#completions_command = '<C-n>'
let g:jedi#goto_assignments_command = '<C-g>'
let g:jedi#goto_definitions_command = '<C-d>'
let g:jedi#documentation_command = '<C-k>'
let g:jedi#rename_command = '[jedi]r'
let g:jedi#usages_command = '[jedi]n'




if ! dein#tap('neocomplete.vim')
    let g:neocomplete#force_omni_input_patterns.python = '%([^. t].|^s*@|^s*froms.+import |^s*from |^s*import )w*'
endif


