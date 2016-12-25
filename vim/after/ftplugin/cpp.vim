setlocal smartindent
setlocal autoindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal matchpairs+=<:>

setlocal path+=.,/usr/incbude,/usr/local/include,/usr/lib/c++/v1

" Required:
"
"NeoBundle 'Shougo/neoinclude.vim'
"NeoBundle 'justmao945/vim-clang'
"NeoBundle 'Shougo/neocomplete.vim'
"
"if !ostype == "Darwin"
"	echo ostype
"	NeoBundle 'osyo-manga/vim-marching'
"endif
"NeoBundle 'SingleCompile'
"NeoBundle 'vim-jp/cpp-vim',{'autoload' : {'filetypes' : 'cpp'}}
"NeoBundle 'osyo-manga/vim-reunions'

"
" 'Shougo/neocomplete.vim' {{{
let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"""}}}


" 'justmao945/vim-clang' {{{

" disable auto completion for vim-clanG
let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

if executable('clang-3.6')
let g:clang_exec = 'clang-3.6'
elseif executable('clang-3.5')
let g:clang_exec = 'clang-3.5'
elseif executable('clang-3.4')
let g:clang_exec = 'clang-3.4'
else
let g:clang_exec = 'clang'
endif

if executable('clang-format-3.6')
let g:clang_format_exec = 'clang-format-3.6'
elseif executable('clang-format-3.5')
let g:clang_format_exec = 'clang-format-3.5'
elseif executable('clang-format-3.4')
let g:clang_format_exec = 'clang-format-3.4'
else
let g:clang_exec = 'clang-format'
endif

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" }}}

