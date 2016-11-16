augroup cpp-path
   autocmd!
   autocmd FileType cpp setlocal path=.,/usr/incbude./usr/local/include,/usr/lib/c++/v1
augroup END
if 0 | endif

if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'


NeoBundle 'justmao945/vim-clang'
NeoBundle 'neocomplete.vim'

call neobundle#end()
NeoBundleCheck

NeoBundleLazy 'vim-jp/cpp-vim',{'autoload' : {'filetypes' : 'cpp'}}


"C-lang settings
let g:clang_c_options='-std=c11'
let g:clang_cpp_options='-std=c++1z -stdlib=libc++ --pedantic-errors'


