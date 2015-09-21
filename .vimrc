syntax on
set cursorline
set history=50

autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set autoindent

colorscheme slate

execute pathogen#infect()

"Status line
set laststatus=2
set statusline=%<%F%h%m%r%h%w[%Y\\\%{&ff}]\ [BUFFER=%n]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" illumination on a dark background the text when moving abroad to 80 characters in Ruby/Python/js/C/C++"
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree with F3
map <F3> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" TagBar settings
"map <F4> :TagbarToggle<CR>
"let g:tagbar_autofocus = 0 " autofocus on Tagbar when you open
"autocmd vimenter * TagbarToggle " open a Tagbar automatically when vim starts up
