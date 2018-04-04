set nu
set noswapfile
colorscheme elflord
syntax on

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


