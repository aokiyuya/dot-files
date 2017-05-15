" jedi setting

if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let major_version = pyenv#python#get_internal_major_version()
    call jedi#force_py_version(major_version)
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
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
let g:jedi#goto_definitions_command = '<C-t>'
let g:jedi#documentation_command = '<C-d>'
let g:jedi#rename_command = '[jedi]r'
let g:jedi#usages_command = '[jedi]n'




if ! dein#tap('neocomplete.vim')
    let g:neocomplete#force_omni_input_patterns.python = '%([^. t].|^s*@|^s*froms.+import |^s*from |^s*import )w*'
endif


