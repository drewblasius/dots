set nu
set noswapfile
set laststatus=2
set noshowmode
colorscheme elflord
syntax on

call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'scrooloose/nerdtree'
call plug#end()

" lightline
if !has('gui_running')
  set t_Co=256
endif

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" NerdTree
map <C-o> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ALE
let g:ale_sign_error = ':('
let g:ale_sign_warning = ':|'




"Python
au BufNewFile,BufRead *.py  set tabstop=4 
au BufNewFile,BufRead *.py  set softtabstop=4 
au BufNewFile,BufRead *.py  set shiftwidth=4 
"au BufNewFile,BufRead *.py   set textwidth=79   For PEPh8rs
au BufNewFile,BufRead *.py  set expandtab 
au BufNewFile,BufRead *.py  set autoindent 
au BufNewFile,BufRead *.py  set fileformat=unix 


"R
au BufNewFile,BufRead *.R  set tabstop=2 
au BufNewFile,BufRead *.R  set softtabstop=2 
au BufNewFile,BufRead *.R  set shiftwidth=2 
au BufNewFile,BufRead *.R  set expandtab 
au BufNewFile,BufRead *.R  set autoindent 
au BufNewFile,BufRead *.R  set fileformat=unix 

"html
au BufNewFile,BufRead *.html  set tabstop=2 
au BufNewFile,BufRead *.html  set softtabstop=2 
au BufNewFile,BufRead *.html  set shiftwidth=2 
au BufNewFile,BufRead *.html  set expandtab 
au BufNewFile,BufRead *.html  set autoindent 
au BufNewFile,BufRead *.html  set fileformat=unix 

"html
au BufNewFile,BufRead *.js  set tabstop=2 
au BufNewFile,BufRead *.js  set softtabstop=2 
au BufNewFile,BufRead *.js  set shiftwidth=2 
au BufNewFile,BufRead *.js  set expandtab 
au BufNewFile,BufRead *.js  set autoindent 
au BufNewFile,BufRead *.js  set fileformat=unix 
